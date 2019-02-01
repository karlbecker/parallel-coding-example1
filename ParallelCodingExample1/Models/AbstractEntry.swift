//
//  AbstractEntry.swift
//  ParallelCodingExample1
//
//  Created by Karl Becker on 8/5/18.
//  Copyright © 2018 KB Productions, LLC. All rights reserved.
//

import Foundation
import CoreLocation

enum OdometerUnits {
    case miles
    case kilometers
}

enum OdometerInfo {
    static let kilometersPerMile = 1.60934
    static let milesPerKilometer = 0.621371
}

protocol Entry {
    var odometer: Double { get set }
    var odometerUnits: OdometerUnits { get set }
    var odometerInMiles: Double { get }
    var odometerInKilometers: Double { get }
    
    // MARK: info about the event
    var date: Date { get set }
    var notes: String { get set }
    var location: CLLocation? { get set }
    
    // MARK: cost information
    var cost: Double { get set }
    var currency: String { get set }
    var costDisplay: String { get }  //this is the localized version of the price with the currency
}

struct AbstractEntry: Entry {
    var odometer: Double
    var odometerUnits: OdometerUnits
    
    var date: Date
    var notes: String
    var location: CLLocation?
    var cost: Double
    var currency: String
    var costDisplay: String {
        get {
            return "\(currency)\(cost)"
        }
    }
    
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
    
    init() {
        self.init()
        
        odometer = 0.0
        odometerUnits = .miles
        date = Date()
        notes = ""
        cost = 0.0
        currency = "$"
    }
    
}
