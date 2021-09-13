//
//  ApiNews.swift
//  TopNews (iOS)
//
//  Created by Arbnor Tefiki on 8.9.21.
//

import UIKit

extension APIManager {

  typealias GetNews = (News?) -> Void

  func getNewsList(completionHandler: @escaping GetNews) {
    let router = NewsRouter.getNews
    request(router, completionHandler: completionHandler)
  }
}
