//
//  MapOverlayRenderer.swift
//  SLMaps
//
//  Created by Igor Smirnov on 01/08/2018.
//  Copyright © 2018 Complex Numbers. All rights reserved.
//

import UIKit
import MapKit

class MapOverlayRenderer: MKOverlayPathRenderer {

    override init(overlay: MKOverlay) {
        super.init(overlay: overlay)
        if let overlay = overlay as? MapOverlay {
            strokeColor = UIColor.colorWith(string: overlay.line.hex_color)
            lineWidth = 5.0
            lineJoin = .round
            lineCap = .square
        }
    }

    override func createPath() {
        if let overlay = overlay as? MapOverlay, let firstPoint = overlay.points.first {
            let path = UIBezierPath()

            path.move(to: point(for: firstPoint))
            for point in overlay.points.suffix(from: 1) {
                path.addLine(to: self.point(for: point))
            }
            if overlay.line.circle ?? false {
                path.addLine(to: self.point(for: firstPoint))
            }
            self.path = path.cgPath
            return
        }
        self.path = nil
    }

}
