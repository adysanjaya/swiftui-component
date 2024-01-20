//
//  CustomCurrencyTextField4.swift
//  component
//
//  Created by Kioser PC on 20/01/24.
//

import SwiftUI

struct CustomCurrencyTextField4: View {
  @State private var amount = "0"
  @State private var lastAmount = "0"
  
  var body: some View {
    Text("Format Locale id_ID: \(formattedAmount)")
    TextField("Masukan Jumlah:", text: $amount)
      .textFieldStyle(.roundedBorder)
      .onChange(of: amount) { newValue in
        if lastAmount != newValue {
          amount = formattedAmount
          lastAmount = amount
        }
      }
  }
  
  private var formattedAmount: String {
    let sanitize = Double(amount.filter { $0.isNumber }) ?? 0.0
    let formatter = NumberFormatter()
    formatter.numberStyle = .currency
    formatter.locale = Locale(identifier: "id_ID")
    return formatter.string(from: NSNumber(value: sanitize)) ?? ""
  }
}

struct CustomCurrencyTextField4_Previews: PreviewProvider {
  static var previews: some View {
    CustomCurrencyTextField4()
  }
}
