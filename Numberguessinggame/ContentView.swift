//
//  ContentView.swift
//  Numberguessinggame
//
//  Created by Kokila on 14/11/25.
//

import SwiftUI

struct ContentView: View {
    @State private var targetNumber = Int.random(in: 1...100)
    @State private var userGuess = ""
    @State private var message = ""

    var body: some View {
        VStack(spacing: 20) {
            Text("🔢 Number Guessing Game")
                .font(.largeTitle)
                .bold()

            Text("I'm thinking of a number between 1 and 100.")
                .font(.subheadline)

            TextField("Enter your guess", text: $userGuess)
                .keyboardType(.numberPad)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding(.horizontal)

            Button("Check Guess") {
                checkGuess()
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(12)

            Text(message)
                .font(.title2)
                .foregroundColor(.purple)
                .padding()

            Button("Restart Game") {
                restartGame()
            }
            .padding()
            .background(Color.red)
            .foregroundColor(.white)
            .cornerRadius(12)

            Spacer()
        }
        .padding()
    }

    func checkGuess() {
        guard let guess = Int(userGuess) else {
            message = "⚠️ Please enter a valid number!"
            return
        }

        if guess < targetNumber {
            message = "📉 Too low! Try again."
        } else if guess > targetNumber {
            message = "📈 Too high! Try again."
        } else {
            message = "🎉 Correct! You guessed it!"
        }
    }

    func restartGame() {
        targetNumber = Int.random(in: 1...100)
        userGuess = ""
        message = ""
    }
}


#Preview {
    ContentView()
}
