//
//  WelcomeViewButtons.swift
//  QuizzAppBrainBuster
//
//  Created by Marcela Hernandez on 21/9/24.
//

import SwiftUI

struct WelcomeViewButtons: View {
    var info: String
    var viewDestination: any View
    
    var body: some View {
        NavigationStack {
            NavigationLink(destination: QuizzView(),
                label: {
                Text(info)
                    .background(
                        RoundedRectangle(cornerSize: CGSize(width: 30, height: 30), style: .continuous)
                            .foregroundColor(.lightPrincipalPurple)
                            .frame(width: 100, height: 30)
                    )
                    .foregroundColor(.white)
                    .font(.system(size: 25, weight: .bold))
            }
            )
        }
    }
}

#Preview {
    WelcomeViewButtons(info: "Start", viewDestination: QuizzView())
}
