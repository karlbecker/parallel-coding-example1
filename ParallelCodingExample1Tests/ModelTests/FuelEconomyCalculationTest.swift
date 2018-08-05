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
                    var entry1 = FuelEntry()
                    entry1.odometer = 100.1
                    entry1.isFullTank = true
                    
                    var entry2 = FuelEntry()
                    entry2.odometer = 200.1
                    entry2.quantity = 20
                    entry2.quantityUnits = .Gallons
                    entry2.isFullTank = true
                    
                    expect(entry2.fuelEconomyIn(unit: .mpg, previousEntry: entry1)).to(beCloseTo(5.0, within: 0.001))
                })
            })
        }
    }
}
