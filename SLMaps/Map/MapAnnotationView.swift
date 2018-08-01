//
//  MapAnnotationView.swift
//  SLMaps
//
//  Created by Igor Smirnov on 01/08/2018.
//  Copyright © 2018 Complex Numbers. All rights reserved.
//

import UIKit
import MapKit

class MapAnnotationView: MKAnnotationView {

    var stationView: UIView!
    var stationLabel: UILabel!
    var lineLabel: UILabel!

    override var isSelected: Bool {
        didSet {
            stationView.alpha = isSelected ? 1.0 : 0.5
            lineLabel.isHidden = !isSelected
        }
    }

    override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        backgroundColor = UIColor.clear

        clipsToBounds = false

        stationView = UIView(frame: CGRect(x: -10, y: -10, width: 20, height: 20))
        stationView.layer.masksToBounds = true
        stationView.backgroundColor = .green
        addSubview(stationView)

        stationLabel = UILabel()
        stationLabel.font = UIFont.systemFont(ofSize: 10)
        addSubview(stationLabel)

        lineLabel = UILabel()
        lineLabel.font = UIFont.systemFont(ofSize: 8)
        addSubview(lineLabel)

        if let annotation = annotation as? MapAnnotation {
            stationLabel.text = annotation.title
            lineLabel.text = annotation.subtitle
            stationView.backgroundColor = annotation.color
        }
        isSelected = false
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        stationView.layer.cornerRadius = stationView.bounds.width / 2

        let stationLabelSize = stationLabel.sizeThatFits(CGSize.zero)
        let stationLabelOrigin = CGPoint(x: -stationLabelSize.width / 2, y: stationView.frame.maxY)
        stationLabel.frame = CGRect(origin: stationLabelOrigin, size: stationLabelSize)

        let lineLabelSize = lineLabel.sizeThatFits(CGSize.zero)
        let lineLabelOrigin = CGPoint(x: -lineLabelSize.width / 2, y: stationLabel.frame.maxY)
        lineLabel.frame = CGRect(origin: lineLabelOrigin, size: lineLabelSize)
    }

    override func prepareForReuse() {
        print("reuse")
    }

}
