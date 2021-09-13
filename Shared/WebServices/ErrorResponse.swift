//
//  ErrorResponse.swift
//  TopNews (iOS)
//
//  Created by Arbnor Tefiki on 8.9.21.
//

import Foundation

struct ErrorResponse: Codable {
  var message: String?
  var code: String?
  var status: String?
}
