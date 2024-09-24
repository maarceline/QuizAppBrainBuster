//
//  LevelsView.swift
//  QuizzAppBrainBuster
//
//  Created by Marcela Hernandez on 21/9/24.
//

import SwiftUI

struct LevelsView: View {
    
    @Environment(\.isPresented) var isPresented
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack{
            VStack() {
                HStack {
                    NavigationLink(destination: QuizzView(),
                                   label: {
                        Text("levelsName")
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
                HStack(spacing: 10) {
                    
                }
                
            }
            .background(Color.principalPurple)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        
    }
}

#Preview {
    LevelsView()
}
