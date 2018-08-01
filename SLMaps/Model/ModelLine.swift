//
//  ModelLine.swift
//  SLMaps
//
//  Created by Igor Smirnov on 11/07/2018.
//  Copyright © 2018 Complex Numbers. All rights reserved.
//

import Foundation

struct ModelLine: Codable {
    var id: String
    var name: String
    var stations: [ModelStation]
    var hex_color: String
    var circle: Bool?
}
