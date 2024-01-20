//
//  CostumCurrencyTextField3.swift
//  component
//
//  Created by Kioser PC on 20/01/24.
//

import SwiftUI

struct CustomCurrencyTextField3: View {
  @State private var amount = "0"
  @State private var lastAmount = "0"

  var body: some View {
    Text("Format Currency Default: \(formattedAmount)")
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
    let sanitize = Double(amount.filter { $0.isNumber || $0 == "." }) ?? 0.0
    let formatter = NumberFormatter()
    formatter.numberStyle = .currency
    return formatter.string(from: NSNumber(value: sanitize)) ?? ""
  }
}

struct CustomCurrencyTextField3_Previews: PreviewProvider {
  static var previews: some View {
    CustomCurrencyTextField3()
  }
}
