//
//  ContentView.swift
//  SwiftUI_ButtonStyle_tutorial
//
//  Created by SHIN YOON AH on 2021/04/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Button(action: {
                print("button clicked!")
            }, label: {
                Text("탭")
                    .fontWeight(.black)
            }).buttonStyle(MyButtonStyle(color: Color.blue, type: .tab))
            
            Button(action: {
                print("button clicked!")
            }, label: {
                Text("롱클릭")
                    .fontWeight(.black)
            }).buttonStyle(MyButtonStyle(color: Color.green, type: .long))
            
            Button(action: {
                print("button clicked!")
            }, label: {
                Text("회전버튼")
                    .fontWeight(.black)
            }).buttonStyle(MyRotateButtonStyle(color: Color.pink))
            
            Button(action: {
                print("button clicked!")
            }, label: {
                Text("축소버튼")
                    .fontWeight(.black)
            }).buttonStyle(MySmallerButtonStyle(color: Color.orange))
            
            Button(action: {
                print("button clicked!")
            }, label: {
                Text("블러버튼")
                    .fontWeight(.black)
            }).buttonStyle(MyBlurButtonStyle(color: Color.black))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
