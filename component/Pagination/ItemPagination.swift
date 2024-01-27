/*
 This source file is part of https://github.com/pitt500/Pokedex/

 Copyright (c) 2023 Pedro Rojas and project authors
 Licensed under MIT License
 */

import SwiftUI

struct ItemPagination: View {
  let data: PaginationData
  private let imageWidth = 110.0
  private let cellHeight = 130.0
  private var attributedText: AttributedString {
    guard let text = try? AttributedString(markdown: "See [More](https://pokemondb.net/pokedex/\(data.name))")
    else { return "" }
    
    return text
  }
  
  var body: some View {
    CachedImage(
      url: data.url.absoluteString
    ) { phase in
      switch phase {
      case .success(let image):
        HStack {
          image
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: imageWidth)
            .padding(.trailing, 10)
          
          VStack(alignment: .leading) {
            Text("**\(data.name.capitalized)**")
              .font(.system(size: 24))
            Text("*#\(data.id)*")
              .font(.system(size: 18))
              .foregroundColor(.gray)
            
            Text(attributedText)
          }
          
          Spacer()
        }
      case .failure(let error):
        ErrorImageView(error: error)
      case .empty:
        HStack {
          ProgressView()
            .progressViewStyle(CircularProgressViewStyle(tint: .red))
          Spacer()
        }
      @unknown default:
        Image(systemName: "questionmark")
      }
    }
    .frame(height: cellHeight)
    .padding()
    .listRowSeparator(.hidden)
  }
}

struct ItemPagination_Previews: PreviewProvider {
  static var previews: some View {
    ItemPagination(data: PaginationData.sample)
  }
}
