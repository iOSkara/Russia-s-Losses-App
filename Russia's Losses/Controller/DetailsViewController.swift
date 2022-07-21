//
//  DetailsViewController.swift
//  Russia's Losses
//
//  Created by Mac on 20.07.2022.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var personnelLabel: UILabel!
    @IBOutlet weak var powLabel: UILabel!
    @IBOutlet weak var aircraftLabel: UILabel!
    @IBOutlet weak var helicopterLabel: UILabel!
    @IBOutlet weak var tankLabel: UILabel!
    @IBOutlet weak var apcLabel: UILabel!
    @IBOutlet weak var mrlLabel: UILabel!
    @IBOutlet weak var fieldArtilleryLabel: UILabel!
    @IBOutlet weak var militaryAutoLabel: UILabel!
    @IBOutlet weak var fuelTankLabel: UILabel!
    @IBOutlet weak var droneLabel: UILabel!
    @IBOutlet weak var navalShipLabel: UILabel!
    @IBOutlet weak var antiAircraftWarfareLabel: UILabel!
    @IBOutlet weak var specialEquipmentLabel: UILabel!
    @IBOutlet weak var mobileSrbmSystemLabel: UILabel!
    @IBOutlet weak var vehiclesAndFuelTanksLabel: UILabel!
    @IBOutlet weak var cruiseMissilesLabel: UILabel!
    @IBOutlet weak var directionOfGreatestLossesLabel: UILabel!
    
    var dayPersonnel: PersonnelLosses?
    var previousDayPersonnel: PersonnelLosses?
    
    var dayEquipment: EquipmentLosses?
    var previousDayEquipment: EquipmentLosses?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dateFormatted = (dayPersonnel!.date).replacingOccurrences(of: "-", with: ".")
        navigationItem.title = dateFormatted
        navigationController?.navigationBar.prefersLargeTitles = false
        
        var diffPersonnel = 0
        var diffPowLabel = 0
        var diffAircraftLabel = 0
        var diffHelicopterLabel = 0
        var diffTankLabel = 0
        var diffApcLabel = 0
        var diffMrlLabel = 0
        var diffFieldArtilleryLabel = 0
        var diffMilitaryAutoLabel = 0
        var diffFuelTankLabel = 0
        var diffDroneLabel = 0
        var diffNavalShipLabel = 0
        var diffAntiAircraftWarfareLabel = 0
        var diffSpecialEquipmentLabel = 0
        var diffMobileSrbmSystemLabel = 0
        var diffVehiclesAndFuelTanksLabel = 0
        var diffCruiseMissilesLabel = 0
        
        enum targets {
            case personnel, POW, aircraft, helicopter, tank, apc, fieldArtillery, mrl, militaryAuto, fuelTank, drone, navalShip, antiAircraftWarfare, specialEquipment, mobileSrbmSystem, vehiclesAndFuelTanks, cruiseMissiles, greatestLossesDirection
        }
        
        if dayPersonnel?.day != 2 {
            
            checkIfNilAndCalculateDifference()
            dayLabel.text = String(dayPersonnel!.day)
            
        } else {
            
            setValueForLabelWithoutDifference()
        }
        
        func setValueForLabelWithoutDifference() {
            
            checkIfNilAndCalculateDifference()
            dayLabel.text = "Day: " + String(dayPersonnel!.day)
            setValueForLabel(label: personnelLabel, difference: 0, target: .personnel, string: "Personnel")
            setValueForLabel(label: powLabel, difference: 0, target: .POW, string: "Prisoner of War (POW)")
            setValueForLabel(label: aircraftLabel, difference: 0, target: .aircraft, string: "Aircraft")
            setValueForLabel(label: helicopterLabel, difference: 0, target: .helicopter, string: "Helicopter")
            setValueForLabel(label: tankLabel, difference: 0, target: .tank, string: "Tank")
            setValueForLabel(label: apcLabel, difference: 0, target: .apc, string: "Armored Personnel Carrier (APC)")
            setValueForLabel(label: mrlLabel, difference: 0, target: .mrl, string: "Multiple Rocket Launcher (MRL)")
            setValueForLabel(label: fieldArtilleryLabel, difference: 0, target: .fieldArtillery, string: "Field Artillery")
            setValueForLabel(label: militaryAutoLabel, difference: 0, target: .militaryAuto, string: "Military Auto")
            setValueForLabel(label: fuelTankLabel, difference: 0, target: .fuelTank, string: "Fuel Tank")
            setValueForLabel(label: droneLabel, difference: 0, target: .drone, string: "Drone (UAV+RPA)")
            setValueForLabel(label: navalShipLabel, difference: 0, target: .navalShip, string: "Naval Ship")
            setValueForLabel(label: antiAircraftWarfareLabel, difference: 0, target: .antiAircraftWarfare, string: "Anti-aircraft Warfare")
//            setValueForLabel(label: specialEquipmentLabel, difference: 0, target: .specialEquipment, string: "Special equipment")
//            setValueForLabel(label: mobileSrbmSystemLabel, difference: 0, target: .mobileSrbmSystem, string: "Mobile SRBM System")
//            setValueForLabel(label: vehiclesAndFuelTanksLabel, difference: 0, target: .vehiclesAndFuelTanks, string: "Vehicles and Fuel Tanks")
//            setValueForLabel(label: cruiseMissilesLabel, difference: 0, target: .cruiseMissiles, string: "Cruise Missiles")
//            setValueForLabel(label: directionOfGreatestLossesLabel, difference: 0, target: .greatestLossesDirection, string: "Direction of Greatest Losses")
        }
        
        func setValueForLabel(label: UILabel, difference: Int, target: targets, string: String) {
            
            switch target {
                case .personnel:
                    if difference != 0 {
                        label.text = "\(string): " + String(dayPersonnel!.personnel) + " (+\(diffPersonnel))"
                    } else {
                        label.text = "\(string): " + String(dayPersonnel!.personnel)
                    }
                    break
                case .POW:
                    if difference != 0 {
                        label.text = "\(string): " + String(dayPersonnel!.POW!) + " (+\(diffPowLabel))"
                    } else {
                        label.text = "\(string): " + String(dayPersonnel!.POW!)
                    }
                    break
                case .aircraft:
                    if difference != 0 {
                        label.text = "\(string): " + String(dayEquipment!.aircraft!) + " (+\(diffAircraftLabel))"
                    } else {
                        label.text = "\(string): " + String(dayEquipment!.aircraft!)
                    }
                    break
                case .helicopter:
                    if difference != 0 {
                        label.text = "\(string): " + String(dayEquipment!.helicopter!) + " (+\(diffHelicopterLabel))"
                    } else {
                        label.text = "\(string): " + String(dayEquipment!.helicopter!)
                    }
                    break
                case .tank:
                    if difference != 0 {
                        label.text = "\(string): " + String(dayEquipment!.tank!) + " (+\(diffTankLabel))"
                    } else {
                        label.text = "\(string): " + String(dayEquipment!.tank!)
                    }
                    break
                case .apc:
                    if difference != 0 {
                        label.text = "\(string): " + String(dayEquipment!.apc!) + " (+\(diffApcLabel))"
                    } else {
                        label.text = "\(string): " + String(dayEquipment!.apc!)
                    }
                    break
                case .fieldArtillery:
                    if difference != 0 {
                        label.text = "\(string): " + String(dayEquipment!.fieldArtillery!) + " (+\(diffFieldArtilleryLabel))"
                    } else {
                        label.text = "\(string): " + String(dayEquipment!.fieldArtillery!)
                    }
                    break
                case .mrl:
                    if difference != 0 {
                        label.text = "\(string): " + String(dayEquipment!.mrl!) + " (+\(diffMrlLabel))"
                    } else {
                        label.text = "\(string): " + String(dayEquipment!.mrl!)
                    }
                    break
                case .militaryAuto:
                    if difference != 0 {
                        label.text = "\(string): " + String(dayEquipment!.militaryAuto!) + " (+\(diffMilitaryAutoLabel))"
                    } else {
                        label.text = "\(string): " + String(dayEquipment!.militaryAuto!)
                    }
                    break
                case .fuelTank:
                    if difference != 0 {
                        label.text = "\(string): " + String(dayEquipment!.fuelTank!) + " (+\(diffFuelTankLabel))"
                    } else {
                        label.text = "\(string): " + String(dayEquipment!.fuelTank!)
                    }
                    break
                case .drone:
                    if difference != 0 {
                        label.text = "\(string): " + String(dayEquipment!.drone!) + " (+\(diffDroneLabel))"
                    } else {
                        label.text = "\(string): " + String(dayEquipment!.drone!)
                    }
                    break
                case .navalShip:
                    if difference != 0 {
                        label.text = "\(string): " + String(dayEquipment!.navalShip!) + " (+\(diffNavalShipLabel))"
                    } else {
                        label.text = "\(string): " + String(dayEquipment!.navalShip!)
                    }
                    break
                case .antiAircraftWarfare:
                    if difference != 0 {
                        label.text = "\(string): " + String(dayEquipment!.antiAircraftWarfare!) + " (+\(diffAntiAircraftWarfareLabel))"
                    } else {
                        label.text = "\(string): " + String(dayEquipment!.antiAircraftWarfare!)
                    }
                    break
                case .specialEquipment:
                    if difference != 0 {
                        label.text = "\(string): " + String(dayEquipment!.specialEquipment!) + " (+\(diffSpecialEquipmentLabel))"
                    } else {
                        label.text = "\(string): " + String(dayEquipment!.specialEquipment!)
                    }
                    break
                case .mobileSrbmSystem:
                    if difference != 0 {
                        label.text = "\(string): " + String(dayEquipment!.mobileSrbmSystem!) + " (+\(diffMobileSrbmSystemLabel))"
                    } else {
                        label.text = "\(string): " + String(dayEquipment!.mobileSrbmSystem!)
                    }
                    break
                case .vehiclesAndFuelTanks:
                    if difference != 0 {
                        label.text = "\(string): " + String(dayEquipment!.vehiclesAndFuelTanks!) + " (+\(diffVehiclesAndFuelTanksLabel))"
                    } else {
                        label.text = "\(string): " + String(dayEquipment!.vehiclesAndFuelTanks!)
                    }
                    break
                case .cruiseMissiles:
                    if difference != 0 {
                        label.text = "\(string): " + String(dayEquipment!.cruiseMissiles!) + " (+\(diffCruiseMissilesLabel))"
                    } else {
                        label.text = "\(string): " + String(dayEquipment!.cruiseMissiles!)
                    }
                    break
                case .greatestLossesDirection:
                    label.text = "\(string): " + String(dayEquipment!.greatestLossesDirection!)
                    break
            }
        }
        
        
        func checkIfNilAndCalculateDifference() {
            
            if dayPersonnel?.personnel == nil {
                personnelLabel.isHidden = true
            } else {
                if previousDayPersonnel?.personnel != nil {
                    diffPersonnel = ((previousDayPersonnel?.personnel)! - (dayPersonnel?.personnel)!) * (-1)
                }
                setValueForLabel(label: personnelLabel, difference: diffPersonnel, target: .personnel, string: "Personnel")
            }
            
            if dayPersonnel?.POW == nil {
                powLabel.isHidden = true
            } else {
                if previousDayPersonnel?.POW != nil {
                    diffPowLabel = ((previousDayPersonnel?.POW)! - (dayPersonnel?.POW)!) * (-1)
                }
                setValueForLabel(label: powLabel, difference: diffPowLabel, target: .POW, string: "Prisoner of War (POW)")
            }
            
            if dayEquipment?.aircraft == nil {
                aircraftLabel.isHidden = true
            } else {
                if previousDayEquipment?.aircraft != nil {
                    diffAircraftLabel = ((previousDayEquipment?.aircraft)! - (dayEquipment?.aircraft)!) * (-1)
                }
                setValueForLabel(label: aircraftLabel, difference: diffAircraftLabel, target: .aircraft, string: "Aircraft")
            }
            
            if dayEquipment?.helicopter == nil {
                helicopterLabel.isHidden = true
            } else {
                if previousDayEquipment?.helicopter != nil {
                    diffHelicopterLabel = ((previousDayEquipment?.helicopter)! - (dayEquipment?.helicopter)!) * (-1)
                }
                setValueForLabel(label: helicopterLabel, difference: diffHelicopterLabel, target: .helicopter, string: "Helicopter")
            }
            
            if dayEquipment?.tank == nil {
                tankLabel.isHidden = true
            } else {
                if previousDayEquipment?.tank != nil {
                    diffTankLabel = ((previousDayEquipment?.tank)! - (dayEquipment?.tank)!) * (-1)
                }
                setValueForLabel(label: tankLabel, difference: diffTankLabel, target: .tank, string: "Tank")
            }
            
            if dayEquipment?.apc == nil {
                apcLabel.isHidden = true
            } else {
                if previousDayEquipment?.apc != nil {
                    diffApcLabel = ((previousDayEquipment?.apc)! - (dayEquipment?.apc)!) * (-1)
                }
                setValueForLabel(label: apcLabel, difference: diffApcLabel, target: .apc, string: "Armored Personnel Carrier (APC)")
            }
            
            if dayEquipment?.mrl == nil {
                mrlLabel.isHidden = true
            } else {
                if previousDayEquipment?.mrl != nil {
                    diffMrlLabel = ((previousDayEquipment?.mrl)! - (dayEquipment?.mrl)!) * (-1)
                }
                setValueForLabel(label: mrlLabel, difference: diffMrlLabel, target: .mrl, string: "Multiple Rocket Launcher (MRL)")
            }
            
            if dayEquipment?.fieldArtillery == nil {
                fieldArtilleryLabel.isHidden = true
            } else {
                if previousDayEquipment?.fieldArtillery != nil {
                    diffFieldArtilleryLabel = ((previousDayEquipment?.fieldArtillery)! - (dayEquipment?.fieldArtillery)!) * (-1)
                }
                setValueForLabel(label: fieldArtilleryLabel, difference: diffFieldArtilleryLabel, target: .fieldArtillery, string: "Field Artillery")
            }
            
            if dayEquipment?.militaryAuto == nil {
                militaryAutoLabel.isHidden = true
            } else {
                if previousDayEquipment?.militaryAuto != nil {
                    diffMilitaryAutoLabel = ((previousDayEquipment?.militaryAuto)! - (dayEquipment?.militaryAuto)!) * (-1)
                }
                setValueForLabel(label: militaryAutoLabel, difference: diffMilitaryAutoLabel, target: .militaryAuto, string: "Military Auto")
            }
            
            if dayEquipment?.fuelTank == nil {
                fuelTankLabel.isHidden = true
            } else {
                if previousDayEquipment?.fuelTank != nil {
                    diffFuelTankLabel = ((previousDayEquipment?.fuelTank)! - (dayEquipment?.fuelTank)!) * (-1)
                }
                setValueForLabel(label: fuelTankLabel, difference: diffFuelTankLabel, target: .fuelTank, string: "Fuel Tank")
            }
            
            if dayEquipment?.drone == nil {
                droneLabel.isHidden = true
            } else {
                if previousDayEquipment?.drone != nil {
                    diffDroneLabel = ((previousDayEquipment?.drone)! - (dayEquipment?.drone)!) * (-1)
                }
                setValueForLabel(label: droneLabel, difference: diffDroneLabel, target: .drone, string: "Drone (UAV+RPA)")
            }
            
            if dayEquipment?.navalShip == nil {
                navalShipLabel.isHidden = true
            } else {
                if previousDayEquipment?.navalShip != nil {
                    diffNavalShipLabel = ((previousDayEquipment?.navalShip)! - (dayEquipment?.navalShip)!) * (-1)
                }
                setValueForLabel(label: navalShipLabel, difference: diffNavalShipLabel, target: .navalShip, string: "Naval Ship")
            }
            
            if dayEquipment?.antiAircraftWarfare == nil {
                antiAircraftWarfareLabel.isHidden = true
            } else {
                if previousDayEquipment?.antiAircraftWarfare != nil {
                    diffAntiAircraftWarfareLabel = ((previousDayEquipment?.antiAircraftWarfare)! - (dayEquipment?.antiAircraftWarfare)!) * (-1)
                }
                setValueForLabel(label: antiAircraftWarfareLabel, difference: diffAntiAircraftWarfareLabel, target: .antiAircraftWarfare, string: "Anti-aircraft Warfare")
            }
            
            if dayEquipment?.specialEquipment == nil {
                specialEquipmentLabel.isHidden = true
            } else {
                if previousDayEquipment?.specialEquipment != nil {
                    diffSpecialEquipmentLabel = ((previousDayEquipment?.specialEquipment)! - (dayEquipment?.specialEquipment)!) * (-1)
                }
                setValueForLabel(label: specialEquipmentLabel, difference: diffSpecialEquipmentLabel, target: .specialEquipment, string: "Special equipment")
            }
            
            if dayEquipment?.mobileSrbmSystem == nil {
                mobileSrbmSystemLabel.isHidden = true
            } else {
                if previousDayEquipment?.mobileSrbmSystem != nil {
                    diffMobileSrbmSystemLabel = ((previousDayEquipment?.mobileSrbmSystem)! - (dayEquipment?.mobileSrbmSystem)!) * (-1)
                }
                setValueForLabel(label: mobileSrbmSystemLabel, difference: diffMobileSrbmSystemLabel, target: .mobileSrbmSystem, string: "Mobile SRBM System")
            }
            
            if dayEquipment?.vehiclesAndFuelTanks == nil {
                vehiclesAndFuelTanksLabel.isHidden = true
            } else {
                if previousDayEquipment?.vehiclesAndFuelTanks != nil {
                    diffVehiclesAndFuelTanksLabel = ((previousDayEquipment?.vehiclesAndFuelTanks)! - (dayEquipment?.vehiclesAndFuelTanks)!) * (-1)
                }
                setValueForLabel(label: vehiclesAndFuelTanksLabel, difference: diffVehiclesAndFuelTanksLabel, target: .vehiclesAndFuelTanks, string: "Vehicles and Fuel Tanks")
            }
            
            if dayEquipment?.cruiseMissiles == nil {
                cruiseMissilesLabel.isHidden = true
            } else {
                if previousDayEquipment?.cruiseMissiles != nil {
                    diffCruiseMissilesLabel = ((previousDayEquipment?.cruiseMissiles)! - (dayEquipment?.cruiseMissiles)!) * (-1)
                }
                setValueForLabel(label: cruiseMissilesLabel, difference: diffCruiseMissilesLabel, target: .cruiseMissiles, string: "Cruise Missiles")
            }
            if dayEquipment?.greatestLossesDirection == nil {
                directionOfGreatestLossesLabel.isHidden = true
            } else {
                setValueForLabel(label: directionOfGreatestLossesLabel, difference: 0, target: .greatestLossesDirection, string: "Direction of Greatest Losses")
            } 
        }
        
//        powLabel.text = "POW: \(dayPersonnel?.POW.map { String($0)} ?? "Дані відсутні")"
//        dayLabel.text = "Day: " + String(dayPersonnel!.day)
//
//        droneLabel.text = "Drone: " + String((dayEquipment!.drone)!)
        
    }

}
