//
//  ContentView.swift
//  WarCardGame
//
//  Created by Daniel Troyano on 5/24/23.
//

import SwiftUI

struct ContentView: View {
    
//Logic code
    
    @State var playerCard: String = "back"
    @State var CPUCard: String = "back"
    
    @State var playerScore: Int = 0
    @State var CPUScore: Int = 0
    
    @State var message: String = ""
    
    @State var button: String = "button"
    
//Deals cards and adds to score
    func deal() {
        
        message = ""
        
        //Randomize the player and CPU cards
        let newCardNum1 = Int.random(in: 2...14)
        playerCard = "card" + String(newCardNum1)
        let newCardNum2 = Int.random(in: 2...14)
        CPUCard = "card" + String(newCardNum2)
    
        //Change the score to reflect who had the higher card number
        if (newCardNum1 > newCardNum2) {
            playerScore += 1
        }
        else if (newCardNum1 < newCardNum2) {
            CPUScore += 1
        }
        else { message = "Same card drawn!"}
        
        if (playerScore == 10) {
            message = "Player Wins!"
          
        }
        if (CPUScore == 10) {
           message = "CPU Wins!"
           
        }
    }
    
//Restarts the game
    func replay() {
        
        message = ""
        
        playerCard = "back"
        CPUCard = "back"
        playerScore = 0
        CPUScore = 0
        
        button = "button"
    }
    
    
//UI Stuff
    
    var body: some View {
      
        ZStack {
            
            Image("background-cloth")
                .ignoresSafeArea()
                
            
                VStack {
                    Spacer()
                    Image("logo")
                    Spacer()
                    HStack {
                        Spacer()
                        Image(playerCard)
                        Spacer()
                        Image(CPUCard)
                        Spacer()
                    }
                    Spacer()
                    
                   Button{
                       
                       if (message == "Player Wins!" || message == "CPU Wins!") {
                           button = "ReplayButton"
                       }

                       if (button == "button") {
                           deal()
                       }
                       
                       if (button == "ReplayButton") {
                           replay()
                       }
                        
                    } label: { Image(button) }
                    
                    
                    
                    Spacer()
                    HStack {
                        Spacer()
                        VStack {
                            Text("Player")
                                .font(.headline)
                                .padding(.bottom, 10.0)
                            Text(String(playerScore))
                                .font(.largeTitle)
                        }
                        
                        Spacer()
                        VStack {
                            Text("CPU")
                                .font(.headline)
                                .padding(.bottom, 10.0)
                            Text(String(CPUScore))
                                .font(.largeTitle)
                            
                        }
                        
                        Spacer()
                        
                    }
                    .padding(.bottom)
                    .foregroundColor(.white)
                    Spacer()
                
            }
            VStack {
                Spacer()
                    .padding(.bottom)
                Text(message)
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    Spacer()
                    Spacer()
                    Spacer()
            }
        }
        
        
        
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
