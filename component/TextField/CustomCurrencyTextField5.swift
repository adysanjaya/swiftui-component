//
//  CustomCurrencyTextField5.swift
//  component
//
//  Created by Kioser PC on 20/01/24.
//

import SwiftUI

struct CustomCurrencyTextField5: View {
  @State private var amount = "0"
  @State private var lastAmount = "0"
  let currencyFormat: String
  var body: some View {
    Text("Format Custom IDR: \(formattedAmount)")
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
    formatter.currencySymbol = currencyFormat
    formatter.minimumFractionDigits = 0 //jumlah minimal angka dibelakang koma
    formatter.zeroSymbol = "" //tampilkan placeholder saat initial run
    formatter.currencyGroupingSeparator = "." //karakter pemisah ribuan
    return formatter.string(from: NSNumber(value: sanitize)) ?? ""
  }
}

struct CustomCurrencyTextField5_Previews: PreviewProvider {
  static var previews: some View {
    CustomCurrencyTextField5(currencyFormat: "IDR")
  }
}
