//
//  Auto.swift
//  ParallelCodingExample1
//
//  Created by Karl Becker on 8/11/18.
//  Copyright © 2018 KB Productions, LLC. All rights reserved.
//

import Foundation

protocol AutoInfo {
    var name: String { get set }
    var odometerUnits: OdometerUnits { get set }
    var entries: [Entry] { get }
    var fuelEntries: [FuelEntry] { get }
    var serviceEntries: [ServiceEntry] { get }
}



struct Auto : AutoInfo {
    var name: String
    var odometerUnits: OdometerUnits
    
    var entries: [Entry] {
        get {
            var allEntries: [Entry] = []
            
            for entry in fuelEntries {
                allEntries.append(entry)
            }
            
            for entry in serviceEntries {
                allEntries.append(entry)
            }
            return allEntries
        }
    }
    
    var fuelEntries: [FuelEntry]
    var serviceEntries: [ServiceEntry]
    
    init() {
        name = ""
        odometerUnits = .miles
        fuelEntries = []
        serviceEntries = []
    }
    
    public func fuelEconomyIn(unit: FuelEconomyUnit, from newestEntry: FuelEntryInfo, backTo oldestEntry: FuelEntryInfo) -> FuelEconomy {
        var economy = FuelEconomy()
        
        if (!newestEntry.isFullTank || !oldestEntry.isFullTank) {
            economy.isValid = false
            return economy
        }
        
        if (unit == .mpg) {
            economy.value = (newestEntry.odometerInMiles - oldestEntry.odometerInMiles) / oldestEntry.quantityInGallons
        }
        else if (unit == .lper100km) {
            //TODO
        }
        
        return economy
    }
}
