//
//  MapViewControllerDataSource.swift
//  SLMaps
//
//  Created by Igor Smirnov on 11/07/2018.
//  Copyright © 2018 Complex Numbers. All rights reserved.
//

import UIKit
import CoreLocation

class MapViewControllerDataSource {

    var cityIndex: Int?
    var initialLocation: CLLocation?
    var currentLocation: CLLocation?

    var allAnnotations: [Annotation] {
        guard let index = cityIndex else { return [] }
        var result = [Annotation]()
        MapService.shared.modelMap.cities[index].lines.forEach { line in
            line.stations.forEach { station in
                if let annotation = Annotation(line: line, station: station) {
                    result.append(annotation)
                }
            }
        }
        return result
    }

}

