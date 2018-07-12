//
//  SubwayViewControllerDataSource.swift
//  SLMaps
//
//  Created by Igor Smirnov on 11/07/2018.
//  Copyright © 2018 Complex Numbers. All rights reserved.
//

import UIKit
import CoreLocation

class SubwayViewControllerDataSource: NSObject {
    var cityIndex: Int!
}

extension SubwayViewControllerDataSource: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return MapService.shared.modelMap.cities[cityIndex].lines.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MapService.shared.modelMap.cities[cityIndex].lines[section].stations.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        if let cell = cell as? SubwayViewControllerCell {
            let line = MapService.shared.modelMap.cities[cityIndex].lines[indexPath.section]
            let station = line.stations[indexPath.row]
            cell.colorView.backgroundColor = UIColor.colorWith(string: line.hex_color)
            cell.nameLabel.text = station.name
        }
        return cell
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let line = MapService.shared.modelMap.cities[cityIndex].lines[section]
        return line.name
    }


}
