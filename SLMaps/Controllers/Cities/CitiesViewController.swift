//
//  CitiesViewController.swift
//  SLMaps
//
//  Created by Igor Smirnov on 11/07/2018.
//  Copyright © 2018 Complex Numbers. All rights reserved.
//

import UIKit

class CitiesViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    var dataSource = CitiesViewControllerDataSource()
    var interactor = CitiesViewControllerInteractor()

    override func viewDidLoad() {
        super.viewDidLoad()
        interactor.ownerViewController = self
        tableView.dataSource = dataSource
        tableView.delegate = interactor
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? SubwayViewController, let indexPath = interactor.selectedIndexPath {
            destination.dataSource.cityIndex = indexPath.row
        }
    }

}
