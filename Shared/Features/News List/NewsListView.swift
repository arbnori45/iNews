//
//  ContentView.swift
//  Shared
//
//  Created by Arbnor Tefiki on 8.9.21.
//

import SwiftUI

struct NewsListView: View {
  @ObservedObject var newsViewModel = NewsListViewModel()

  init() {
    newsViewModel.getNews()
  }

  var body: some View {
    NavigationView {
      List {
        ForEach(newsViewModel.articles) { article in
          NavigationLink(destination: NewsDetails(viewModel: article)) {
            NewsView(viewModel: article)
          }
        }
      }
      .navigationTitle("iNews")
      .navigationBarTitleDisplayMode(.inline)
      .animation(.easeIn)
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    NewsListView()
  }
}
