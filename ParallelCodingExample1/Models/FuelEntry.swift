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

protocol FuelTypeEntry : Entry {
    var fuelType: String { get set }
    
    // MARK: Quantities used in different fuel economy calculations
    var isFullTank: Bool { get set }
    var resetFuelEconomy: Bool { get set }
    var quantity: Float { get set }
    var quantityUnits: FuelQuantityUnit { get set }
    
    var quantityInGallons: Float { get }
    var quantityInLiters: Float { get }
    var quantityInImperialGallons: Float { get }
    
    var costPerGallon: Float { get }
    var costPerLiter: Float { get }
    // no need for cost in imperial gallons, because imperial gallons are only used in the UK for fuel economy calculation, not for price calculation
}


struct FuelEntry: FuelTypeEntry {
    var fuelType: String
    var isFullTank: Bool
    var resetFuelEconomy: Bool
    var quantity: Float
    var quantityInGallons: Float {
        return quantity
    }
    var quantityInLiters: Float {
        return quantity
    }
    var quantityInImperialGallons: Float {
        return quantity
    }
    var costPerGallon: Float {
        return self.cost / self.quantityInGallons
    }
    var costPerLiter: Float {
        return self.cost / self.quantityInLiters
    }
    
    var odometer: Float
    var odometerUnits: OdometerUnits
    var date: Date
    var notes: String
    var location: CLLocation?
    var cost: Float
    var currency: String
    var costDisplay: String {
        get {
            return "\(currency)\(cost)"
        }
    }
    var quantityUnits: FuelQuantityUnit
    
    public func fuelEconomyIn(unit: FuelEconomyUnit, previousEntry: FuelTypeEntry) -> Float {
        var value: Float = 0.0;
        
        if (unit == .mpg) {
            value = (self.odometer - previousEntry.odometer) / self.quantityInGallons
        }
        
        return value
    }
}
