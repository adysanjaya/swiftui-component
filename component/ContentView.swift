//
//  ContentView.swift
//  component
//
//  Created by Kioser PC on 20/01/24.
//

import SwiftUI

struct ContentView: View {
  @EnvironmentObject private var coordinator: Coordinator
  var body: some View {
    List {
      Button("TextField Currency"){
        coordinator.push(.pageTextField)
      }
      Button("Pagination"){
        coordinator.push(.pagePagination)
      }
    }
    .navigationTitle("My Components")
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
