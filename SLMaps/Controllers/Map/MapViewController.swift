//
//  MapViewController.swift
//  SLMaps
//
//  Created by Igor Smirnov on 04/07/2018.
//  Copyright © 2018 Complex Numbers. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    @IBOutlet weak var locationButton: UIButton!
    @IBOutlet weak var zoomOutButton: UIButton!
    @IBOutlet weak var zoomInButton: UIButton!

    @IBOutlet weak var mapTypeSwitch: UISegmentedControl!

    var dataSource = MapViewControllerDataSource()

    var currentLocation: CLLocation?

    override func viewDidLoad() {
        super.viewDidLoad()

        mapView.delegate = self
        mapView.showsUserLocation = true

        LocationService.shared.didUpdateLocations = { locations in
            guard let location = locations.last else { return }
            print("long: \(location.coordinate.longitude), lat: \(location.coordinate.latitude), alt: \(location.altitude)")
            self.currentLocation = location
        }
        LocationService.shared.requestAccess { success in
            print(success)
            if success {
                LocationService.shared.start()
            }
        }

        updateMapRegion(withLocation: dataSource.initialLocation)

        // add annotations
        mapView.addAnnotations(dataSource.allAnnotations)
        mapView.addOverlays(dataSource.allOverlays)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        LocationService.shared.stop()
    }

    func updateMapRegion(withLocation location: CLLocation? = nil) {
        let span = MKCoordinateSpan(latitudeDelta: 0.1 * zoom, longitudeDelta: 0.1 * zoom)
        let region = MKCoordinateRegion(center: location?.coordinate ?? mapView.centerCoordinate, span: span)
        self.mapView.setRegion(region, animated: true)
    }

    var zoom: Double = 1.0 {
        didSet { updateMapRegion() }
    }

    @IBAction func zoomInButtonAction(_ sender: Any) {
        zoom /= 2.0
    }

    @IBAction func zoomOutButtonAction(_ sender: Any) {
        zoom *= 2.0
    }


    @IBAction func locationButtonAction(_ sender: UISwitch) {
        guard let coordinate = currentLocation?.coordinate else { return }
        mapView.centerCoordinate = coordinate
        zoom = 1.0
    }
    

    @IBAction func mapTypeAction(_ sender: Any) {
        switch mapTypeSwitch.selectedSegmentIndex {
        case 0: mapView.mapType = .standard
        case 1: mapView.mapType = .satellite
        case 2: mapView.mapType = .hybrid
        default: break
        }
    }


}

extension MapViewController: MKMapViewDelegate {

    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        var view = mapView.dequeueReusableAnnotationView(withIdentifier: MapAnnotationView.reuseIdentifier)
        if let annotation = annotation as? MapAnnotation {
            if let view = view as? MapAnnotationView {
                view.updateWith(annotation: annotation)
            } else {
                view = annotation.createView()
            }
        }
        return view
    }

    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        view.isSelected = true
    }

    func mapView(_ mapView: MKMapView, didDeselect view: MKAnnotationView) {
        view.isSelected = false
    }

    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        return MapOverlayRenderer(overlay: overlay)
    }

}
