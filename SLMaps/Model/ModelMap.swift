//
//  ModelMap.swift
//  SLMaps
//
//  Created by Igor Smirnov on 11/07/2018.
//  Copyright © 2018 Complex Numbers. All rights reserved.
//

import Foundation

struct ModelMap {
    var cities: [ModelCity] = []

    init() { }
    
    init(data: Data) {
        let decoder = JSONDecoder()
        if let cities = try? decoder.decode([ModelCity].self, from: data) {
            self.cities = cities
        }
    }

}
