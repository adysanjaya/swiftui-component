//
//  CustomCurrencyTextField2.swift
//  component
//
//  Created by Kioser PC on 20/01/24.
//

import SwiftUI

struct CustomCurrencyTextField2: View {
  @State private var amount = "0"
  @State private var lastAmount = "0"
  var body: some View {
    Text("Format Decimal 2 Digit: \(lastAmount)")
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
    formatter.numberStyle = .decimal
    formatter.minimumFractionDigits = 2
    return formatter.string(from: NSNumber(value: sanitize)) ?? ""
  }
}

struct CustomCurrencyTextField2_Previews: PreviewProvider {
  static var previews: some View {
    CustomCurrencyTextField2()
  }
}
