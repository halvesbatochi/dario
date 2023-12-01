//
//  DRCalibrationAlgorithmViewViewModel.swift
//  dario
//
//  Created by Henrique Alves Batochi on 08/10/23.
//

import UIKit

protocol DRPreferenceViewViewModelDelegate: AnyObject {
    func didSelectPreference(_ index: IndexPath)
}

final class DRPreferenceViewViewModel: NSObject {
    
    public weak var delegate: DRPreferenceViewViewModelDelegate?

}

// MARK: - UICollectionViewDataSource, UICollectionViewDelegate, UICallectionViewDelegateFlowLayout
extension DRPreferenceViewViewModel: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DRPreferenceViewCollectionViewCell.cellIdentifier,
                                                            for: indexPath) as? DRPreferenceViewCollectionViewCell else {
            fatalError("Unsupported cell")
        }
        
        switch indexPath.row {
        case 0:
            guard let image = UIImage(named: "KidsIcon") else {
                fatalError("Icon Category not found")
            }
            let viewModel = DRPreferenceViewCollectionViewCellViewModel(iconCategory: image)
            cell.configure(with: viewModel)
            return cell
        case 1:
            guard let image = UIImage(named: "WorldIcon") else {
                fatalError("Icon Category not found")
            }
            let viewModel = DRPreferenceViewCollectionViewCellViewModel(iconCategory: image)
            cell.configure(with: viewModel)
            return cell
        case 2:
            guard let image = UIImage(named: "AdultsIcon") else {
                fatalError("Icon Category not found")
            }
            let viewModel = DRPreferenceViewCollectionViewCellViewModel(iconCategory: image)
            cell.configure(with: viewModel)
            return cell
        case 3:
            guard let image = UIImage(named: "HospitalIcon") else {
                fatalError("Icon Category not found")
            }
            let viewModel = DRPreferenceViewCollectionViewCellViewModel(iconCategory: image)
            cell.configure(with: viewModel)
            return cell
        default:
            guard let image = UIImage(named: "DogIcon") else {
                fatalError("Icon Category not found")
            }
            let viewModel = DRPreferenceViewCollectionViewCellViewModel(iconCategory: image)
            cell.configure(with: viewModel)
            return cell
        }

    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let bounds = UIScreen.main.bounds
        let width = (bounds.width - 30) / 2
        let height = width * 0.75
        
        return CGSize(width: width,
                      height: height )
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        postPreference(indexPath)
    }
    
    func postPreference(_ indexPath: IndexPath) {
        
        guard let id = UserDefaults.standard.string(forKey: "idUser") else {
            return
        }
        
        guard let idInt = Int(id) else {
            return
        }
        
        let pref = DRPreference(ENT_IT_PREF: (indexPath.item + 1),
                                ENT_IT_VOLUNT: idInt)
        let data = try? JSONEncoder().encode(pref)
        
        let url = URL(string: "http://172.171.200.121/preference")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        request.httpBody = data
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                return
            }
            
            do {
                let result = try JSONDecoder().decode(DRPostPreferenceResponse.self, from: data)
                switch result.cd_erro {
                case 0:
                    DispatchQueue.main.async {
                        self.delegate?.didSelectPreference(indexPath)
                    }
                case -1:
                    DispatchQueue.main.async {
                        print("ERRO")
                    }
                default:
                    print("error")
                }
            }
            catch {
                print("Erro")
            }
        }
        task.resume()
    }
}
