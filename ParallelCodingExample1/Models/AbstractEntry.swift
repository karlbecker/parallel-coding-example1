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

protocol Entry {
    var odometer: Float { get set }
    var odometerUnits: OdometerUnits { get set }
    
    // MARK: info about the event
    var date: Date { get set }
    var notes: String { get set }
    var location: CLLocation? { get set }
    
    // MARK: cost information
    var cost: Float { get set }
    var currency: String { get set }
    var costDisplay: String { get }  //this is the localized version of the price with the currency
}

struct AbstractEntry: Entry {
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
