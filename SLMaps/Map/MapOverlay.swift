//
//  MapOverlay.swift
//  SLMaps
//
//  Created by Igor Smirnov on 01/08/2018.
//  Copyright © 2018 Complex Numbers. All rights reserved.
//

import UIKit
import MapKit

class MapOverlay: NSObject, MKOverlay {

    var coordinate: CLLocationCoordinate2D
    var boundingMapRect: MKMapRect
    var line: ModelLine
    var points: [MKMapPoint]

    init(line: ModelLine) {
        self.line = line
        let coordinates = line.stations.map { $0.coordinate }
        points = coordinates.map { MKMapPoint($0) }
        boundingMapRect = points
            .map { MKMapRect(origin: $0, size: MKMapSize(width: 0, height: 0)) }
            .reduce(MKMapRect.null) { return $0.union($1) }
        let centerPoint = MKMapPoint(x: boundingMapRect.origin.x + boundingMapRect.width / 2,
                                     y: boundingMapRect.origin.y + boundingMapRect.height / 2)
        coordinate = centerPoint.coordinate
    }

}
