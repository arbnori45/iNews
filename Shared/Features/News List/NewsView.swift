//
//  NewsView.swift
//  TopNews
//
//  Created by Arbnor Tefiki on 8.9.21.
//

import SwiftUI
import SDWebImageSwiftUI

struct NewsView: View {
  @ObservedObject var viewModel: ArticleViewModel

  var body: some View {
    HStack(alignment: .top) {
      WebImage(url: viewModel.imageUrl)
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(width: 100, height: 100)
        .padding(.leading, LayoutConstants.smallPadding)
        .padding(.trailing, LayoutConstants.smallPadding)
      VStack(alignment: .leading) {
        Text(viewModel.title)
          .padding(.top, LayoutConstants.smallPadding)
          .padding(.bottom, LayoutConstants.smallPadding)
          .font(.jost(size: 16, weight: .bold))
        Text(viewModel.date)
          .font(.jost(size: 13))
      }
    }
  }
}
