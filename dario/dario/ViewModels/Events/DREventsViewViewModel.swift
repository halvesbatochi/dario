//
//  DREventsViewViewModel.swift
//  dario
//
//  Created by Henrique Alves Batochi on 16/09/23.
//

import UIKit

final class DREventsViewViewModel: NSObject {
    
}

// MARK: - UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout
extension DREventsViewViewModel: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DRHeaderEventsViewCollectionViewCell.cellIdentifier,
                                                            for: indexPath
        ) as? DRHeaderEventsViewCollectionViewCell else {
            fatalError("Unsupported cell")
        }
        
        // TODO: Carregando localmente apenas para visualizar durante desenvolvimento - Apagar depois!
        let viewModel = DRHeaderEventsViewCollectionViewCellViewModel(eventDate: "Amanhã",
                                                                      eventHour: "09:00",
                                                                      eventName: "Sabadaço da Adoção",
                                                                      eventInstitutionName: "Cão Amigo",
                                                                      eventDistance: 900,
                                                                      eventCoverURL: nil,
                                                                      eventInstitutionLogoURL: nil)
        cell.configure(with: viewModel)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let bounds = UIScreen.main.bounds
        let width = bounds.width - 30
        let height = 200.0
        return CGSize(width: width,
                      height: height)
    }
}
