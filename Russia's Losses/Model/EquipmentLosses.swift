//
//  EquipmentLosses.swift
//  Russia's Losses
//
//  Created by Mac on 20.07.2022.
//

import Foundation

struct EquipmentLosses: Decodable {
    
    var date: String?
    var day: Int?
    var aircraft: Int?
    var helicopter: Int?
    var tank: Int?
    var apc: Int?
    var fieldArtillery: Int?
    var mrl: Int?
    var militaryAuto: Int?
    var fuelTank: Int?
    var drone: Int?
    var navalShip: Int?
    var antiAircraftWarfare: Int?
    var specialEquipment: Int?
    var mobileSrbmSystem: Int?
    var vehiclesAndFuelTanks: Int?
    var cruiseMissiles: Int?
    var greatestLossesDirection: String?
    
    private enum CodingKeys: String, CodingKey {
        case date
        case day
        case aircraft
        case helicopter
        case tank
        case apc = "APC"
        case fieldArtillery = "field artillery"
        case mrl = "MRL"
        case militaryAuto = "military auto"
        case fuelTank = "fuel tank"
        case drone
        case navalShip = "naval ship"
        case antiAircraftWarfare = "anti-aircraft warfare"
        case specialEquipment = "special equipment"
        case mobileSrbmSystem = "mobile SRBM system"
        case vehiclesAndFuelTanks = "vehicles and fuel tanks"
        case cruiseMissiles = "cruise missiles"
        case greatestLossesDirection = "greatest losses direction"
    }
}



