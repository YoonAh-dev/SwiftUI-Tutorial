//
//  ContentView.swift
//  SwiftUI_GeometryReader_tutorial
//
//  Created by SHIN YOON AH on 2021/04/25.
//

import SwiftUI

struct MyGeometryReader: View {
    // 기종에 따라서 AutoLayout이 잘 잡히기 위해서는 GeometryReader
    // 사용해야 한다. -> 지금까지 한 건 하드코딩
    
    var body: some View {
        
        GeometryReader { geo in
            HStack(spacing: 0) {
                Text("1")
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .frame(width: geo.size.width / 4)
                    .foregroundColor(.white)
                    .background(Color.red)
                
                Text("2")
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .frame(width: geo.size.width / 4)
                    .foregroundColor(.white)
                    .background(Color.blue)
                Text("3")
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .frame(width: geo.size.width / 4)
                    .foregroundColor(.white)
                    .background(Color.green)
                Text("4")
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .frame(width: geo.size.width / 4)
                    .foregroundColor(.white)
                    .background(Color.purple)
            }
            .background(Color.yellow)
        }.background(Color.black)
    }
}

struct MyGeometryReader_Previews: PreviewProvider {
    static var previews: some View {
        MyGeometryReader()
    }
}
