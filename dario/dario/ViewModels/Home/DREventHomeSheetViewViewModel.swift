//
//  DREventHomeSheetViewViewModel.swift
//  dario
//
//  Created by Henrique Alves Batochi on 21/11/23.
//

import Foundation

final class DREventHomeSheetViewViewModel {
    
    public var event: DREvent
    
    init(event: DREvent) {
        self.event = event
    }
    
    public var dateEvent: String {
        let day = event.ev001_dt_inic.suffix(2)
        
        let startIndex = event.ev001_dt_inic.index(event.ev001_dt_inic.startIndex, offsetBy: 4)
        let endIndex = event.ev001_dt_inic.index(event.ev001_dt_inic.endIndex, offsetBy: -2)
        let range = startIndex..<endIndex
        let substring = event.ev001_dt_inic[range]
        
        let month = substring
        
        return day + "." + month
    }
    
    public var hourEvent: String {
        let minutes = event.ev001_hr_inic.suffix(2)
        var hrInic = event.ev001_hr_inic
        if hrInic.count < 4 {
             hrInic = "0\(hrInic)"
        }
        let hour = hrInic.prefix(2)
        return hour + ":" + minutes
    }
}
