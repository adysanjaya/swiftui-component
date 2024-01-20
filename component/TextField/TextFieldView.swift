//
//  TextFieldView.swift
//  component
//
//  Created by Kioser PC on 20/01/24.
//

import SwiftUI

struct TextFieldView: View {
  var body: some View {
    VStack {
      Text("Format TextField")

      HStack {
        VStack(alignment: .leading) {
          CustomCurrencyTextField()
          CustomCurrencyTextField2()
          CustomCurrencyTextField3()
          CustomCurrencyTextField4()
          CustomCurrencyTextField5(currencyFormat: "IDR")
        }
        Spacer()
      }
      .padding()
    }
    .padding()
  }
}

struct TextFieldView_Previews: PreviewProvider {
  static var previews: some View {
    TextFieldView()
  }
}
