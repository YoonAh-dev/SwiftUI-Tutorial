//
//  MyButtonStyle.swift
//  SwiftUI_Redux_tutorial
//
//  Created by SHIN YOON AH on 2021/05/04.
//

import SwiftUI

struct MyButtonStyle: ButtonStyle {
    
    var color: Color
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 20))
            .foregroundColor(Color.white)
            .padding()
            .background(color)
            .cornerRadius(20)
            .scaleEffect(configuration.isPressed ? 1.3 : 1.0)
    }
}

struct MyButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        Button(action: {
            print("button clicked!")
        }) {
            Text("호호")
        }.buttonStyle(MyButtonStyle(color: Color.blue))
    }
}
