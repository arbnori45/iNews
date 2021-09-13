//
//  BaseRouter.swift
//  TopNews (iOS)
//
//  Created by Arbnor Tefiki on 8.9.21.
//

import Foundation
import Alamofire

class BaseRouterManager {
  static let baseURL = "https://newsapi.org/v2/everything"
  private static let apiKey = "apiKey=3b793a43923140f39304505f70fa41db"
  static let apiVersion = ""

  // MARK: - RouterManager
  static func buildRequest(_ router: Router) throws -> URLRequest {
    let url = URL(string: baseURL + apiVersion + router.path + apiKey)!
    var urlRequest = URLRequest(url: url)
    urlRequest.httpMethod = router.method.rawValue

    router.headers?.enumerated().forEach {
      urlRequest.setValue($0.element.value, forHTTPHeaderField: $0.element.key)
    }

    let encoding = JSONEncoding.default
    if let arrayParams = router.params?[""] as? [Parameters] {
      return try encoding.encode(urlRequest, withJSONObject: arrayParams)
    }
    return try encoding.encode(urlRequest, with: router.params)
  }
}
