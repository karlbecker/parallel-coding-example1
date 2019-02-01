//
//  AutoModelFuelEconomyTest.swift
//  ParallelCodingExample1Tests
//
//  Created by Karl Becker on 8/12/18.
//  Copyright © 2018 KB Productions, LLC. All rights reserved.
//

import XCTest
import Quick
import Nimble
@testable import ParallelCodingExample1



class AutoModelFuelEconomyTest: QuickSpec {
    override func spec() {
        describe("for an automobile with an odometer in miles > ") {
            var auto = Auto()
            auto.odometerUnits = .miles
            
            describe("with three fuel entries >") {
                var entry1 = FuelEntry()
                entry1.odometer = 5500
                entry1.quantity = 10
                entry1.quantityUnits = .Gallons
                
                var entry2 = FuelEntry()
                entry2.odometer = 5600
                entry2.quantity = 6
                entry2.quantityUnits = .Gallons
                entry2.isFullTank = true
                
                var entry3 = FuelEntry()
                entry3.odometer = 5700
                entry3.quantity = 8
                entry3.quantityUnits = .Gallons
                
                auto.fuelEntries = [entry1, entry2, entry3]
                
                describe("and the middle entry is not a full tank >") {
                    beforeEach {
                        entry2.isFullTank = false
                    }
                    
                    xit("should calculate the mpg for the third entry by factoring in the middle entry", closure: {
                        let economy = auto.fuelEconomyIn(unit: .mpg, from: entry3, backTo: entry2)
                        expect(economy.isValid).to(equal(true))
                        expect(economy.value).to(beCloseTo(14.286, within: 0.001))
                        expect(economy.units).to(equal(.mpg))
                        //(5700 - 5500) / (6 gal + 8 gal) = 200 / 14 = 14.286 mpg
                    })
                }
                
                describe("and the middle entry is a full tank >") {
                    beforeEach {
                        entry2.isFullTank = true
                    }
                    
                    xit("should calculate the mpg for the third entry by only comparing it to the middle entry", closure: {
                        //(5700 - 5600) / (8 gal) = 100 / 8 = 12.5 mpg
                    })
                }
            }
            
            
            describe("with five fuel entries >") {
                //entry1 - odometer of 145000, quantity = 2 gal
                //entry2 - odometer of 145200, quantity = 8 gal
                //entry3 - odometer of 145300, quantity = 3 gal
                //entry4 - odometer of 145400, quantity = 3.1 gal
                //entry5 - odometer of 145600, quantity = 9.2 gal
                describe("and the third and fourth entries are not full tanks >") {
                    //entry3 - not full tank
                    //entry4 - not full tank
                    
                    xit("should calculate the mpg for the final entry by factoring in the previos two partial tank entry", closure: {
                        //(145600 - 145200) / (3 + 3.1 + 9.2) gal = 400 / 15.3 = 26.144 mpg
                    })
                }
                
                describe("and all entries are full tanks >") {
                    xit("should calculate the mpg for the last entry by only comparing it to the second-to-last entry", closure: {
                        //(145600 - 145400) / (9.2 gal) = 200 / 9.2 = 21.739 mpg
                    })
                }
            }
            
            
        }
    }
}
