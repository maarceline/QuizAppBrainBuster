//
//  Testview.swift
//  QuizzAppBrainBuster
//
//  Created by Marcela Hernandez on 23/9/24.
//

import SwiftUI

struct Testview: View {
    @State var quizzManager = QuizzManagerTest.self
    
    @State private var selectedCountry: String = ""
    @State private var correctCapital: String = ""
    @State private var shuffledCapitals: [String] = []
    @State private var selectedCapital: String = ""
    @State private var feedbackMessage: String = ""
    
    var body: some View {
        VStack {
                    // Display the country question
                    Text("What is the capital of \(selectedCountry)?")
                        .font(.title)
                        .padding()

                    // Ensure shuffledCapitals has 3 capitals before rendering the buttons
                    if shuffledCapitals.count == 3 {
                        ForEach(0 ..< 3, id: \.self) { index in
                            Button(action: {
                                selectedCapital = shuffledCapitals[index] // Capture the capital selected by the user

                                // Compare selected capital with the correct capital
                                if selectedCapital == correctCapital {
                                    feedbackMessage = "Nice job!"
                                } else {
                                    feedbackMessage = "Oh no! The correct answer is \(correctCapital)."
                                }

                            }) {
                                // Display the capital for each button
                                Text(shuffledCapitals[index])
                                    .bold()
                                    .frame(width: 300, height: 60)
                                    .background(
                                        RoundedRectangle(cornerRadius: 20, style: .continuous)
                                            .foregroundColor(.lightPrincipalPurple)
                                    )
                                    .foregroundColor(.white)
                            }
                        }
                    } else {
                        Text("Loading options...")
                    }

                    // Show feedback after user selection
                    Text(feedbackMessage)
                        .padding()
                        .foregroundColor(.green)
                }
                .padding()
                .onAppear {
                    loadNewQuestion() // Load a new question when the view appears
                }
            }
    func loadNewQuestion() {
            // Get a random country from the quiz manager
            selectedCountry = quizzManager.getCountry()

            // Find the index of the selected country
            if let selectedCountryIndex = quizzManager.quiz.firstIndex(where: { $0.country == selectedCountry }) {
                correctCapital = quizzManager.quiz[selectedCountryIndex].capital

                // Get 2 other incorrect capitals
                var capitals = quizzManager.quiz.map { $0.capital }
                capitals.remove(at: selectedCountryIndex) // Remove the correct capital

                // Pick two random incorrect capitals
                let incorrectCapitals = capitals.shuffled().prefix(2)

                // Combine the correct capital and the incorrect ones, then shuffle them
                shuffledCapitals = ([correctCapital] + incorrectCapitals).shuffled()
            }
        }
    }


struct QuizzManagerTest {
    @Published var quiz = [
        (country: "USA", capital: "Washington, D.C."),
        (country: "France", capital: "Paris"),
        (country: "Japan", capital: "Tokyo")
    ]

    // Function to randomly select a country
    func getCountry() -> String {
        return quiz.randomElement()?.country ?? ""
    }
}

#Preview {
    Testview()
}
