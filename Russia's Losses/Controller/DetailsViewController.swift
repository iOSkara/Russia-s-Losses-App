//
//  DetailsViewController.swift
//  Russia's Losses
//
//  Created by Mac on 20.07.2022.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var dayStackView: UIStackView!
    
    @IBOutlet weak var personnelLabel: UILabel!
    @IBOutlet weak var personnelStackView: UIStackView!
    
    @IBOutlet weak var powLabel: UILabel!
    @IBOutlet weak var powStackView: UIStackView!
    
    @IBOutlet weak var aircraftLabel: UILabel!
    @IBOutlet weak var aircraftStackView: UIStackView!
    
    @IBOutlet weak var helicopterLabel: UILabel!
    @IBOutlet weak var helicopterStackView: UIStackView!
    
    @IBOutlet weak var tankLabel: UILabel!
    @IBOutlet weak var tankStackView: UIStackView!
    
    @IBOutlet weak var apcLabel: UILabel!
    @IBOutlet weak var apcStackView: UIStackView!
    
    @IBOutlet weak var mrlLabel: UILabel!
    @IBOutlet weak var mrlStackView: UIStackView!
    
    @IBOutlet weak var fieldArtilleryLabel: UILabel!
    @IBOutlet weak var fieldArtilleryStackView: UIStackView!
    
    @IBOutlet weak var militaryAutoLabel: UILabel!
    @IBOutlet weak var militaryAutoStackView: UIStackView!
    
    @IBOutlet weak var fuelTankLabel: UILabel!
    @IBOutlet weak var fuelTankStackView: UIStackView!
    
    @IBOutlet weak var droneLabel: UILabel!
    @IBOutlet weak var droneStackView: UIStackView!
    
    @IBOutlet weak var navalShipLabel: UILabel!
    @IBOutlet weak var navalShipStackView: UIStackView!
    
    @IBOutlet weak var antiAircraftWarfareLabel: UILabel!
    @IBOutlet weak var antiAircraftWarfareStackView: UIStackView!
    
    @IBOutlet weak var specialEquipmentLabel: UILabel!
    @IBOutlet weak var specialEquipmentStackView: UIStackView!
    
    @IBOutlet weak var mobileSrbmSystemLabel: UILabel!
    @IBOutlet weak var mobileSrbmSystemStackView: UIStackView!
    
    @IBOutlet weak var vehiclesAndFuelTanksLabel: UILabel!
    @IBOutlet weak var vehiclesAndFuelTanksStackView: UIStackView!
    
    @IBOutlet weak var cruiseMissilesLabel: UILabel!
    @IBOutlet weak var cruiseMissilesStackView: UIStackView!
    
    @IBOutlet weak var directionOfGreatestLossesLabel: UILabel!
    @IBOutlet weak var directionOfGreatestLossesStackView: UIStackView!
    
    
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
            dayLabel.text = String(dayPersonnel!.day)
            setValueForLabel(label: personnelLabel, difference: 0, target: .personnel)
            setValueForLabel(label: powLabel, difference: 0, target: .POW)
            setValueForLabel(label: aircraftLabel, difference: 0, target: .aircraft)
            setValueForLabel(label: helicopterLabel, difference: 0, target: .helicopter)
            setValueForLabel(label: tankLabel, difference: 0, target: .tank)
            setValueForLabel(label: apcLabel, difference: 0, target: .apc)
            setValueForLabel(label: mrlLabel, difference: 0, target: .mrl)
            setValueForLabel(label: fieldArtilleryLabel, difference: 0, target: .fieldArtillery)
            setValueForLabel(label: militaryAutoLabel, difference: 0, target: .militaryAuto)
            setValueForLabel(label: fuelTankLabel, difference: 0, target: .fuelTank)
            setValueForLabel(label: droneLabel, difference: 0, target: .drone)
            setValueForLabel(label: navalShipLabel, difference: 0, target: .navalShip)
            setValueForLabel(label: antiAircraftWarfareLabel, difference: 0, target: .antiAircraftWarfare)
        }
        
        func setValueForLabel(label: UILabel, difference: Int, target: targets) {
            
            switch target {
                case .personnel:
                    if difference != 0 {
                        label.text = String(dayPersonnel!.personnel) + " (+\(diffPersonnel))"
                    } else {
                        label.text = String(dayPersonnel!.personnel)
                    }
                    break
                case .POW:
                    if difference != 0 {
                        label.text = String(dayPersonnel!.POW!) + " (+\(diffPowLabel))"
                    } else {
                        label.text = String(dayPersonnel!.POW!)
                    }
                    break
                case .aircraft:
                    if difference != 0 {
                        label.text = String(dayEquipment!.aircraft!) + " (+\(diffAircraftLabel))"
                    } else {
                        label.text = String(dayEquipment!.aircraft!)
                    }
                    break
                case .helicopter:
                    if difference != 0 {
                        label.text = String(dayEquipment!.helicopter!) + " (+\(diffHelicopterLabel))"
                    } else {
                        label.text = String(dayEquipment!.helicopter!)
                    }
                    break
                case .tank:
                    if difference != 0 {
                        label.text = String(dayEquipment!.tank!) + " (+\(diffTankLabel))"
                    } else {
                        label.text = String(dayEquipment!.tank!)
                    }
                    break
                case .apc:
                    if difference != 0 {
                        label.text = String(dayEquipment!.apc!) + " (+\(diffApcLabel))"
                    } else {
                        label.text = String(dayEquipment!.apc!)
                    }
                    break
                case .fieldArtillery:
                    if difference != 0 {
                        label.text = String(dayEquipment!.fieldArtillery!) + " (+\(diffFieldArtilleryLabel))"
                    } else {
                        label.text = String(dayEquipment!.fieldArtillery!)
                    }
                    break
                case .mrl:
                    if difference != 0 {
                        label.text = String(dayEquipment!.mrl!) + " (+\(diffMrlLabel))"
                    } else {
                        label.text = String(dayEquipment!.mrl!)
                    }
                    break
                case .militaryAuto:
                    if difference != 0 {
                        label.text = String(dayEquipment!.militaryAuto!) + " (+\(diffMilitaryAutoLabel))"
                    } else {
                        label.text = String(dayEquipment!.militaryAuto!)
                    }
                    break
                case .fuelTank:
                    if difference != 0 {
                        label.text = String(dayEquipment!.fuelTank!) + " (+\(diffFuelTankLabel))"
                    } else {
                        label.text = String(dayEquipment!.fuelTank!)
                    }
                    break
                case .drone:
                    if difference != 0 {
                        label.text = String(dayEquipment!.drone!) + " (+\(diffDroneLabel))"
                    } else {
                        label.text = String(dayEquipment!.drone!)
                    }
                    break
                case .navalShip:
                    if difference != 0 {
                        label.text = String(dayEquipment!.navalShip!) + " (+\(diffNavalShipLabel))"
                    } else {
                        label.text = String(dayEquipment!.navalShip!)
                    }
                    break
                case .antiAircraftWarfare:
                    if difference != 0 {
                        label.text = String(dayEquipment!.antiAircraftWarfare!) + " (+\(diffAntiAircraftWarfareLabel))"
                    } else {
                        label.text = String(dayEquipment!.antiAircraftWarfare!)
                    }
                    break
                case .specialEquipment:
                    if difference != 0 {
                        label.text = String(dayEquipment!.specialEquipment!) + " (+\(diffSpecialEquipmentLabel))"
                    } else {
                        label.text = String(dayEquipment!.specialEquipment!)
                    }
                    break
                case .mobileSrbmSystem:
                    if difference != 0 {
                        label.text = String(dayEquipment!.mobileSrbmSystem!) + " (+\(diffMobileSrbmSystemLabel))"
                    } else {
                        label.text = String(dayEquipment!.mobileSrbmSystem!)
                    }
                    break
                case .vehiclesAndFuelTanks:
                    if difference != 0 {
                        label.text = String(dayEquipment!.vehiclesAndFuelTanks!) + " (+\(diffVehiclesAndFuelTanksLabel))"
                    } else {
                        label.text = String(dayEquipment!.vehiclesAndFuelTanks!)
                    }
                    break
                case .cruiseMissiles:
                    if difference != 0 {
                        label.text = String(dayEquipment!.cruiseMissiles!) + " (+\(diffCruiseMissilesLabel))"
                    } else {
                        label.text = String(dayEquipment!.cruiseMissiles!)
                    }
                    break
                case .greatestLossesDirection:
                    label.text = String(dayEquipment!.greatestLossesDirection!)
                    break
            }
        }
        
        
        func checkIfNilAndCalculateDifference() {
            
            if dayPersonnel?.personnel == nil {
                personnelLabel.isHidden = true
                personnelStackView.isHidden = true
            } else {
                if previousDayPersonnel?.personnel != nil {
                    diffPersonnel = ((previousDayPersonnel?.personnel)! - (dayPersonnel?.personnel)!) * (-1)
                }
                setValueForLabel(label: personnelLabel, difference: diffPersonnel, target: .personnel)
            }
            
            if dayPersonnel?.POW == nil {
                powLabel.isHidden = true
                powStackView.isHidden = true
            } else {
                if previousDayPersonnel?.POW != nil {
                    diffPowLabel = ((previousDayPersonnel?.POW)! - (dayPersonnel?.POW)!) * (-1)
                }
                setValueForLabel(label: powLabel, difference: diffPowLabel, target: .POW)
            }
            
            if dayEquipment?.aircraft == nil {
                aircraftLabel.isHidden = true
                aircraftStackView.isHidden = true
            } else {
                if previousDayEquipment?.aircraft != nil {
                    diffAircraftLabel = ((previousDayEquipment?.aircraft)! - (dayEquipment?.aircraft)!) * (-1)
                }
                setValueForLabel(label: aircraftLabel, difference: diffAircraftLabel, target: .aircraft)
            }
            
            if dayEquipment?.helicopter == nil {
                helicopterLabel.isHidden = true
                helicopterStackView.isHidden = true
            } else {
                if previousDayEquipment?.helicopter != nil {
                    diffHelicopterLabel = ((previousDayEquipment?.helicopter)! - (dayEquipment?.helicopter)!) * (-1)
                }
                setValueForLabel(label: helicopterLabel, difference: diffHelicopterLabel, target: .helicopter)
            }
            
            if dayEquipment?.tank == nil {
                tankLabel.isHidden = true
                tankStackView.isHidden = true
            } else {
                if previousDayEquipment?.tank != nil {
                    diffTankLabel = ((previousDayEquipment?.tank)! - (dayEquipment?.tank)!) * (-1)
                }
                setValueForLabel(label: tankLabel, difference: diffTankLabel, target: .tank)
            }
            
            if dayEquipment?.apc == nil {
                apcLabel.isHidden = true
                apcStackView.isHidden = true
            } else {
                if previousDayEquipment?.apc != nil {
                    diffApcLabel = ((previousDayEquipment?.apc)! - (dayEquipment?.apc)!) * (-1)
                }
                setValueForLabel(label: apcLabel, difference: diffApcLabel, target: .apc)
            }
            
            if dayEquipment?.mrl == nil {
                mrlLabel.isHidden = true
                mrlStackView.isHidden = true
            } else {
                if previousDayEquipment?.mrl != nil {
                    diffMrlLabel = ((previousDayEquipment?.mrl)! - (dayEquipment?.mrl)!) * (-1)
                }
                setValueForLabel(label: mrlLabel, difference: diffMrlLabel, target: .mrl)
            }
            
            if dayEquipment?.fieldArtillery == nil {
                fieldArtilleryLabel.isHidden = true
                fieldArtilleryStackView.isHidden = true
            } else {
                if previousDayEquipment?.fieldArtillery != nil {
                    diffFieldArtilleryLabel = ((previousDayEquipment?.fieldArtillery)! - (dayEquipment?.fieldArtillery)!) * (-1)
                }
                setValueForLabel(label: fieldArtilleryLabel, difference: diffFieldArtilleryLabel, target: .fieldArtillery)
            }
            
            if dayEquipment?.militaryAuto == nil {
                militaryAutoLabel.isHidden = true
                militaryAutoStackView.isHidden = true
            } else {
                if previousDayEquipment?.militaryAuto != nil {
                    diffMilitaryAutoLabel = ((previousDayEquipment?.militaryAuto)! - (dayEquipment?.militaryAuto)!) * (-1)
                }
                setValueForLabel(label: militaryAutoLabel, difference: diffMilitaryAutoLabel, target: .militaryAuto)
            }
            
            if dayEquipment?.fuelTank == nil {
                fuelTankLabel.isHidden = true
                fuelTankStackView.isHidden = true
            } else {
                if previousDayEquipment?.fuelTank != nil {
                    diffFuelTankLabel = ((previousDayEquipment?.fuelTank)! - (dayEquipment?.fuelTank)!) * (-1)
                }
                setValueForLabel(label: fuelTankLabel, difference: diffFuelTankLabel, target: .fuelTank)
            }
            
            if dayEquipment?.drone == nil {
                droneLabel.isHidden = true
                droneStackView.isHidden = true
            } else {
                if previousDayEquipment?.drone != nil {
                    diffDroneLabel = ((previousDayEquipment?.drone)! - (dayEquipment?.drone)!) * (-1)
                }
                setValueForLabel(label: droneLabel, difference: diffDroneLabel, target: .drone)
            }
            
            if dayEquipment?.navalShip == nil {
                navalShipLabel.isHidden = true
                navalShipLabel.isHidden = true
            } else {
                if previousDayEquipment?.navalShip != nil {
                    diffNavalShipLabel = ((previousDayEquipment?.navalShip)! - (dayEquipment?.navalShip)!) * (-1)
                }
                setValueForLabel(label: navalShipLabel, difference: diffNavalShipLabel, target: .navalShip)
            }
            
            if dayEquipment?.antiAircraftWarfare == nil {
                antiAircraftWarfareLabel.isHidden = true
                antiAircraftWarfareStackView.isHidden = true
            } else {
                if previousDayEquipment?.antiAircraftWarfare != nil {
                    diffAntiAircraftWarfareLabel = ((previousDayEquipment?.antiAircraftWarfare)! - (dayEquipment?.antiAircraftWarfare)!) * (-1)
                }
                setValueForLabel(label: antiAircraftWarfareLabel, difference: diffAntiAircraftWarfareLabel, target: .antiAircraftWarfare)
            }
            
            if dayEquipment?.specialEquipment == nil {
                specialEquipmentLabel.isHidden = true
                specialEquipmentStackView.isHidden = true
            } else {
                if previousDayEquipment?.specialEquipment != nil {
                    diffSpecialEquipmentLabel = ((previousDayEquipment?.specialEquipment)! - (dayEquipment?.specialEquipment)!) * (-1)
                }
                setValueForLabel(label: specialEquipmentLabel, difference: diffSpecialEquipmentLabel, target: .specialEquipment)
            }
            
            if dayEquipment?.mobileSrbmSystem == nil {
                mobileSrbmSystemLabel.isHidden = true
                mobileSrbmSystemStackView.isHidden = true
            } else {
                if previousDayEquipment?.mobileSrbmSystem != nil {
                    diffMobileSrbmSystemLabel = ((previousDayEquipment?.mobileSrbmSystem)! - (dayEquipment?.mobileSrbmSystem)!) * (-1)
                }
                setValueForLabel(label: mobileSrbmSystemLabel, difference: diffMobileSrbmSystemLabel, target: .mobileSrbmSystem)
            }
            
            if dayEquipment?.vehiclesAndFuelTanks == nil {
                vehiclesAndFuelTanksLabel.isHidden = true
                vehiclesAndFuelTanksStackView.isHidden = true
            } else {
                if previousDayEquipment?.vehiclesAndFuelTanks != nil {
                    diffVehiclesAndFuelTanksLabel = ((previousDayEquipment?.vehiclesAndFuelTanks)! - (dayEquipment?.vehiclesAndFuelTanks)!) * (-1)
                }
                setValueForLabel(label: vehiclesAndFuelTanksLabel, difference: diffVehiclesAndFuelTanksLabel, target: .vehiclesAndFuelTanks)
            }
            
            if dayEquipment?.cruiseMissiles == nil {
                cruiseMissilesLabel.isHidden = true
                cruiseMissilesStackView.isHidden = true
            } else {
                if previousDayEquipment?.cruiseMissiles != nil {
                    diffCruiseMissilesLabel = ((previousDayEquipment?.cruiseMissiles)! - (dayEquipment?.cruiseMissiles)!) * (-1)
                }
                setValueForLabel(label: cruiseMissilesLabel, difference: diffCruiseMissilesLabel, target: .cruiseMissiles)
            }
            if dayEquipment?.greatestLossesDirection == nil {
                directionOfGreatestLossesLabel.isHidden = true
                directionOfGreatestLossesStackView.isHidden = true
            } else {
                setValueForLabel(label: directionOfGreatestLossesLabel, difference: 0, target: .greatestLossesDirection)
            } 
        }
    
    }

}
