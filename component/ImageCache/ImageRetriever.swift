//
//  ImageRetriever.swift
//  component
//
//  Created by Kioser PC on 26/01/24.
//

import Foundation

struct ImageRetriever {
  func fetch(_ imgUrl: String) async throws -> Data {
    guard let url = URL(string: imgUrl) else {
      throw HttpError.badUrl
    }
    
    let (data, _) = try await URLSession.shared.data(from: url)
    return data
  }
}
