//
//  ContentView.swift
//  SwiftUI_Image_tutorial
//
//  Created by SHIN YOON AH on 2021/04/15.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                
                Image("image1")
                    .frame(height: 10)
                    .offset(y: -1000)
                
                CircleImageView()
                    .offset(y: -100)
                HStack {
                    NavigationLink(
                        destination: MyWebView(url: "https://www.youtube.com/watch?v=ZodiJ0oy2kM&list=PLgOlaPUIbynqyJHiTEv7CFaXd8g5jtogT&index=6")
                        ) {
                        Text("구독하러 가기")
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.red)
                            .cornerRadius(20)
                    }
                    
                    NavigationLink(
                        destination: MyWebView(url: "https://www.google.com/search?q=%EC%98%A4%ED%94%88%EC%B9%B4%ED%86%A1%EB%B0%A9&oq=%EC%98%A4%ED%94%88%EC%B9%B4%ED%86%A1%EB%B0%A9&aqs=chrome..69i57j0l9.1971j0j7&sourceid=chrome&ie=UTF-8")
                            .edgesIgnoringSafeArea(.all)
                        ) {
                        Text("오픈챗방 가기")
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.orange)
                            .cornerRadius(20)
                    }
                }
                .padding()
                .offset(y: -70)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
