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

    var modelMap: ModelMap

    init() {
        let dataURL = Bundle.main.url(forResource: "Locations", withExtension: "json")
        if let dataURL = dataURL, let data = try? Data(contentsOf: dataURL) {
            self.modelMap = ModelMap(jsonData: data)
            self.modelMap.cities.sort { $0.name < $1.name }
        } else {
            self.modelMap = ModelMap()
        }
    }

}
