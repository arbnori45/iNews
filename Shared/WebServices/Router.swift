//
//  Router.swift
//  TopNews (iOS)
//
//  Created by Arbnor Tefiki on 8.9.21.
//

import Foundation
import Alamofire

protocol Router: URLRequestConvertible {
  var path: String { get }
  var requiresAuth: Bool { get }
  var params: Parameters? { get }
  var method: Alamofire.HTTPMethod { get }
  var headers: [String: String]? { get }
}

extension Router {
  func asURLRequest() throws -> URLRequest {
    return try BaseRouterManager.buildRequest(self)
  }

  var requiresAuth: Bool { return true }
  var headers: [String: String]? { return nil }
}
