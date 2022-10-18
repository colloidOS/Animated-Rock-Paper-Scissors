//
//  ContentView.swift
//  Animated Rock Paper Scissors
//
//  Created by Macintosh HD on 17/08/2021.
//



import SwiftUI

struct ContentView: View {
    @State var ObjectOptions = ["🪨", "📄", "✂️"]
    @State var Score: Int = 0
    @State var ComputerScore: Int = 0
    @State var isSameSelection = false
    @State var EndOfGameOpacity: CGFloat = 0
    @State var Faceup = false
    @State var Timer: Int = 0
    @State var ComputerChoice = ""
    
    
    var body: some View {
        ZStack {
            Color.blue
                .opacity(0.3)
                .ignoresSafeArea()
            VStack {
                let computerCard = ObjectOptions.randomElement()!
                    

                Text(ComputerChoice)
                     .font(.system(size: UIScreen.main.bounds.width / 3))
                    .padding(8)
                    .cardify(isFaceUp: Faceup)
                    .frame(width: UIScreen.main.bounds.width / 2.5, height: UIScreen.main.bounds.width / 2)
                    .padding()
                    .padding()
                    .padding(.vertical)

                    .cornerRadius(20)
                    .shadow(radius: 10, x: 0, y: 10)
                
                
                Text("Computer has Played")
                    .font(.title2)
                    .padding(.bottom)
                Text("Select an Object")
                    .font(.title2)
                    .padding()
                
                HStack{
                    Button {
                        ComputerChoice = computerCard
                        
                        if computerCard == ObjectOptions[0] {
                            isSameSelection = true
                            
                        } else if computerCard == ObjectOptions[1] {
                            ComputerScore += 1
                            isSameSelection = false
                            
                        } else {
                       Score += 1
                            isSameSelection = false
                            
                        }
                        withAnimation(.easeInOut(duration: 0.5)) {
                            self.Faceup.toggle()
                        }
                        withAnimation(.easeInOut(duration: 2).delay(1)) {
                            Timer = 5
                            if Timer == 5 {
                                self.Faceup.toggle()
                            }
                         }
                        
                    }
                label:    {
                     Text(ObjectOptions[0])
                        .font(.system(size: UIScreen.main.bounds.width / 5))
                    }
                .padding(.horizontal, 10)
                .padding(.vertical)
                .background(
                    Color.cyan
                        .opacity(0.9)
                        .cornerRadius(10)
                        .shadow(radius: 10, x: 0, y: 10)
                )
                
                    Button {
                        ComputerChoice = computerCard
                        if computerCard == ObjectOptions[0] {
                            Score += 1
                            isSameSelection = false
                                 
                            
                        } else if computerCard == ObjectOptions[1] {
                            isSameSelection = true
                            
                            
                        } else {
                            ComputerScore += 1
                            isSameSelection = false
                            
                        }
                        withAnimation(.easeInOut(duration: 0.5)) {
                            self.Faceup.toggle()
                        }
                        withAnimation(.easeInOut(duration: 2).delay(1)) {
                            Timer = 5
                            if Timer == 5 {
                                self.Faceup.toggle()
                            }
                         }
                    }
                label:    {
                    Text(ObjectOptions[1])
                        .font(.system(size: UIScreen.main.bounds.width / 5))
                    }
                .padding(.horizontal, 10)
                .padding(.vertical)
                .background(
                    Color.cyan
                        .opacity(0.9)
                        .cornerRadius(10)
                        .shadow(radius: 10, x: 0, y: 10)
                )
                    Button {
                        ComputerChoice = computerCard
                        if computerCard == ObjectOptions[0] {
                            ComputerScore += 1
                            isSameSelection = false
                            
                            
                        } else if computerCard == ObjectOptions[1] {
                            Score += 1
                            isSameSelection = false
                                 
                        } else {
                            isSameSelection = true
                            
                        }
                        withAnimation(.easeInOut(duration: 0.5)) {
                            self.Faceup.toggle()
                        }
                        withAnimation(.easeInOut(duration: 2).delay(1)) {
                            Timer = 5
                            if Timer == 5 {
                                self.Faceup.toggle()
                            }
                         }
                    }
                label:    {
                    Text(ObjectOptions[2])
                        .font(.system(size: UIScreen.main.bounds.width / 5))
                    }
                .padding(.horizontal, 10)
                .padding(.vertical)
                .background(
                    Color.cyan
                        .opacity(0.9)
                        .cornerRadius(10)
                        .shadow(radius: 10, x: 0, y: 10)
                        
                )
                
                }
                .padding(.horizontal)
                .padding(.vertical)
                .background(
                    Color.red
                        .opacity(0.6)
                        .cornerRadius(10)
                )
                

                HStack {
                    
                    Text("Computer's Score: \(ComputerScore)")
                        .font(.headline)
                        
                    .foregroundColor(.primary)
                    .padding(.leading, 8)
                    Spacer()
                    Text("Your Score: \(Score)")
                        .font(.title2)
                        .bold()
                    .foregroundColor(.primary)
                    .padding(.trailing, 8)
                
                }
                .padding(.bottom)
                

                
                
                
                    Text("Pick Again")
                        .foregroundColor(.red)
                        .font(.title2)
                        .opacity(isSameSelection ? 1 : 0)
                
                
                
            }
            .opacity( ComputerScore >= 10 || Score >= 10 ? 0 : 1 )
        .padding()
            

            

            ZStack {
                VStack {
                if Score == 10 {
                    
                        Text("You Won!!!  \n   🎉🎊🥂")
                            .font(.system(size: UIScreen.main.bounds.width / 8))
             
                  } else if ComputerScore == 10 {
                    Text("You Lost!!!  \n ❌🥲❌🤧")
                    .font(.system(size: UIScreen.main.bounds.width / 8))
                  }
                    
                    
                    
                }
                .opacity(1 - EndOfGameOpacity)
                .animation(.easeInOut.repeatForever(autoreverses: false), value: EndOfGameOpacity)
                .onAppear{
                     EndOfGameOpacity = 1
                    }
   

                    
                Button{
                  ComputerScore = 0
                    Score = 0
                    
                }
            label: {
              Text("Play Again")
                    .bold()
                    .font(.title)
                    .foregroundColor(.black)
                    .padding()
                    .background(
                        Color.white
                            .cornerRadius(10)
                    )
                    .padding()
                
            }
            .opacity( ComputerScore < 10 && Score < 10 ? 0 : 1 )
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
                
            }
            

            
            
        }
        
     
    }

    
    
}








struct RockPaperSciccors_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}

