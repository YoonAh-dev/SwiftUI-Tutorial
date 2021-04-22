//
//  MyVStack.swift
//  SwiftUI_Stacks_tutorial
//
//  Created by SHIN YOON AH on 2021/04/22.
//

import SwiftUI

struct MyVStack: View {
    var body: some View {
        VStack(alignment: .trailing ,spacing: 0) {
//            Spacer()
            
            // 도형이랑 글자 모두에 alignment 적용
//            Rectangle()
//                .frame(height: 1)
            
            // 안보이게 한 것
            // 도형이랑 글자 모두 alignment를 적용하려고
            Divider()
                .opacity(0)
            
            Text("신호등")
                .font(.system(size: 30))
                .fontWeight(.heavy)
//                .padding(.bottom, 20)
            
            Rectangle()
                .frame(width: 100, height: 100)
                .foregroundColor(Color.red)
            
            Rectangle()
                .frame(width: 100, height: 100)
                .foregroundColor(Color.yellow)
//
//            Spacer()
//                .frame(height: 50)
            
            Rectangle()
                .frame(width: 100, height: 100)
                .foregroundColor(Color.green)
            
//            Spacer()
//            Spacer()
//            Spacer()
        }
        // 크기 이런거
        .frame(width: 200)
        .background(Color.gray)
//        .edgesIgnoringSafeArea(.all)
    }
}

struct MyVStack_Previews: PreviewProvider {
    static var previews: some View {
        MyVStack()
    }
}
