//
//  ContentView.swift
//  Challenge3-RockPaperScissor
//
//  Created by Alan Silva on 25/12/20.
//

import SwiftUI

struct ContentView: View {
    
    private var options = ["Rock", "Paper", "Scissor"]
    private var booleanArray = ["Win", "Lose"]
    @State private var selectedOpt = 0
    @State private var selectedBoolean = 0
    
    @State private var isAlertPresented = false
    
    var body: some View {
        
        VStack(spacing: 10) {
            
            Image(systemName: "scissors")
                .renderingMode(.original)
                .frame(width: 100, height: 100, alignment: .center)
            
            Section(header: Text("Choose an option to play:").font(.title3)) {
                
                Picker(selection: $selectedOpt, label: Text("Please choose a color")) {
                    ForEach(0 ..< options.count) {
                        Text(self.options[$0])
                    }
                }.pickerStyle(SegmentedPickerStyle())
                .padding()
                
            }
            
            Section(header: Text("Choose an option:").font(.title3))  {
                
                Picker(selection: $selectedBoolean, label: Text("Please choose a color")) {
                    ForEach(0 ..< booleanArray.count) {
                        Text(self.booleanArray[$0])
                    }
                }.pickerStyle(SegmentedPickerStyle())
                .padding()
                
                
                Text("Your bet is that:")
                    .font(.title3)
                Text("\(options[selectedOpt]) will \(booleanArray[selectedBoolean].lowercased())")
                    .font(.title)
                
            }
            
            Section {
                Button("Check answer") {
                    
                    self.isAlertPresented = true
                    
                    //Alert(title: Text("aa"), message: Text("ab"), dismissButton: .default(Text("Ok")))
                    
                }
            }.padding()
            .alert(isPresented: $isAlertPresented, content: {
                Alert(title: Text("aa"), message: Text("ab"), dismissButton: .default(Text("Ok")))
            })
            
            Spacer()
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
