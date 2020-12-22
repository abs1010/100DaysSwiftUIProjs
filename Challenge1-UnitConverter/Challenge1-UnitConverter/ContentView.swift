//
//  ContentView.swift
//  Challenge1-UnitConverter
//
//  Created by Alan Silva on 21/12/20.
//

import SwiftUI

enum LenghtUnits: String {
    case Meters = "Meters"
    case KM = "Kilometers"
    case Feet = "Feet"
    case Yard = "Yard"
    case Miles = "Miles"
}

struct ContentView: View {
    
    @State private var units: [LenghtUnits] = [.Meters, .KM, .Feet, .Yard, .Miles]
    @State private var valueForConversion = ""
    @State private var selectedUnitFrom = 0
    @State private var selectedUnitTo = 1
    
    var body: some View {
        
        NavigationView {
            
            Form {
                
                TextField("Enter the value you want to convert", text: $valueForConversion)
                    .keyboardType(.numberPad)
                
                Section(header: Text("Select a unit type (from):")) {
                    
                    Picker("", selection: $selectedUnitFrom) {
                        ForEach(0 ..< units.count) {
                            
                            Text("\(units[$0].rawValue)")
                            
                        }
                        
                    }.pickerStyle(SegmentedPickerStyle())
                    
                }
                
                Section(header: Text("Select a unit type (to):")) {
                    
                    Picker("Select a unit type (to):", selection: $selectedUnitTo) {
                        
                        ForEach(0 ..< units.count) {
                            
                            Text("\(units[$0].rawValue)")
                            
                        }
                        
                    }.pickerStyle(SegmentedPickerStyle())
                    
                }
                
                Section(header: Text("Result")) {
                    
                    
                    Text("\(convertUnit(valueForConversion, source: units[selectedUnitFrom], output: units[selectedUnitTo]))")
                    
                }
                
            }.navigationTitle("Unit Converter")
            
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
