//
//  ContentView.swift
//  SwiftUI_stack_practice_tutorial
//
//  Created by SHIN YOON AH on 2021/04/22.
//

import SwiftUI

struct ContentView: View {
    
    @State var isNavigationBarHidden: Bool = false
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottomTrailing) {
                VStack(alignment: .leading, spacing: 0) {
                    HStack {
                        NavigationLink(destination: MyList(isNavigationBarHidden: self.$isNavigationBarHidden)) {
                            Image(systemName: "line.horizontal.3")
                                .font(.largeTitle)
                                .foregroundColor(Color.black)
                        }
                        
                        Spacer()
                        
                        Image(systemName: "person.crop.circle.fill")
                            .font(.largeTitle)
                    }
                    .padding(20)
                    
                    Text("정대리 할 일목록")
                        .font(.system(size: 40))
                        .fontWeight(.black)
                        .padding(.horizontal, 20)
                    
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
            .navigationBarTitle("뒤로가기")
            .navigationBarHidden(self.isNavigationBarHidden)
            .onAppear {
                self.isNavigationBarHidden = true
            }
        } // NavigationView
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
