//
//  MapOverlay.swift
//  SLMaps
//
//  Created by Igor Smirnov on 11/07/2018.
//  Copyright © 2018 Complex Numbers. All rights reserved.
//

import UIKit
import MapKit

class MapOverlay: NSObject, MKOverlay {

    var coordinate: CLLocationCoordinate2D
    var boundingMapRect: MKMapRect
    var points: [MKMapPoint] = []
    var color: UIColor

    init(line: ModelLine) {

        func union(r1: MKMapRect, r2: MKMapRect) -> MKMapRect {
            return r1.union(r2)
        }

        color = UIColor.colorWith(string: line.hex_color)

        let coordinates = line.stations.compactMap { $0.location?.coordinate }
        points = coordinates.map { MKMapPoint($0) }
        boundingMapRect = points
            .map { MKMapRect(origin: $0, size: MKMapSize(width: 0, height: 0)) }
            .reduce(MKMapRect.null, union)
        coordinate = coordinates
            .reduce(CLLocationCoordinate2D()) {
                if $0.longitude == 0 && $0.latitude == 0 {
                    return $1
                }
                return CLLocationCoordinate2D(
                    latitude: ($0.latitude + $1.latitude) / Double(line.stations.count),
                    longitude: ($0.longitude + $1.longitude) / Double(line.stations.count)
                )
            }
        super.init()
    }

}
