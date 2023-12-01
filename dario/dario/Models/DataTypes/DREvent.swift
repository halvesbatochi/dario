//
//  DREvent.swift
//  dario
//
//  Created by Henrique Alves Batochi on 20/08/23.
//

import Foundation

struct DREvent: Codable {
    let ad001_vc_nfanta: String
    let ad001_vc_logo: String
    let ad001_it_atuac: Int
    let ad003_vc_desc: String
    let ev001_vc_atv1: String?
    let ev001_vc_atv2: String?
    let ev001_vc_atv3: String?
    let ev001_it_id: Int
    let ev001_it_inst: Int
    let ev001_vc_end: String
    let ev001_it_num: String
    let ev001_vc_compl: String
    let ev001_vc_bairro: String
    let ev001_vc_cidade: String
    let ev001_vc_estado: String
    let ev001_vc_pais: String
    let ev001_vc_titulo: String
    let ev001_dt_inic: String
    let ev001_hr_inic: String
    let ev001_dt_fim: String
    let ev001_hr_fim: String
    let ev001_it_npart: String
    let ev001_vc_fmsg1: String
    let ev001_vc_fmsg2: String
    let ev001_vc_fmsg3: String
    let ev001_vc_fmsg4: String
    let ev001_vc_fmsg5: String
    let ev001_vc_pmsg1: String
    let ev001_vc_pmsg2: String
    let ev001_vc_img1: String
    let ev001_vc_img2: String
    let ev001_it_atv1: Int?
    let ev001_it_atv2: Int?
    let ev001_it_atv3: Int?
    let ev001_it_situac: String
    let ev001_dt_ultatu: String
    let ev001_dt_inclus: String
}
