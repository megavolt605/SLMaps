//
//  ModelMap.swift
//  SLMaps
//
//  Created by Igor Smirnov on 10/07/2018.
//  Copyright © 2018 Complex Numbers. All rights reserved.
//

import Foundation

struct ModelMap: Codable {
    var cities: [ModelCity] = []

    init(jsonData: Data) {
        let decoder = JSONDecoder()
        if let cities = try? decoder.decode([ModelCity].self, from: jsonData) {
            self.cities = cities
        }
    }
}
