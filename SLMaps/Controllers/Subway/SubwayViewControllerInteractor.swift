//
//  SubwayViewControllerInteractor.swift
//  SLMaps
//
//  Created by Igor Smirnov on 11/07/2018.
//  Copyright © 2018 Complex Numbers. All rights reserved.
//

import UIKit

class SubwayViewControllerInteractor: NSObject {
    var cityIndex: Int!
    var selectedIndexPath: IndexPath?
    weak var ownerViewController: UIViewController?
}

extension SubwayViewControllerInteractor: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndexPath = tableView.indexPathForSelectedRow
        tableView.selectRow(at: nil, animated: true, scrollPosition: .none)
        ownerViewController?.performSegue(withIdentifier: "Map", sender: nil)
    }

}
