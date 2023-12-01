//
//  DRGetLoginVolunteer.swift
//  dario
//
//  Created by Henrique Alves Batochi on 20/11/23.
//

import Foundation

struct DRGetLoginVolunteerResponse: Codable {
    let cd_erro: Int
    let ds_erro: String
    let ad002_it_id: Int?
    let ad002_vc_login: String?
}
