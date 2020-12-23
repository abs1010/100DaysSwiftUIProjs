//
//  ContentView.swift
//  Project2-GuessTheFlag
//
//  Created by Alan Silva on 22/12/20.
//

import SwiftUI

struct ContentView: View {
    
    @State private var countries = ["estonia", "france", "germany", "ireland", "italy", "nigeria", "poland", "russia", "spain", "uk", "us"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var score = 0
    
    var body: some View {
        
        ZStack {
            
            AngularGradient(gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple, .red]), center: .center).edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 10) {
                
                Text("Tap the Flag...")
                    .foregroundColor(.white)
                Text(countries[correctAnswer].capitalized)
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .fontWeight(.black)
                
                VStack(spacing: 30) {
                    
                    ForEach(0 ..< 3) { imgCount in
                        
                        Button(action: {
                            self.flagTapped(imgCount)
                        }, label: {
                            Image(countries[imgCount])
                                .renderingMode(.original)
                                .clipShape(Capsule())
                                .overlay(Capsule().stroke(Color.black, lineWidth: 1))
                                .shadow(color: .black, radius: 2)
                        })
                        
                    }
                    
                }
                
                Spacer()
                
            }
            
        }.alert(isPresented: $showingScore) {
            Alert(title: Text(scoreTitle), message: Text("Your score is \(score)"), dismissButton: .default(Text("Continue")) {
                self.askQuestion()
            })
        }
        
    }
    
    ///Methods
    private func flagTapped(_ number: Int) {
        
        if number == correctAnswer {
            scoreTitle = "Correct! That's \(countries[correctAnswer].capitalized) flag."
            self.score += 1
        } else {
            scoreTitle = "Wrong! This is the flag of \(countries[number].capitalized)"
        }
        
        showingScore = true
    }
    
    private func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
