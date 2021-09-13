//
//  NewsListViewModel.swift
//  TopNews (iOS)
//
//  Created by Arbnor Tefiki on 8.9.21.
//

import SwiftUI

class NewsListViewModel: ObservableObject {
  @Published var articles = [ArticleViewModel]()
  @Published var loading: Bool = false

  func getNews() {
    loading = true
    APIManager.shared.getNewsList { news in
      self.loading = false
      news?.articles.forEach({ article in
        let articleViewModel = ArticleViewModel(article: article)
        self.articles.append(articleViewModel)
      })
    }
  }
}
