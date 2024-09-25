//
//  PopupView.swift
//  QuizzAppBrainBuster
//
//  Created by Marcela Hernandez on 24/9/24.
//

import SwiftUI

struct PopupView: View {
    @ObservedObject var quizzManager = QuizzManager()
    
    var body: some View {
        ZStack(alignment: .center) {
            RoundedRectangle(cornerRadius: 30)
                .foregroundStyle(Color.white)
                .frame(width: 250, height: 250)
            VStack(spacing: 20){
                Text("A clue for you...")
                    .foregroundStyle(Color.principalPurple)
                    .font(.system(size: 20))
                
                Text("The capital start with the letter \(quizzManager.getFirstLetter())")
                    .frame(width: 240, height: 100)
                    .font(.system(size: 25).italic().bold())
                    .foregroundStyle(Color.principalPurple)
                
                Image(.lightBulb)
                    .resizable()
                    .frame(width: 50, height: 50)
            }
            .background(.clear)
        }
        .background(Color.clear)
    }
}

#Preview {
    PopupView(quizzManager: QuizzManager())
}
