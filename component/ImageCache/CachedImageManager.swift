//
//  CachedImageManager.swift
//  component
//
//  Created by Kioser PC on 26/01/24.
//

import Foundation

final class CachedImageManager: ObservableObject {
  @Published private(set) var currentState: CurrentState?

  private let imageRetriever = ImageRetriever()

  @MainActor
  func load(_ imgUrl: String, cache: ImageCache = .shared) async {
    self.currentState = .loading
    
    if let imageData = cache.object(forkey: imgUrl as NSString) {
      self.currentState = .success(data: imageData)
      return
    }

    do {
      let data = try await imageRetriever.fetch(imgUrl)
      self.currentState = .success(data: data)
      cache.set(object: data as NSData, forkey: imgUrl as NSString)
    } catch {
      self.currentState = .failed(error: error)
    }
  }
}

extension CachedImageManager {
  enum CurrentState {
    case loading
    case failed(error: Error)
    case success(data: Data)
  }
}
