//
//  SubwayViewController.swift
//  SLMaps
//
//  Created by Igor Smirnov on 11/07/2018.
//  Copyright © 2018 Complex Numbers. All rights reserved.
//

import UIKit

class SubwayViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    var dataSource = SubwayViewControllerDataSource()
    var interactor = SubwayViewControllerInteractor()

    override func viewDidLoad() {
        super.viewDidLoad()
        interactor.ownerViewController = self
        tableView.dataSource = dataSource
        tableView.delegate = interactor
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? MapViewController, let indexPath = interactor.selectedIndexPath {
            let line = MapService.shared.modelMap.cities[dataSource.cityIndex].lines[indexPath.section]
            let station = line.stations[indexPath.row]
            destination.dataSource.cityIndex = dataSource.cityIndex
            destination.dataSource.initialCoordinate = station.coordinate
        }
    }

}
