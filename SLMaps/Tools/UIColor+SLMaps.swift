//
//  UIColor+SLMaps.swift
//  SLMaps
//
//  Created by Igor Smirnov on 11/07/2018.
//  Copyright © 2018 Complex Numbers. All rights reserved.
//

import UIKit

extension UIColor {

    class func colorWith(hex: UInt) -> UIColor {
        return UIColor.colorWith(hex: hex, alpha: 1.0)
    }

    class func colorWith(hex: UInt, alpha: CGFloat) -> UIColor {
        let blue = hex % 0x100
        let green = (hex >> 8) % 0x100
        let red = (hex >> 16) % 0x100
        return UIColor.colorWith(red: red, green: green, blue: blue, alpha: alpha)
    }

    class func colorWith(red: UInt, green: UInt, blue: UInt, alpha: CGFloat) -> UIColor {
        let r = CGFloat(red) / 255.0
        let g = CGFloat(green) / 255.0
        let b = CGFloat(blue) / 255.0
        return UIColor(red: r, green: g, blue: b, alpha: alpha)
    }

    class func colorWith(string: String) -> UIColor {
        guard let color = UInt(string, radix: 16) else { return .clear }
        return colorWith(hex: color)
    }

}
