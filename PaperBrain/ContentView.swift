//
//  ContentView.swift
//  PaperBrain
//
//  Created by MacRow on 14/05/2025.
//

import SwiftUI

let choices = ["Paper", "Scissors", "Rock"]

struct ContentView: View {
    @State private var appChoice = choices.randomElement()!
    @State private var shouldWin = Bool.random()
    var body: some View {
        VStack {
            Image(systemName: "scissors.circle.fill")
                .imageScale(.large)
                .foregroundStyle(.black)
            Text("Welcome to PaperBrain, choice is \(appChoice)")
            Text(shouldWin ? "Win" : "Lose")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
