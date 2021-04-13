//
//  MyVstackView.swift
//  SwiftUI_tutorial_#1
//
//  Created by SHIN YOON AH on 2021/04/13.
//

import SwiftUI

struct MyVstackView: View {
    var body: some View {
        VStack {
            Text("1")
                .fontWeight(.bold)
                .font(.system(size: 40))
            Text("2")
                .fontWeight(.bold)
                .font(.system(size: 40))
            Text("3")
                .fontWeight(.bold)
                .font(.system(size: 40))
        }
        .padding()
        .background(Color.red)
    }
}

// 보여주는 용도
struct MyVstackView_Previews: PreviewProvider {
    static var previews: some View {
        MyVstackView()
    }
}
