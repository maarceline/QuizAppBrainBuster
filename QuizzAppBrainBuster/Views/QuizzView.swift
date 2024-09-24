//
//  QuizzView.swift
//  QuizzAppBrainBuster
//
//  Created by Marcela Hernandez on 21/9/24.
//

import SwiftUI

struct QuizzView: View {
    @ObservedObject var quizzManager = QuizzManager()
    @State private var shuffledCapitals: [String] = []
    @State private var score: Int = 0
    @State private var isDisabled = false
    @State private var popUpIsShowing = false
    
    @Environment(\.isPresented) var isPresented
    @Environment(\.dismiss) var dismiss
    
    
    var body: some View {
        ZStack {
            
            
            VStack (alignment: .center, spacing: 180) {
                HStack {
                    Text("Score: ")
                        .foregroundColor(.white)
                        .font(.system(size: 25, weight: .bold))
                        .frame(maxWidth: .infinity, alignment: .top)
                    Spacer()
                    
                    Text("\(score)")
                        .foregroundColor(.white)
                        .font(.system(size: 25, weight: .light))
                        .frame(maxWidth: .infinity, alignment: .top)
                }
                VStack(alignment: .center, spacing: 340) {
                    VStack {
                        Text("What is the capital of \(quizzManager.getCountry())?")
                            .background(
                                RoundedRectangle(cornerSize: CGSize(width: 15, height: 15), style: .continuous)
                                    .stroke(lineWidth: 5.0)
                                    .foregroundColor(.lightPrincipalPurple)
                                    .frame(width: 300, height: 300)
                            )
                            .font(.system(size: 30, weight: .bold))
                            .foregroundColor(.white)
                            .offset(y: 160)
                            .frame(width: 280, height: 75)
                        
                    }
                    
                    VStack (spacing: 30) {
                        
                        //if quizzManager.shuffledCapitals.count == 3 {
                        ForEach(quizzManager.getCapitals(), id: \.self) { capital in
                            Button(action: {
                                quizzManager.selectedCapital = capital
                                let correctCapital = quizzManager.getCorrectCapital()
                                print(correctCapital)
                                print(quizzManager.selectedCapital)
                                
                                if quizzManager.selectedCapital == correctCapital {
                                    print("Nice job!")
                                    score += 1
                                    
                                } else {
                                    print("Oh no!, incorrect")
                                    
                                }
                                
                                isDisabled = true
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                    quizzManager.getNewQuestion()
                                    quizzManager.selectedCapital = ""
                                    
                                    isDisabled = false
                                }
                                
                                
                            })
                            {
                                Text(capital)
                                    .bold()
                                    .frame(width: 300, height: 60)
                                    .background(
                                        RoundedRectangle(cornerRadius: 20, style: .continuous)
                                            .foregroundColor(quizzManager.getColor(capital: capital))
                                    )
                                    .foregroundColor(.white)
                            }
                            .disabled(isDisabled)
                            
                        }
                    }
                    
                } .frame(height: 340, alignment: .center)
                    .onAppear {
                    }
                    .padding(.bottom)
                
                
                
                HStack(alignment: .bottom) {
                    Button {
                        print("go back button selected")
                        dismiss()
                    }
                    label: {
                        Image(systemName: "arrow.left.circle")
                            .resizable()
                            .foregroundColor(.white)
                            .frame(width: 30, height: 30)
                    }
                    .frame(maxWidth: .infinity, alignment: .bottom)
                    Spacer()
                    
                    Button {
                        print("Levels button selected")
                    }
                    label: {
                        Text("Levels")
                            .frame(width: 150, height: 30)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .background(
                                RoundedRectangle(cornerSize: CGSize(width: 30, height: 20.0))
                                    .foregroundColor(.lightPrincipalPurple)
                            )
                        
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                    
                    Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
                    
                    
                    
                    Button {
                        withAnimation {
                            self.popUpIsShowing.toggle()
                        }
                    }
                    label: {
                        Image(systemName: "lightbulb.max")
                            .resizable()
                            .foregroundColor(.white)
                            .frame(width: 35, height: 35)
                    }
                    .frame(maxWidth: .infinity, alignment: .bottom)      
                    
                }
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .navigationBarHidden(true)
            .background(Color.principalPurple)
            .onAppear() {
                quizzManager.shuffleCapitals()
            }
            
            if self.popUpIsShowing {
                GeometryReader { geometry in
                    PopupView()
                        .background(.clear)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .padding(.horizontal, 35)
                }
                .background(
                    Color.black.opacity(0.30)
                        .edgesIgnoringSafeArea(.all)
                        .onTapGesture {
                            withAnimation {
                                self.popUpIsShowing.toggle()
                            }
                        }
                )
                
            }
            
        }
        
        
        
    }
}

#Preview {
    QuizzView()
}

