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

    let dataSource = SubwayViewControllerDataSource()
    var selectedIndexPath: IndexPath?

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = dataSource
        tableView.delegate = self
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? MapViewController {
            guard let indexPath = selectedIndexPath else { return }
            destination.dataSource.cityIndex = dataSource.cityIndex
            destination.dataSource.initialLocation = dataSource.locationForStation(at: indexPath)
        }
    }

}

extension SubwayViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndexPath = tableView.indexPathForSelectedRow
        tableView.selectRow(at: nil, animated: true, scrollPosition: .none)
        performSegue(withIdentifier: "Map", sender: self)
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }

}
