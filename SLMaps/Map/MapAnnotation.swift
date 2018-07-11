//
//  MapAnnotation.swift
//  SLMaps
//
//  Created by Igor Smirnov on 04/07/2018.
//  Copyright © 2018 Complex Numbers. All rights reserved.
//

import MapKit

class MapAnnotation: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D {
        return station.location!.coordinate
    }
    var title: String? {
        return station.name
    }
    var subtitle: String? {
        return line.name
    }

    var line: ModelLine
    var station: ModelStation

    init?(line: ModelLine, station: ModelStation) {
        guard station.location != nil else { return nil }
        self.line = line
        self.station = station
    }

    func createView() -> MapAnnotationView {
        return MapAnnotationView(annotation: self, reuseIdentifier: MapAnnotationView.reuseIdentifier)
    }
}
