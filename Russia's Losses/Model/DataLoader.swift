//
//  DataLoader.swift
//  Russia's Losses
//
//  Created by Mac on 19.07.2022.
//

import Foundation

public class DataLoader {
    
    var personnelData = [PersonnelLosses]()
    var equipmentData = [EquipmentLosses]()
    
    init() {
        load()
    }
    
    func load(){
        
        if let personnelUrl = Bundle.main.url(forResource: "personnel", withExtension: "json") {
            if let equipmentUrl = Bundle.main.url(forResource: "equipment", withExtension: "json") {
                
                do {
                    let dataPersonnelLosses = try Data(contentsOf: personnelUrl)
                    let dataEquipmentLosses = try Data(contentsOf: equipmentUrl)
                    
                    let jsonDecoder = JSONDecoder()
                    
                    let dataFromJsonPersonnel = try jsonDecoder.decode([PersonnelLosses].self, from:  dataPersonnelLosses)
                    let dataFromJsonEquipment = try jsonDecoder.decode([EquipmentLosses].self, from:  dataEquipmentLosses)

                    self.personnelData = dataFromJsonPersonnel
                    self.equipmentData = dataFromJsonEquipment
                    self.personnelData.sort { $0.day > $1.day }
                    self.equipmentData.sort { $0.day! > $1.day! }
                    
                } catch {
                    print(error)
                }
            }
        }
    }
    
}
