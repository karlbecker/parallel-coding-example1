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



class InitialTestSpec: QuickSpec {
    override func spec() {
        describe("when the app starts") {
            it("should make sure we can count to 8", closure: {
                expect("this dog".count).to(equal(8))
            })
        }
    }
}
