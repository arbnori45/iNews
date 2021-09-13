//
//  NewsDetails.swift
//  TopNews
//
//  Created by Arbnor Tefiki on 10.9.21.
//

import SwiftUI
import SDWebImageSwiftUI

struct NewsDetails: View {
  @ObservedObject var viewModel: ArticleViewModel

  var body: some View {
    ScrollView {
      headerView()
      articleContentView()
    }
  }

  func headerView() -> some View {
    ZStack(alignment: .bottom) {
      WebImage(url: viewModel.imageUrl)
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(alignment: .top)
      ZStack {
        Text(viewModel.title)
          .foregroundColor(Color.white)
          .padding()
          .font(.jost(size: 22, weight: .bold))
      }
      .background(RoundedCorners(topLeft: LayoutConstants.normalPadding, topRight: LayoutConstants.normalPadding).fill(Color.black.opacity(0.5)))
    }
  }

  func articleContentView() -> some View {
    VStack(alignment: .leading) {
      HStack(alignment: .top) {
        Image(systemName: "person.fill")
          .foregroundColor(Color.brandingColor)
        Text(viewModel.author)
          .padding(.bottom, LayoutConstants.smallPadding)
      }.padding(LayoutConstants.smallPadding)
      Text(viewModel.articleDescription)
        .padding()
    }
  }

}
