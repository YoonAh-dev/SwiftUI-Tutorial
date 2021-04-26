//
//  MyRotateButtonStyle.swift
//  SwiftUI_ButtonStyle_tutorial
//
//  Created by SHIN YOON AH on 2021/04/26.
//

import SwiftUI

struct MyRotateButtonStyle: ButtonStyle {
    var color: Color
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 20))
            .foregroundColor(Color.white)
            .padding()
            .background(color)
            .cornerRadius(20)
            .rotationEffect(configuration.isPressed ? .degrees(360) : .degrees(0), anchor: .bottom)
    }
}

struct MyRotateButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        Button(action: {
            print("button clicked!")
        }) {
            Text("호호")
        }.buttonStyle(MyRotateButtonStyle(color: Color.blue))
    }
}
