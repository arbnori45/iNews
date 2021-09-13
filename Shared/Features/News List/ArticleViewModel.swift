//
//  ArticleViewModel.swift
//  TopNews
//
//  Created by Arbnor Tefiki on 13.9.21.
//

import SwiftUI

class ArticleViewModel: ObservableObject, Identifiable {
  var title: String
  var imageUrl: URL?
  var date: String
  var author: String
  var articleDescription: String

  init(article: Article) {
    self.title = article.title
    self.imageUrl = URL(string: article.urlToImage)
    self.date = article.publishedAt.toString()
    self.author = article.author ?? ""
    self.articleDescription = article.articleDescription
  }
}
