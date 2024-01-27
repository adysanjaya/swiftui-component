//
//  ErrorImageView.swift
//  component
//
//  Created by Kioser PC on 26/01/24.
//

import SwiftUI

struct ErrorImageView: View {
  let error: Error

  var body: some View {
    print(error)
    return Text("❌ **Error**").font(.system(size: 60))
  }
}

struct ErrorImageView_Previews: PreviewProvider {
  static var previews: some View {
    ErrorImageView(error: HttpError.noData)
  }
}
