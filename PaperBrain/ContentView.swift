//
//  ContentView.swift
//  PaperBrain
//
//  Created by MacRow on 14/05/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "scissors.circle.fill")
                .imageScale(.large)
                .foregroundStyle(.black)
            Text("Welcome to PaperBrain")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
