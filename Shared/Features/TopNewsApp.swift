//
//  TopNewsApp.swift
//  Shared
//
//  Created by Arbnor Tefiki on 8.9.21.
//

import SwiftUI

@main
struct TopNewsApp: App {

  init() {
    let newAppearance = UINavigationBarAppearance()
    newAppearance.configureWithOpaqueBackground()
    newAppearance.backgroundColor = .brandingColor
    newAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
    UINavigationBar.appearance().standardAppearance = newAppearance
    UINavigationBar.appearance().tintColor = UIColor.white
  }

  var body: some Scene {
    WindowGroup {
      NewsListView()
    }
  }
}
