//
//  LevelsButton.swift
//  QuizzAppBrainBuster
//
//  Created by Marcela Hernandez on 24/9/24.
//

import SwiftUI

struct LevelsButton: View {
    var levelsName: String = ""
    var destination: some View { QuizzView() }
    
    var body: some View {
        NavigationStack{
            NavigationLink(destination: destination,
                label: {
                Text(levelsName)
                    .background(
                        RoundedRectangle(cornerSize: CGSize(width: 30, height: 30), style: .continuous)
                            .foregroundColor(.lightPrincipalPurple)
                            .frame(width: 200, height: 200)
                    )
                    .foregroundColor(.white)
                    .font(.system(size: 25, weight: .bold))
                    .frame(width: 190, height: 190)
            }
            )
            
        }
    }
}

#Preview {
    LevelsButton()
}
