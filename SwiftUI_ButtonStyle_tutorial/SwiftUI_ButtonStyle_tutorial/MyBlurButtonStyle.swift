//
//  MyBlurButtonStyle.swift
//  SwiftUI_ButtonStyle_tutorial
//
//  Created by SHIN YOON AH on 2021/04/26.
//

import SwiftUI

struct MyBlurButtonStyle: ButtonStyle {
    var color: Color
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 20))
            .foregroundColor(Color.white)
            .padding()
            .background(color)
            .cornerRadius(20)
            .blur(radius: configuration.isPressed ? 10 : 0)
    }
}

struct MyBlurButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        Button(action: {
            print("button clicked!")
        }) {
            Text("호호")
        }.buttonStyle(MyBlurButtonStyle(color: Color.blue))
    }
}
