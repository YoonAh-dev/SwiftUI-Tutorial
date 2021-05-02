//
//  ContentView.swift
//  SwiftUI_DeepLink_tutorial
//
//  Created by SHIN YOON AH on 2021/05/02.
//

import SwiftUI

func prepareData() -> [Int] {
    var newList = [Int]()
    
    for i in 0...20 {
        newList.append(i)
    }
    
    return newList
}

struct ContentView: View {
    @State private var list: [Int] = []
    
    init() {
        _list = State(initialValue: prepareData())
    }
    
    var body: some View {
        TabView {
            NavigationView {
                List {
                    ForEach(list, id: \.self) { id in
                        Text("내 할일 \(id)")
                    }
                }
                .navigationBarTitle("할 일 목록")
                
            }
            .tabItem {
                Image(systemName: "list.bullet")
                Text("할일목록")
            }
            .tag(0)
            
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 100, height: 100)
                    .foregroundColor(.blue)
                
                Text("프로필")
                    .font(.system(size: 30))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
            }
            .tabItem {
                Image(systemName: "person.crop.circle.fill")
                Text("프로필")
            }
            .tag(1)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
