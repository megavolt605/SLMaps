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

    let dataSource = CitiesViewControllerDataSource()
    private var selectedIndexPath: IndexPath?

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = dataSource
        tableView.delegate = self
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? SubwayViewController {
            guard let indexPath = selectedIndexPath else { return }
            destination.dataSource.cityIndex = indexPath.row
        }
    }

}

extension CitiesViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndexPath = tableView.indexPathForSelectedRow
        tableView.selectRow(at: nil, animated: true, scrollPosition: .none)
        performSegue(withIdentifier: "Subway", sender: self)
    }

}
