//
//  UIFont+Extension.swift
//  myTunes
//
//  Created by Hüsnü Taş on 28.10.2021.
//

import UIKit

extension UIFont {
    static func setFont(fontType: MainFont, size: CGFloat) -> UIFont {
        return UIFont(name: fontType.rawValue, size: size) ?? UIFont()
    }
}

enum MainFont: String {
    case black = "Roboto-Black"
    case blackItalic = "Roboto-BlackItalic"
    case bold = "Roboto-Bold"
    case boldItalic = "Roboto-BoldItalic"
    case italic = "Roboto-Italic"
    case light = "Roboto-Light"
    case lightItalic = "Roboto-LightItalic"
    case medium = "Roboto-Medium"
    case mediumItalic = "Roboto-MediumItalic"
    case regular = "Roboto-Regular"
    case thin = "Roboto-Thin"
    case thinItalic = "Roboto-ThinItalic"
}
