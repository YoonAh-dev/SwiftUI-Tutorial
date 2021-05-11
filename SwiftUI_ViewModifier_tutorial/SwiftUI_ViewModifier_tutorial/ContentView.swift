//
//  ContentView.swift
//  SwiftUI_ViewModifier_tutorial
//
//  Created by SHIN YOON AH on 2021/05/11.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 50) {
            Text("Hello, world!")
                .modifier(MyRoundedText())
            
            Text("Hello, world!")
                .myRoundedTextStyle()
            
            Image(systemName: "person.crop.circle.fill")
                .myRoundedTextStyle()
            
            Rectangle()
                .frame(width: 100, height: 100)
                .myRoundedTextStyle()
        }
    }
}

// View를 꾸며주는 모디파이어
// 코드가 간결해짐
struct MyRoundedText: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .padding()
            .background(Color.yellow)
            .cornerRadius(25)
            .padding()
            .overlay(RoundedRectangle(cornerRadius: 25).stroke(lineWidth: 10).foregroundColor(.green))
    }
}

extension View {
    func myRoundedTextStyle() -> some View {
        modifier(MyRoundedText())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
