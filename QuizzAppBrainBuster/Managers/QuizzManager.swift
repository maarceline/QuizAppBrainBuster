//
//  QuizzManager.swift
//  QuizzAppBrainBuster
//
//  Created by Marcela Hernandez on 21/9/24.
//

import Foundation
import SwiftUI
import MijickPopupView

class QuizzManager: ObservableObject {
    @Published var shuffledCapitals: [String] = []
    @Published var currentQuestion: Int = 0
    @Published var selectedCapital: String = ""
    
    var score = 0
    var questionNumber = (0..<5).randomElement()
    
    let quiz = [
        Countries(country: "Spain", capital: "Madrid"),
        Countries(country: "Portugal", capital: "Lisboa"),
        Countries(country: "France", capital: "Paris"),
        Countries(country: "Germany", capital: "Berlin"),
        Countries(country: "Italy", capital: "Rome"),
        Countries(country: "Netherlands", capital: "Amsterdam")
    ].shuffled()
    
    func getCountry() -> String {
        return quiz[currentQuestion].country
    }
    
    func getCorrectCapital () -> String {
        return quiz[currentQuestion].capital
    }
    func getCapitals () -> [String] {
        return shuffledCapitals
    }
    
    func shuffleCapitals() {
        let correctCapital = getCorrectCapital()
        var capitals = quiz.map { $0.capital }
        capitals.removeAll { $0 == correctCapital }
        
        let incorrectCapitals = capitals.shuffled().prefix(2)
        shuffledCapitals = ([correctCapital] + incorrectCapitals).shuffled()
    }
    
    func getNewQuestion () {
        if currentQuestion < quiz.count - 1 {
            currentQuestion += 1
        } else {
            currentQuestion = 0
            print("try again")
        }
        shuffleCapitals()
    }
    
    func getColor (capital: String) -> Color {
        if selectedCapital == "" {
            return .lightPrincipalPurple
        } else if capital == selectedCapital {
            print("Correct Capital: \(getCorrectCapital())")
            return selectedCapital == getCorrectCapital() ? .green : .red
        } else {
            return .lightPrincipalPurple
        }
    }
   
}



