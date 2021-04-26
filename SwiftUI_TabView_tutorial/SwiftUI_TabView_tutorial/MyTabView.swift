//
//  MyTabView.swift
//  SwiftUI_TabView_tutorial
//
//  Created by SHIN YOON AH on 2021/04/26.
//

import SwiftUI

struct MyTabView: View {
    var body: some View {
        TabView {
            // 보여질 화면
            // 하나 하나가 다른 탭으로 설정된다.
            ZStack {
                Color.red
                    .edgesIgnoringSafeArea(.all)
                Text("Hello, world!1")
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .padding()
                    
            }
//            .edgesIgnoringSafeArea(.all)
//            .frame(maxWidth: .infinity, maxHeight: .infinity)
//            .background(Color.red)
            .tabItem {
                Image(systemName: "airplane")
                Text("1번")
            }
            .tag(0)
            
            ZStack {
                Color.green
                    .edgesIgnoringSafeArea(.all)
                Text("Hello, world!2")
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .padding()
            }
//            .edgesIgnoringSafeArea(.all)
//            .frame(maxWidth: .infinity, maxHeight: .infinity)
//            .background(Color.green)
            .tabItem {
                Image(systemName: "flame.fill")
                Text("2번")
            }
            .tag(1)
            
            ZStack {
                Color.orange
                    .edgesIgnoringSafeArea(.all)
                Text("Hello, world!3")
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .padding()
            }
//            .edgesIgnoringSafeArea(.all)
//            .frame(maxWidth: .infinity, maxHeight: .infinity)
//            .background(Color.orange)
            .tabItem {
                Image(systemName: "doc.fill")
                Text("3번")
            }
            .tag(2)
        }
    }
}

struct MyTabView_Previews: PreviewProvider {
    static var previews: some View {
        MyTabView()
    }
}
