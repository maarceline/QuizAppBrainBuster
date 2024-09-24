//
//  WelcomeView.swift
//  QuizzAppBrainBuster
//
//  Created by Marcela Hernandez on 21/9/24.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        NavigationStack {
            VStack {
                ZStack {
                    Image(.comicBoom)
                        .resizable()
                        .frame(width: 400, height: 400)
                    Image(.brain)
                        .resizable()
                        .frame(width:170, height: 170)
                    Image(.brainBusterBackground1RemovebgPreview)
                        .resizable()
                        .frame(width: 450, height: 450)
                        .offset(y: 200)
                }
                
                Spacer()
                
                VStack(spacing: 30) {
                    NavigationLink(destination: QuizzView(),
                        label: {
                        Text("START")
                            .background(
                                RoundedRectangle(cornerSize: CGSize(width: 30, height: 30), style: .continuous)
                                    .foregroundColor(.lightPrincipalPurple)
                                    .frame(width: 110, height: 30)
                            )
                            .foregroundColor(.white)
                            .font(.system(size: 25, weight: .bold))
                    }
                    )//Start Button
                    
                    NavigationLink(destination: LevelsView(),
                        label: {
                        Text("LEVELS")
                            .background(
                                RoundedRectangle(cornerSize: CGSize(width: 30, height: 30), style: .continuous)
                                    .foregroundColor(.lightPrincipalPurple)
                                    .frame(width: 120, height: 30)
                            )
                            .foregroundColor(.white)
                            .font(.system(size: 25, weight: .bold))
                    }
                    )
                    
                    
                }
                .frame(maxWidth: .infinity)
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.principalPurple)
        }
    }
}

#Preview {
    WelcomeView()
}
