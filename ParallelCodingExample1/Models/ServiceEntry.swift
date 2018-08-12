//
//  ServiceEntry.swift
//  ParallelCodingExample1
//
//  Created by Karl Becker on 8/5/18.
//  Copyright © 2018 KB Productions, LLC. All rights reserved.
//

import Foundation
import CoreLocation

protocol ServiceEntryInfo: Entry {
    var entryType: String { get set }
    var entrySubtype: String { get set }
}

struct ServiceEntry: ServiceEntryInfo {
    var entryType: String
    var entrySubtype: String
    
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
    
    
    init() {
        odometer = 0.0
        odometerUnits = .miles
        date = Date()
        notes = ""
        cost = 0.0
        currency = "$"
        
        entryType = ""
        entrySubtype = ""
    }
}
