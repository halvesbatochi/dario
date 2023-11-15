//
//  DRInstitutionViewViewModel.swift
//  dario
//
//  Created by Henrique Alves Batochi on 13/10/23.
//

import Foundation

protocol DRInstitutionViewViewModelDelegate: AnyObject {
    func drDidFetchInitialInstitutions()
}

final class DRInstitutionViewViewModel: NSObject {
    
    weak var delegate: DRInstitutionViewViewModelDelegate?
    
    private var institutions: [DRInstitution] = [] {
        didSet {
            for institution in institutions {
                let cellViewModel = DRInstitutionTableViewCellViewModel(institution: institution)
                if !cellViewModels.contains(cellViewModel) {
                    cellViewModels.append(cellViewModel)
                }
            }
        }
    }
    
    public private(set) var cellViewModels: [DRInstitutionTableViewCellViewModel] = []
    
    // MARK: - Init
    override init() {}
    
    // MARK: - Public methods
    
    public func institution(at index: Int) -> DRInstitution? {
        guard index < institutions.count, index >= 0 else {
            return nil
        }
        return self.institutions[index]
    }
    
    public func loadCellModel(_ indexPath: IndexPath) -> DRInstitutionTableViewCellViewModel {
        return cellViewModels[indexPath.row]
    }
    
    public func fetchInstitution() {
        
        let temp1 = DRInstitution(id: 1, name: "AACD", district: "Rebouças", city: "Curitiba", biography: "A Associação de Assistência à Criança Deficiente – AACD é uma organização sem fins lucrativos focada em garantir assistência médico-terapêutica em Ortopedia e Reabilitação.\nA Instituição atende pessoas de todas as idades, recebendo pacientes via Sistema Único de Saúde (SUS), planos de saúde e particular.\nAlém do trabalho de excelência com os assistidos, a AACD trabalha políticas internas de responsabilidade social, tendo, inclusive, sido certificada com o selo Great Place to Work (Melhores Empresas para Trabalhar), na categoria Melhores Empresas para Trabalhar para Mulheres. ", logo: "Logo6")
        let temp2 = DRInstitution(id: 2, name: "Hospital Cruz Verde", district: "Centro", city: "Curitiba", biography: "Fundada em 1985 o Asilo Dona Maria visa ser um lar de idosas onde possam encontrar um ambiente acolhedor e com toda a estrutura e cuidados necessários para essa etapa da vida.\n\nAtualmente desenvolvemos parcerias com Instituições de ensino e com grupos formados por cidadãos com o intuito de promover a integração e colaboração da Instituição com a sociedade.\n\nDiversas atividades são desenvolvidas durante o ano e uma infinidade de oportunidades podem ser aproveitadas para construção de uma sociedade mais solidária.", logo: "Logo3")
        let temp3 = DRInstitution(id: 3, name: "Ronald McDonald", district: "Batel", city: "Curitiba", biography: "Fundada em 1985 o Asilo Dona Maria visa ser um lar de idosas onde possam encontrar um ambiente acolhedor e com toda a estrutura e cuidados necessários para essa etapa da vida.\n\nAtualmente desenvolvemos parcerias com Instituições de ensino e com grupos formados por cidadãos com o intuito de promover a integração e colaboração da Instituição com a sociedade.\n\nDiversas atividades são desenvolvidas durante o ano e uma infinidade de oportunidades podem ser aproveitadas para construção de uma sociedade mais solidária.", logo: "Logo4")
        let temp4 = DRInstitution(id: 4, name: "Aldeias Infantis", district: "Bigorrilho", city: "Curitiba", biography: "Fundada em 1985 o Asilo Dona Maria visa ser um lar de idosas onde possam encontrar um ambiente acolhedor e com toda a estrutura e cuidados necessários para essa etapa da vida.\n\nAtualmente desenvolvemos parcerias com Instituições de ensino e com grupos formados por cidadãos com o intuito de promover a integração e colaboração da Instituição com a sociedade.\n\nDiversas atividades são desenvolvidas durante o ano e uma infinidade de oportunidades podem ser aproveitadas para construção de uma sociedade mais solidária.", logo: "Logo5")
        let temp5 = DRInstitution(id: 5, name: "Habitat", district: "Água Verde", city: "Curitiba", biography: "Fundada em 1985 o Asilo Dona Maria visa ser um lar de idosas onde possam encontrar um ambiente acolhedor e com toda a estrutura e cuidados necessários para essa etapa da vida.\n\nAtualmente desenvolvemos parcerias com Instituições de ensino e com grupos formados por cidadãos com o intuito de promover a integração e colaboração da Instituição com a sociedade.\n\nDiversas atividades são desenvolvidas durante o ano e uma infinidade de oportunidades podem ser aproveitadas para construção de uma sociedade mais solidária.", logo: "Logo1")
        let temp6 = DRInstitution(id: 6, name: "Conservação Internacional", district: "Centro", city: "Curitiba", biography: "Fundada em 1985 o Asilo Dona Maria visa ser um lar de idosas onde possam encontrar um ambiente acolhedor e com toda a estrutura e cuidados necessários para essa etapa da vida.\n\nAtualmente desenvolvemos parcerias com Instituições de ensino e com grupos formados por cidadãos com o intuito de promover a integração e colaboração da Instituição com a sociedade.\n\nDiversas atividades são desenvolvidas durante o ano e uma infinidade de oportunidades podem ser aproveitadas para construção de uma sociedade mais solidária.", logo: "Logo2")
        let temp7 = DRInstitution(id: 7, name: "ONG Pescadores Paraná", district: "Boqueirão", city: "Curitiba", biography: "Fundada em 1985 o Asilo Dona Maria visa ser um lar de idosas onde possam encontrar um ambiente acolhedor e com toda a estrutura e cuidados necessários para essa etapa da vida.\n\nAtualmente desenvolvemos parcerias com Instituições de ensino e com grupos formados por cidadãos com o intuito de promover a integração e colaboração da Instituição com a sociedade.\n\nDiversas atividades são desenvolvidas durante o ano e uma infinidade de oportunidades podem ser aproveitadas para construção de uma sociedade mais solidária.", logo: "Logo2")
        let temp8 = DRInstitution(id: 8, name: "Asilo São Vicente de Paula", district: "Cajuru", city: "Curitiba", biography: "Fundada em 1985 o Asilo Dona Maria visa ser um lar de idosas onde possam encontrar um ambiente acolhedor e com toda a estrutura e cuidados necessários para essa etapa da vida.\n\nAtualmente desenvolvemos parcerias com Instituições de ensino e com grupos formados por cidadãos com o intuito de promover a integração e colaboração da Instituição com a sociedade.\n\nDiversas atividades são desenvolvidas durante o ano e uma infinidade de oportunidades podem ser aproveitadas para construção de uma sociedade mais solidária.", logo: "Logo2")
        let temp9 = DRInstitution(id: 9, name: "Lar dos Idosos", district: "Pinheirinho", city: "Curitiba", biography: "Fundada em 1985 o Asilo Dona Maria visa ser um lar de idosas onde possam encontrar um ambiente acolhedor e com toda a estrutura e cuidados necessários para essa etapa da vida.\n\nAtualmente desenvolvemos parcerias com Instituições de ensino e com grupos formados por cidadãos com o intuito de promover a integração e colaboração da Instituição com a sociedade.\n\nDiversas atividades são desenvolvidas durante o ano e uma infinidade de oportunidades podem ser aproveitadas para construção de uma sociedade mais solidária.", logo: "Logo2")
        
        institutions.append(temp1)
        institutions.append(temp2)
        institutions.append(temp3)
        institutions.append(temp4)
        institutions.append(temp5)
        institutions.append(temp6)
        institutions.append(temp7)
        institutions.append(temp8)
        institutions.append(temp9)
        
        delegate?.drDidFetchInitialInstitutions()
    }
}
