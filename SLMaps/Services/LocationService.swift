//
//  LocationService.swift
//  SLMaps
//
//  Created by Igor Smirnov on 04/07/2018.
//  Copyright © 2018 Complex Numbers. All rights reserved.
//

import CoreLocation

class LocationService: NSObject {

    static let shared = LocationService()

    let manager = CLLocationManager()

    var requestAccessCompleted: ((Bool) -> Void)?
    var didUpdateLocations: (([CLLocation]) -> Void)?

    func requestAccess(completed: @escaping (Bool) -> Void) {
        manager.desiredAccuracy = kCLLocationAccuracyBest
        requestAccessCompleted = completed
        manager.requestWhenInUseAuthorization()
    }

    func start() {
        manager.startUpdatingLocation()
    }

    func stop() {
        manager.stopUpdatingLocation()
    }

    override init() {
        super.init()
        manager.delegate = self
    }

}

extension LocationService: CLLocationManagerDelegate {

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        didUpdateLocations?(locations)
    }

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .authorizedWhenInUse, .authorizedAlways:
            requestAccessCompleted?(true)
        case .denied, .notDetermined, .restricted:
            requestAccessCompleted?(false)
        default:
            fatalError("Never should be here") //??
        }
    }

}
