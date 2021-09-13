//
//  DateExtension.swift
//  TopNews
//
//  Created by Arbnor Tefiki on 9.9.21.
//

import Foundation

extension Date {
  func toString() -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "dd MMM yy"
    return dateFormatter.string(from: self)
  }
}

extension DateFormatter {
  static let serverFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
    return formatter
  }()
}
