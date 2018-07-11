//
//  ModelStation.swift
//  SLMaps
//
//  Created by Igor Smirnov on 10/07/2018.
//  Copyright © 2018 Complex Numbers. All rights reserved.
//

import Foundation
import CoreLocation

struct ModelStation: Codable {

    var id: String
    var name: String
    var order: Int
    var lat: CLLocationDegrees
    var lng: CLLocationDegrees
    
}
