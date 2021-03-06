//
//  ModelLine.swift
//  SLMaps
//
//  Created by Igor Smirnov on 10/07/2018.
//  Copyright © 2018 Complex Numbers. All rights reserved.
//

import Foundation

struct ModelLine: Codable {

    var id: String
    var name: String
    var hex_color: String
    var stations: [ModelStation]
}
