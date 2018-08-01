//
//  MapViewControllerDataSource.swift
//  SLMaps
//
//  Created by Igor Smirnov on 11/07/2018.
//  Copyright © 2018 Complex Numbers. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

struct MapViewControllerDataSource {

    var cityIndex: Int!
    var initialCoordinate: CLLocationCoordinate2D!

    func allAnnotations() -> [MapAnnotation] {
        var result: [MapAnnotation] = []
        MapService.shared.modelMap.cities[cityIndex].lines.forEach { line in
            line.stations.forEach { station in
                let color = UIColor.colorWith(string: line.hex_color)
                result.append(MapAnnotation(coordinate: station.coordinate, title: station.name, subtitle: line.name, color: color))
            }
        }
        return result
    }

    func allOverlays() -> [MapOverlay] {
        return MapService.shared.modelMap.cities[cityIndex].lines
            .map { MapOverlay(line: $0) }
    }

}
