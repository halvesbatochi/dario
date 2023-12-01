//
//  DRProfileViewViewModel.swift
//  dario
//
//  Created by Henrique Alves Batochi on 20/11/23.
//

import Foundation

protocol DRProfileViewViewModelDelegate: AnyObject {
    func drLoginSuccess()
    func drLoginFail()
}

final class DRProfileViewViewModel: NSObject {
    
    weak var delegate: DRProfileViewViewModelDelegate?
    
    // MARK: - Init
    override init() {}
    
    // MARK: - Public methods
    public func login(user: String, password: String) {
        let request = DRRequest(endpoint: .volunteer,
                                pathComponents: [user, password])
        
        DRService.shared.execute(request,
                                 expecting: DRGetLoginVolunteerResponse.self) { [weak self] result in
            switch result {
            case .success(let model):
                
                if model.cd_erro == 0 {
                    guard let id = model.ad002_it_id, 
                          let login = model.ad002_vc_login
                    else {
                        print("Erro ao recuperar id e login")
                        return
                    }
                    let defaults = UserDefaults.standard
                    defaults.set(id, forKey: "idUser")
                    defaults.set(login, forKey: "loginUser")
                    
                    self?.delegate?.drLoginSuccess()
                    
                } else {
                    self?.delegate?.drLoginFail()
                }
                
            case .failure(let error):
                print(String(describing: error))
            }
        }
    }
    
}
