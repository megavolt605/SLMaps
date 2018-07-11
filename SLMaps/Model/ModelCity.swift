//
//  ModelCity.swift
//  SLMaps
//
//  Created by Igor Smirnov on 10/07/2018.
//  Copyright © 2018 Complex Numbers. All rights reserved.
//

import Foundation

struct ModelCity: Codable {

    var id: String
    var name: String
    var lines: [ModelLine]

}
