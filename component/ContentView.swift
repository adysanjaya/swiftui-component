//
//  ContentView.swift
//  component
//
//  Created by Kioser PC on 20/01/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            TextFieldView()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
