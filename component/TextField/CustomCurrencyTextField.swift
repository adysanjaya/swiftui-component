//
//  CustomCurrencyTextField.swift
//  component
//
//  Created by Kioser PC on 20/01/24.
//

import SwiftUI

struct CustomCurrencyTextField: View {
  @State private var amount = "0"
  @State private var lastAmount = "0"
  var body: some View {
    Text("Format %.0f: \(lastAmount)")
    TextField("Masukan Jumlah:", text: $amount)
      .textFieldStyle(.roundedBorder)
      .onChange(of: amount) { newValue in
        if lastAmount != newValue {
          amount = String(format: "%.0f", Double(newValue) ?? 0.0)
          lastAmount = amount
        }
      }
  }
}

struct CustomCurrencyTextField_Previews: PreviewProvider {
  static var previews: some View {
    CustomCurrencyTextField()
  }
}
