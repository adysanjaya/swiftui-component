/*
 This source file is part of https://github.com/pitt500/Pokedex/
 
 Copyright (c) 2023 Pedro Rojas and project authors
 Licensed under MIT License
 */

import Foundation

struct PaginationResponse: Decodable {
  let count: Int
  let next: String?
  let previous: String?
  let results: [PaginationData]
}

struct PaginationData: Decodable, Identifiable {
  static var totalFound = 0

  let id: Int
  let name: String
  var url: URL {
    URL(string: "https://img.pokemondb.net/artwork/large/\(name).jpg")!
  }
  var urlRaw: String = ""

  private enum PokemonKeys: String, CodingKey {
    case name
  }

  init(id: Int, name: String) {
    self.id = id
    self.name = name
  }

  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: PokemonKeys.self)
    self.name = try container.decode(String.self, forKey: .name)
    self.urlRaw = "https://img.pokemondb.net/artwork/large/\(self.name).jpg"
    PaginationData.totalFound += 1
    self.id = PaginationData.totalFound
  }
}

extension PaginationData {
  static let sample = Self(id: 1, name: "bulbasaur")
}

extension PaginationData: Equatable {
  static func == (lhs: Self, rhs: Self) -> Bool {
    return lhs.id == rhs.id
  }
}
