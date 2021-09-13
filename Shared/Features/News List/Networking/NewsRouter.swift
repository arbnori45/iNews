//
//  NewsRouter.swift
//  TopNews (iOS)
//
//  Created by Arbnor Tefiki on 8.9.21.
//

import Alamofire
import Foundation

enum NewsRouter: Router {

  var params: Parameters? {
    return nil
  }

  // MARK: Routes
  case getNews

  var requiresAuth: Bool {
    return true
  }

  var path: String {
    switch self {
    case .getNews:
      return "?q=apple&from=2021-09-09&to=2021-09-09&sortBy=popularity&"
    }
  }

  var method: HTTPMethod {
    switch self {
    case .getNews:
      return .get
    }
  }
}
