//
//  Coordinator.swift
//  component
//
//  Created by Kioser PC on 26/01/24.
//

import SwiftUI

enum Page: String, Identifiable {
  case pageMain,
       pageTextField,
       pagePagination
  
  var id: String {
    self.rawValue
  }
}

class Coordinator: ObservableObject {
  @Published var path = NavigationPath()
  private var parameters: [Page: Any] = [:]
  
  func push<T>(_ page: Page, params: T) {
    self.parameters[page] = params
    self.path.append(page)
  }
  
  func push(_ page: Page) {
    self.parameters[page] = nil
    self.path.append(page)
  }
  
  func pop() {
    self.path.removeLast()
  }
  
  func popToRoot() {
    self.path.removeLast(self.path.count)
  }
  
  @ViewBuilder
  func build(page: Page) -> some View {
    switch page {
    case .pageMain:
      ContentView()
    case .pageTextField:
      TextFieldView()
    case .pagePagination:
      PaginationView()
    }
  }
}
