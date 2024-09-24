//
//  ButtonView.swift
//  QuizzAppBrainBuster
//
//  Created by Marcela Hernandez on 21/9/24.
//

import SwiftUI

struct ButtonView: View {
    var quizzManager = QuizzManager()
    @State private var selectedCapital: String = ""
    @State private var shuffledCapitals: [String] = []
    @State private var text: String = ""
    var answer: String
    
    var body: some View {
        Button {
            let selectedCountry = quizzManager.getCountry()
            let selectedCountryIndex = quizzManager.quiz.firstIndex(where: {$0.country == selectedCountry})
            let correctCapital = quizzManager.quiz[selectedCountryIndex!].capital
            //checking the correct capital for the selected country
            print(correctCapital)
            print(selectedCountry)
            print(selectedCapital)
            
            if selectedCapital == correctCapital {
                print("Nice job!")
            } else {
                print("Oh no!, incorrect")
            }
            
            
            let countrySelectedIndex = quizzManager.quiz.firstIndex(where: {$0.country == selectedCountry})!
            var capital = quizzManager.quiz.map{$0.capital}
            capital.remove(at: countrySelectedIndex)
            
            let incorrectCapitals = capital.shuffled().prefix(2)
            
            shuffledCapitals = (incorrectCapitals + [correctCapital])
            
            text = shuffledCapitals.randomElement()!
            
        } label: {
            Text(text)
                .bold()
                .frame(width: 300, height: 60)
                .background(
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .foregroundColor(.lightPrincipalPurple)
                )
                .foregroundColor(.white)
        }
        .onAppear() {
            
        }
    }
    
}

#Preview {
    ButtonView(answer: "Answer")
}
