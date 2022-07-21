//
//  DayData.swift
//  Russia's Losses
//
//  Created by Mac on 19.07.2022.
//

import Foundation

struct PersonnelLosses: Decodable {
    
    var date: String
    var day: Int
    var personnel: Int
    var POW: Int?
    
}



