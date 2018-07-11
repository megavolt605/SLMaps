//
//  MapOverlayRenderer.swift
//  SLMaps
//
//  Created by Igor Smirnov on 11/07/2018.
//  Copyright © 2018 Complex Numbers. All rights reserved.
//

import UIKit
import MapKit

class MapOverlayRenderer: MKOverlayPathRenderer {

    override init(overlay: MKOverlay) {
        super.init(overlay: overlay)
        if let overlay = overlay as? MapOverlay {
            strokeColor = overlay.color
        } else {
            strokeColor = .black
        }
        lineWidth = 4
    }

    override func createPath() {
        if let overlay = self.overlay as? MapOverlay, let firstPoint = overlay.points.first {
            //let rect = self.rect(for: overlay.boundingMapRect)
            let path = UIBezierPath()
            path.move(to: point(for: firstPoint))
            for point in overlay.points.suffix(from: 1) {
                path.addLine(to: self.point(for: point))
            }
            self.path = path.cgPath
        }
    }

}
