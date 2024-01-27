/*
 This source file is part of https://github.com/pitt500/Pokedex/
 
 Copyright (c) 2023 Pedro Rojas and project authors
 Licensed under MIT License
 */

import Foundation

class PaginationViewModel: ObservableObject {
  @Published private(set) var data: [PaginationData] = []
  private let urlSession = URLSession(configuration: .default)
  private let limit = 10
  private var offset = 0
  
  func restartPagination() {
    offset = 0
    PaginationData.totalFound = 0
  }
  
  private func getPokemons() async throws -> [PaginationData] {
    let url = URL(string: "https://pokeapi.co/api/v2/pokemon/?limit=\(limit)&offset=\(offset)")!
    let (data, response) = try await URLSession.shared.data(from: url)
    
    guard (response as? HTTPURLResponse)?.statusCode == 200
    else { throw HttpError.serverError }
    
    guard let decoded = try? JSONDecoder().decode(PaginationResponse.self, from: data)
    else { throw HttpError.noData }
    
    offset += limit
    
    return decoded.results
  }
  
  @MainActor func load(restart: Bool = false) async {
    if restart {
      restartPagination()
      data.removeAll()
    }
    
    do {
      data += try await getPokemons()
    } catch {
      print("error: ", error)
    }
  }
}
