//
//  ContentView.swift
//  Project1-WeSplit
//
//  Created by Alan Silva on 18/12/20.
//

import SwiftUI

struct ContentView: View {
    
    @State private var amount = ""
    @State private var amountValue = 0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 2
    
    private let tipPercentages = [10, 15, 20, 25, 0]
    
    var totalAmount: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(amount) ?? 0

        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        
        return grandTotal
    }

    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(amount) ?? 0

        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount

        return amountPerPerson
    }
    
    var body: some View {
        
        NavigationView {
            
            Form {
                
                Section {
                    TextField("Amount", text: $amount)
                        .keyboardType(.decimalPad)
                    
                    Picker("How many people to split?", selection: $numberOfPeople) {
                        ForEach(2 ..< 100) {
                            Text("\($0) people")
                        }
                        
                    }
                }
                
                Section(header: Text("How much tip do you want to leave?")) {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        
                        ForEach(0 ..< tipPercentages.count) {
                            Text("\(tipPercentages[$0])%")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Total Amount")) {
                    Text("The total + tip is $\(totalAmount, specifier: "%.2f")")
                }
            
                Section(header: Text("Amount per person")) {
                    
                    //let amt = amount / numberOfPeople
                    
                    Text("Each person should pay $\(totalPerPerson, specifier: "%.2f")")
                    //.padding()
                }
                
            }
            .navigationBarTitle("We Split")
            
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
