//
//  AnnotationView.swift
//  SLMaps
//
//  Created by Igor Smirnov on 11/07/2018.
//  Copyright © 2018 Complex Numbers. All rights reserved.
//

import UIKit
import MapKit

class MapAnnotationView: MKAnnotationView {

    static let reuseIdentifier = "Annotation"

    var backgroundView = UIView()
    var titleLabel = UILabel()
    var subtitleLabel = UILabel()

    override var isSelected: Bool {
        didSet {
            backgroundView.alpha = isSelected ? 1.0 : 0.5
            subtitleLabel.isHidden = !isSelected
        }
    }

    init(annotation: MapAnnotation?, reuseIdentifier: String?) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)

        bounds = CGRect(x: 0, y: 0, width: 16, height: 16)
        backgroundColor = .clear

        backgroundView.backgroundColor = .orange
        backgroundView.frame = bounds
        backgroundView.layer.masksToBounds = true
        backgroundView.layer.cornerRadius = backgroundView.frame.height / 2
        addSubview(backgroundView)

        titleLabel.font = UIFont.systemFont(ofSize: 12)
        titleLabel.text = annotation?.title
        let titleLabelSize = titleLabel.sizeThatFits(CGSize(width: CGFloat.greatestFiniteMagnitude, height: 0.0))
        titleLabel.frame = CGRect(x: (frame.width - titleLabelSize.width) / 2, y: frame.height + 2, width: titleLabelSize.width, height: titleLabelSize.height)
        addSubview(titleLabel)

        subtitleLabel.font = UIFont.systemFont(ofSize: 10)
        subtitleLabel.text = annotation?.subtitle
        let subtitleLabelSize = subtitleLabel.sizeThatFits(CGSize(width: CGFloat.greatestFiniteMagnitude, height: 0.0))
        subtitleLabel.frame = CGRect(x: (frame.width - subtitleLabelSize.width) / 2, y: titleLabel.frame.maxY + 2, width: subtitleLabelSize.width, height: subtitleLabelSize.height)
        addSubview(subtitleLabel)
        clipsToBounds = false
        isSelected = false
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
}
