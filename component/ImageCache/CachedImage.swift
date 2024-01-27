//
//  CachedImage3.swift
//  component
//
//  Created by Kioser PC on 26/01/24.
//

import SwiftUI

struct CachedImage<Content: View>: View {
  @StateObject private var manager = CachedImageManager()
  let url: String
  @ViewBuilder let content: (AsyncImagePhase) -> Content

  var body: some View {
    ZStack {
      switch manager.currentState {
      case .loading:
        content(.empty)
      case .success(let data):
        if let image = UIImage(data: data) {
          content(.success(Image(uiImage: image)))
        }
        else {
          content(.failure(ChachedImageError.invalidData))
        }
      case .failed(let error):
        content(.failure(error))
      default:
        content(.empty)
      }
    }
    .task {
      print("task \(url)")
      await manager.load(url)
    }
    .onAppear {
      print("appear \(url)")
    }
    .onDisappear {
      print("disapear \(url)")
    }
  }
}

struct CachedImage_Previews: PreviewProvider {
  static var previews: some View {
    CachedImage(url: "") { _ in
      EmptyView()
    }
  }
}

extension CachedImage {
  enum ChachedImageError: Error {
    case invalidData
  }
}
