//
//  MapService.swift
//  SLMaps
//
//  Created by Igor Smirnov on 11/07/2018.
//  Copyright © 2018 Complex Numbers. All rights reserved.
//

import Foundation

struct MapService {

    static let shared = MapService()

    var modelMap = ModelMap()

    init() {
        if let url = Bundle.main.url(forResource: "Locations", withExtension: "json") {
            if let data = try? Data(contentsOf: url) {
                modelMap = ModelMap(data: data)
            }
        }
    }

}
