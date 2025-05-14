//
//  ContentView.swift
//  PaperBrain
//
//  Created by MacRow on 14/05/2025.
//

import SwiftUI

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle.bold())
            .foregroundStyle(.white)
    }
}
extension View {
    func titleStyle() -> some View {
        modifier(Title())
    }
}

let choices = ["📄", "✂️", "🪨"]
let wins: [String: String] = [
    "📄": "✂️",
    "✂️": "🪨",
    "🪨": "📄"
]
let loses: [String: String] = [
    "📄": "🪨",
    "✂️": "📄",
    "🪨": "✂️"
]

struct ContentView: View {
    @State private var appChoice = choices.randomElement()!
    @State private var playerChoice = ""
    @State private var shouldWin = Bool.random()
    @State private var round = 1
    @State private var playerScore = 0
    @State private var gameOver = false
    
    var body: some View {
        ZStack{
            LinearGradient(
                gradient: Gradient(colors: [shouldWin ? .yellow.opacity(0.8) :.red.opacity(0.7), shouldWin ? .white : .black]),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            VStack {

                VStack{
                    Text("Score: \(playerScore)/\(round-1)")
                        .titleStyle()
                }
                Spacer()
                
                VStack{
                    Text("Round \(NumberFormatter.localizedString(from: NSNumber(value: round), number: .spellOut).capitalized)")
                        .foregroundStyle(.secondary)
                        .font(.subheadline.weight(.heavy))
                    
                    Text(shouldWin ? "Win" : "Lose")
                        .titleStyle()
                    Text(appChoice)
                        .font(.system(size: 150))
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 40)
                .background(.ultraThinMaterial)
                .clipShape(.rect(cornerRadius: 20))
                Spacer()
                VStack{
//                    Button("Flip"){
//                        shouldWin.toggle()
//                        appChoice = choices.randomElement()!
//                    }
                    Text("Your Choice: ")
                        .foregroundStyle(.secondary)
                        .font(.subheadline.weight(.heavy))
                    HStack{
                        ForEach (choices.shuffled(), id: \.self) { choice in
                            Button(choice){
                                choiceTapped(choice)
                            }
                            .font(.system(size: 50))
                        }
                        .padding(19)
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 40)
                .background(.ultraThinMaterial)
                .clipShape(.rect(cornerRadius: 20))
                Spacer()
                Spacer()
            }
            .padding()
        }
        .alert("Game Over", isPresented: $gameOver){
            Button("New Game", action: resetGame)
        }
    }
    
    func choiceTapped (_ choice: String){
        playerChoice = choice
        round += 1
        if appChoice == (shouldWin ? loses[choice] : wins[choice]) {
            playerScore += 1
        } else {
            playerScore -= 1
        }
        appChoice = choices.randomElement()!
        shouldWin.toggle()
        if round == 10 {
            gameOver = true
        }
    }
    
    func resetGame(){
        playerScore = 0
        round = 1
        appChoice = choices.randomElement()!
        shouldWin = Bool.random()
    }
}


#Preview {
    ContentView()
}
