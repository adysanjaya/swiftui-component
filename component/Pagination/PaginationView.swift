/*
 This source file is part of https://github.com/pitt500/Pokedex/

 Copyright (c) 2023 Pedro Rojas and project authors
 Licensed under MIT License
 */

import SwiftUI

struct PaginationView: View {
  @StateObject private var loader = PaginationViewModel()

  var body: some View {
    ZStack {
      Color(.secondarySystemBackground)
        .edgesIgnoringSafeArea(.all)
      ScrollView {
        LazyVStack {
          ForEach(loader.data) { data in
            ItemPagination(data: data)
              .onAppear {
                if data == loader.data.last {
                  Task {
                    await loader.load()
                  }
                }
              }
          }
        }
      }
      .scrollIndicators(.hidden)
      .padding(.horizontal,10)
      .background(.white)
      .cornerRadius(8)
      .padding()
      .navigationTitle("Pagination")
    }
    .task {
      await loader.load(restart: true)
    }
    .refreshable {
      await loader.load(restart: true)
    }
    .onAppear {
      print("cache size \(URLCache.shared.memoryCapacity)")
    }
  }
}

struct PaginationView_Previews: PreviewProvider {
  static var previews: some View {
    PaginationView()
  }
}
