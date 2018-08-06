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
        describe("for a vehicle with an odometer in miles > ") {
            describe("with two entries that are full tanks > ", closure: {
                it("should calculate 5 mpg when the entries are 100 miles apart and the fuel is 20 gallons", closure: {
                    let entry1 = FuelEntry(fuelType: "normal", isFullTank: true, resetFuelEconomy: false, quantity: 1.0, odometer: 100.1, date: Date(), notes: "", location: nil, cost: 2.599, currency: "$", quantityUnits: .Gallons)
                    let entry2 = FuelEntry(fuelType: "normal", isFullTank: true, resetFuelEconomy: false, quantity: 20.0, odometer: 200.1, date: Date(), notes: "", location: nil, cost: 2.599, currency: "$", quantityUnits: .Gallons)
                    
                    expect(entry2.fuelEconomyIn(unit: .mpg, previousEntry: entry1)).to(beCloseTo(5.0, within: 0.001))
                })
                
                
                xit("should calculate 56.5 L/100km when the entries are 100 miles apart and the fuel is 20 gallons", closure: {
                    let entry1 = FuelEntry(fuelType: "normal", isFullTank: true, resetFuelEconomy: false, quantity: 1.0, odometer: 100.1, date: Date(), notes: "", location: nil, cost: 2.599, currency: "$", quantityUnits: .Gallons)
                    let entry2 = FuelEntry(fuelType: "normal", isFullTank: true, resetFuelEconomy: false, quantity: 20.0, odometer: 200.1, date: Date(), notes: "", location: nil, cost: 2.599, currency: "$", quantityUnits: .Gallons)
                    
                    expect(entry2.fuelEconomyIn(unit: .lper100km, previousEntry: entry1)).to(beCloseTo(56.5, within: 0.001))
                })
                
                
            })
        }
    }
}
