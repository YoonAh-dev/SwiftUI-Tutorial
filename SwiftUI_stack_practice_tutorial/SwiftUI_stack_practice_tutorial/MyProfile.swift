//
//  ContentView.swift
//  SwiftUI_stack_practice_tutorial
//
//  Created by SHIN YOON AH on 2021/04/22.
//

import SwiftUI

struct MyProfile: View {
    var body: some View {
        ScrollView {
            VStack {
                Image(systemName: "moon.circle.fill")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 200, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .clipShape(Circle())
                    .shadow(color: .gray, radius: 20, x: 5, y: 10)
                    .overlay(
                        Circle().stroke(Color.yellow,
                                    lineWidth: 15)
                        .padding(0)
                    )
                    .padding([.bottom, .top], 20)
                
                Text("개발하는 정대리")
                    .font(.system(.largeTitle))
                    .fontWeight(.heavy)
                
                Text("구독 좋아요 부탁드립니다!")
                    .font(.system(.title2))
                    .fontWeight(.heavy)
                    .padding()
                
                HStack {
                    Button(action: {}) {
                        Text("구독하러 가기")
                            .font(.system(size: 20))
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .frame(width: 150, height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .foregroundColor(.white)
                            .background(Color.red)
                            .cornerRadius(20)
                    }
                    
                    Button(action: {}) {
                        Text("오픈깨톡방 가기")
                            .font(.system(size: 20))
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .frame(width: 160, height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .foregroundColor(.white)
                            .background(Color.orange)
                            .cornerRadius(20)
                    }
                }
            }
        }
        .navigationBarTitle("내 프로필", displayMode: .large)
        .navigationBarItems(trailing:
                NavigationLink(destination:
                       MyNavigationView()
                ){
                Image(systemName: "gear")
                    .font(.system(.largeTitle))
                    .foregroundColor(Color.black)
            }
        )
    }
}

struct MyProfile_Previews: PreviewProvider {
    static var previews: some View {
        MyProfile()
    }
}
