//
//  UIFont+ProDisplay.swift
//  Bookie
//
//  Created by newAccount on 29.05.2023.
//

import Foundation
import UIKit

enum ProDisplayFontType: String {
    case SFBold = "SFProDisplay-Bold"
    case SFMedium = "SFProDisplay-Medium"
}

extension UIFont {
    static func displayFont(ofSize size: CGFloat, fontType type: ProDisplayFontType) -> UIFont {
        return UIFont(name: type.rawValue, size: size) ?? UIFont.systemFont(ofSize: size)
    }
}
