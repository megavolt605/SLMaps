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
    var cityIndex: Int?
    
    func locationForStation(at: IndexPath) -> CLLocation? {
        guard let index = cityIndex else { return nil }
        return MapService.shared.modelMap.cities[index].lines[at.section].stations[at.row].location
    }

}

extension SubwayViewControllerDataSource: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        guard let index = cityIndex else { return 0 }
        return MapService.shared.modelMap.cities[index].lines.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let index = cityIndex else { return 0 }
        return MapService.shared.modelMap.cities[index].lines[section].stations.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! SubwayViewControllerCell
        if let index = cityIndex {
            let line = MapService.shared.modelMap.cities[index].lines[indexPath.section]
            let station = line.stations[indexPath.row]
            cell.nameLabel.text = station.name
            cell.colorView.backgroundColor = UIColor.colorWith(string: line.hex_color)
        }
        return cell
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let index = cityIndex else { return nil }
        let line = MapService.shared.modelMap.cities[index].lines[section]
        return "\(line.name), \(line.stations.count) stations"
    }

}
