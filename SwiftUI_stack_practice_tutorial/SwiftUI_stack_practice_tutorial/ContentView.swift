//
//  ContentView.swift
//  SwiftUI_stack_practice_tutorial
//
//  Created by SHIN YOON AH on 2021/04/22.
//

import SwiftUI

struct ContentView: View {
    
//    @State var isNavigationBarHidden: Bool = false
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottomTrailing) {
                VStack(alignment: .leading, spacing: 0) {
                    ScrollView {
                        VStack {
                            MyProjectCard()
                            MyBasicCard()
                            MyCard(icon: "tray.fill", title: "집청소", start: "10 AM", end: "11 AM", bgColor: .pink)
                            MyCard(icon: "tray.fill", title: "운동하기", start: "10 AM", end: "11 AM", bgColor: .gray)
                            MyCard(icon: "tray.fill", title: "마트 장보기", start: "10 AM", end: "11 AM", bgColor: .blue)
                            MyCard(icon: "tray.fill", title: "게임하기", start: "10 AM", end: "11 AM", bgColor: .orange)
                        }
                        .padding()
                    }
                }
                
                Circle()
                    .foregroundColor(.yellow)
                    .frame(width: 60, height: 60)
                    .overlay(
                        Image(systemName: "plus")
                            .foregroundColor(.white)
                            .font(.system(size: 30))
                    )
                    .padding(10)
                    .shadow(radius: 20)
            } // ZStack
            .navigationBarTitle("정대리 할 일목록", displayMode: .large)
            .navigationBarItems(leading: NavigationLink(destination: MyList()) {
                Image(systemName: "line.horizontal.3")
                    .font(.largeTitle)
                    .foregroundColor(Color.black)
            }, trailing:
                NavigationLink(
                    destination: MyProfile()) {
                    Image(systemName: "person.crop.circle.fill")
                        .font(.largeTitle)
                        .foregroundColor(.black)
                }
            )
        } // NavigationView
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
