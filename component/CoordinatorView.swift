//
//  CoordinatorView.swift
//  component
//
//  Created by Kioser PC on 26/01/24.
//

import SwiftUI

struct CoordinatorView: View {
  @StateObject private var coordinator = Coordinator()
  var body: some View {
    NavigationStack(path: $coordinator.path) {
      coordinator.build(page: .pageMain)
        .navigationDestination(for: Page.self) { page in
          coordinator.build(page: page)
        }
    }
    .environmentObject(coordinator)
  }
}

struct CoordinatorView_Previews: PreviewProvider {
  static var previews: some View {
    CoordinatorView()
  }
}
