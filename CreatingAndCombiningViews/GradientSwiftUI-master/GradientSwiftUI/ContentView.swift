//
//  ContentView.swift
//  GradientSwiftUI
//
//  Created by Алексей Пархоменко on 15.10.2019.
//  Copyright © 2019 Алексей Пархоменко. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            AngularGradient(gradient: Gradient(colors: [.blue, .yellow, .green, .pink, .orange, .purple]), center: .center).edgesIgnoringSafeArea(.all)
            RadialGradient(gradient: Gradient(colors: [.red, .yellow]), center: .center, startRadius: 20, endRadius: 250)
            Text("Hello World").padding()
            .foregroundColor(.white)
            .font(.system(size: 46))
            .background(LinearGradient(gradient: Gradient(colors: [.red, .blue]), startPoint: .top, endPoint: .bottom))
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
