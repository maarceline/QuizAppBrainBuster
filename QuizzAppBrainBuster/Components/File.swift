//
//  File.swift
//  QuizzAppBrainBuster
//
//  Created by Marcela Hernandez on 24/9/24.
//


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
                            
                            
                            selectedCapital = capital
                            let correctCapital = quizzManager.getCorrectCapital()
                            print(correctCapital)
                            print(selectedCapital)
                            
                            if selectedCapital == correctCapital {
                                print("Nice job!")
                                score = +1
                            } else {
                                print("Oh no!, incorrect")
                            }
                            quizzManager.getNewQuestion()
                            
                            
                        }) {
                            Text(capital)
                                .bold()
                                .frame(width: 300, height: 60)
                                .background(
                                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                                        .foregroundColor(.lightPrincipalPurple)
                                )
                                .foregroundColor(.white)
                        }
                        .onAppear() {
                            selectedCapital = capital
                        
                        }