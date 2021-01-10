//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Alan Silva on 24/12/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .padding()
            .background(Color.red)
            .padding()
            .background(Color.blue)
            .padding()
            .background(Color.green)
            .padding()
            .background(Color.yellow)
            .modifier(Title())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.white)
            .padding()
            .background(Color.blue)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

///When working with custom modifiers, it’s usually a smart idea to create extensions on View that make them easier to use. For example, we might wrap the Title modifier in an extension such as this:
extension View {
    func titleStyle() -> some View {
        self.modifier(Title())
    }
}

///We can now use the modifier like this:
//Text("Hello World")
//    .titleStyle()
