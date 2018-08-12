//
//  FuelEntry.swift
//  
//
//  Created by Karl Becker on 8/5/18.
//

import Foundation
import CoreLocation

enum FuelQuantityUnit {
    case Gallons
    case Liters
}

enum FuelEconomyUnit {
    case mpg
    case lper100km
}

protocol FuelEntryInfo : Entry {
    var fuelType: String { get set }
    
    // MARK: Quantities used in different fuel economy calculations
    var isFullTank: Bool { get set }
    var resetFuelEconomy: Bool { get set }
    var quantity: Double { get set }
    var quantityUnits: FuelQuantityUnit { get set }
    
    var quantityInGallons: Double { get }
    var quantityInLiters: Double { get }
    var quantityInImperialGallons: Double { get }
    
    var costPerGallon: Double { get }
    var costPerLiter: Double { get }
    // no need for cost in imperial gallons, because imperial gallons are only used in the UK for fuel economy calculation, not for price calculation
}

protocol FuelEconomyInfo {
    var value: Double { get }
    var isValid: Bool { get }
    var units: FuelEconomyUnit { get }
}

struct FuelEconomy: FuelEconomyInfo {
    var value: Double
    var isValid: Bool
    var units: FuelEconomyUnit
    
    init() {
        value = 0.0
        isValid = true
        units = .mpg
    }
}


struct FuelEntry: FuelEntryInfo {
    var fuelType: String
    var isFullTank: Bool
    var resetFuelEconomy: Bool
    var quantity: Double
    var quantityUnits: FuelQuantityUnit
    var quantityInGallons: Double {
        return quantity
    }
    var quantityInLiters: Double {
        return quantity
    }
    var quantityInImperialGallons: Double {
        return quantity
    }
    var costPerGallon: Double {
        return self.cost / self.quantityInGallons
    }
    var costPerLiter: Double {
        return self.cost / self.quantityInLiters
    }
    
    var odometer: Double
    var odometerInMiles: Double {
        get {
            return (odometerUnits == .miles) ? odometer : odometer / OdometerInfo.kilometersPerMile
        }
    }
    var odometerInKilometers: Double {
        get {
            return (odometerUnits == .kilometers) ? odometer : odometer / OdometerInfo.milesPerKilometer
        }
    }
    
    var odometerUnits: OdometerUnits
    var date: Date
    var notes: String
    var location: CLLocation?
    var cost: Double
    var currency: String
    var costDisplay: String {
        return "\(currency)\(cost)"
    }
    
    public func fuelEconomyIn(unit: FuelEconomyUnit, previousEntry: FuelEntryInfo) -> FuelEconomy {
        var economy = FuelEconomy()
        
        //TODO: determine when fuel economy is valid or not, such as when one of the entries is not a full tank
        
        if (unit == .mpg) {
            economy.value = (self.odometerInMiles - previousEntry.odometerInMiles) / self.quantityInGallons
        }
        else if (unit == .lper100km) {
            //TODO
        }
        
        return economy
    }
    
    init() {
        odometer = 0.0
        odometerUnits = .miles
        date = Date()
        notes = ""
        cost = 0.0
        currency = "$"
        
        fuelType = "Regular"
        isFullTank = true
        resetFuelEconomy = true
        quantity = 0.0
        quantityUnits = .Gallons
    }
}
