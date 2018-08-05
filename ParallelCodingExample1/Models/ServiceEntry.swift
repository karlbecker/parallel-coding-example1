//
//  ServiceEntry.swift
//  ParallelCodingExample1
//
//  Created by Karl Becker on 8/5/18.
//  Copyright © 2018 KB Productions, LLC. All rights reserved.
//

import Foundation

protocol ServiceEntry: Entry {
    var entryType: String { get set }
    var entrySubtype: String { get set }
}
