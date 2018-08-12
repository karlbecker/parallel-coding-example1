//
//  ParallelCodingExample1Tests.swift
//  ParallelCodingExample1Tests
//
//  Created by Karl Becker on 8/4/18.
//  Copyright © 2018 KB Productions, LLC. All rights reserved.
//

import XCTest
import Quick
import Nimble
@testable import ParallelCodingExample1



class FuelEconomyCalculationTestSpec: QuickSpec {
    override func spec() {
        describe("for two full-tank fuel entries, each with odometer values in miles > ") {
            var entry1 = FuelEntry()
            entry1.odometerUnits = .miles
            entry1.isFullTank = true
            var entry2 = FuelEntry()
            entry2.odometerUnits = .miles
            entry2.isFullTank = true
            
            it("should calculate 5 mpg when the entries are 100 miles apart and the fuel is 20 gallons", closure: {
                entry1.odometer = 100.1
                
                entry2.odometer = 200.1
                entry2.quantity = 20
                entry2.quantityUnits = .Gallons
                
                expect(entry2.fuelEconomyIn(unit: .mpg, previousEntry: entry1).value).to(beCloseTo(5.0, within: 0.001))
            })
            
            xit("should calculate 56.5 L/100km when the entries are 100 miles apart and the fuel is 20 gallons", closure: {
                entry1.odometer = 100.1
                
                entry2.odometer = 200.1
                entry2.quantity = 20.0
                entry2.quantityUnits = .Gallons
                
                expect(entry2.fuelEconomyIn(unit: .lper100km, previousEntry: entry1).value).to(beCloseTo(56.5, within: 0.001))
            })
        }
        
        
        describe("for three fuel entries, each with odometer values in miles > ") {
            var entry1 = FuelEntry()
            entry1.odometerUnits = .miles
            var entry2 = FuelEntry()
            entry2.odometerUnits = .miles
            var entry3 = FuelEntry()
            entry3.odometerUnits = .miles
            
            describe("when the first got a full tank but the other two are partial fills") {
                entry1.isFullTank = true
                entry2.isFullTank = false
                entry3.isFullTank = false
                
                it("should be unable to calculate a fuel economy between the three entries", closure: {
                    entry1.odometer = 50.0
                    entry1.quantity = 5.0
                    
                    entry2.odometer = 150.0
                    entry2.quantity = 12.0
                    
                    entry3.odometer = 350.0
                    entry3.quantity = 18.0
                    
                    expect(entry2.fuelEconomyIn(unit: .mpg, previousEntry: entry1).isValid).to(equal(false))
                    expect(entry3.fuelEconomyIn(unit: .mpg, previousEntry: entry2).isValid).to(equal(false))
                })
            }
        }
    }
}
