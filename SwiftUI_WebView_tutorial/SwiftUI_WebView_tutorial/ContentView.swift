//
//  ContentView.swift
//  SwiftUI_WebView_tutorial
//
//  Created by SHIN YOON AH on 2021/04/13.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        NavigationView {
            HStack {
                NavigationLink(
                    destination: MyWebView(urlToLoad: "https://www.naver.com")
                        .edgesIgnoringSafeArea(.all)) {
                    // NavigationLink 자체에 대한 내용
                    Text("네이버")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .padding(20)
                        .background(Color.green)
                        .foregroundColor(Color.white)
                        .cornerRadius(20)
                }
                NavigationLink(
                    destination: MyWebView(urlToLoad: "https://www.daum.net")
                        .edgesIgnoringSafeArea(.all)) {
                    // NavigationLink 자체에 대한 내용
                    Text("다음")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .padding(20)
                        .background(Color.orange)
                        .foregroundColor(Color.white)
                        .cornerRadius(20)
                }
                NavigationLink(
                    destination: MyWebView(urlToLoad: "https://www.google.com")
                        .edgesIgnoringSafeArea(.all)) {
                    // NavigationLink 자체에 대한 내용
                    Text("구글")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .padding(20)
                        .background(Color.blue)
                        .foregroundColor(Color.white)
                        .cornerRadius(20)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
