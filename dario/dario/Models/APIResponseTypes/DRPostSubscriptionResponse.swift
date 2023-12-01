//
//  DRPostSubscriptionResponse.swift
//  dario
//
//  Created by Henrique Alves Batochi on 27/11/23.
//

import Foundation

struct DRPostSubscriptionResponse: Codable {
    let cd_erro: Int
    let ds_erro: String
    let ev003_it_id: Int?
}
