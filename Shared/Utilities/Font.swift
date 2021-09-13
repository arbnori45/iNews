//
//  Font.swift
//  TopNews
//
//  Created by Arbnor Tefiki on 10.9.21.
//

import SwiftUI

extension Font {
  public static func jost(size: CGFloat, weight: Font.Weight = .regular) -> Font {
    var font = "Jost-Regular"
    switch weight {
    case .bold: font = "Jost-Bold"
    case .medium: font = "Jost-Medium"
    default: break
    }
    return Font.custom(font, size: size)
  }
}
