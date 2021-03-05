//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Alan Silva on 24/12/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        //Text("Hello, world!")
        //    .titleStyle()
        Color.red
            .frame(width: 300, height: 200)
            .watermarked(with: "Hacking with Swift")
    }
}

//struct teste: UIHostingController<ContentView> {
    
//}

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

struct Watermark: ViewModifier {
    var text: String

    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing) {
            content
            Text(text)
                .font(.caption)
                .foregroundColor(.white)
                .padding(5)
                .background(Color.black)
        }
    }
}

///When working with custom modifiers, it’s usually a smart idea to create extensions on View that make them easier to use. For example, we might wrap the Title modifier in an extension such as this:
extension View {
    func titleStyle() -> some View {
        self.modifier(Title())
    }
}

extension View {
    func watermarked(with text: String) -> some View {
        self.modifier(Watermark(text: text))
    }
}

///We can now use the modifier like this:
//Text("Hello World")
//    .titleStyle()
