//
//  ContentView.swift
//  SwiftUI_stack_practice_tutorial
//
//  Created by SHIN YOON AH on 2021/04/22.
//

import SwiftUI

struct MyList: View {
    // List == UIKit의 TableView, CollectionView
    
    @Binding var isNavigationBarHidden: Bool
    
    init(isNavigationBarHidden: Binding<Bool> = .constant(false)) {
        if #available(iOS 14.0, *) {
            
        } else {
            UITableView.appearance().tableFooterView = UIView()
        }
        UITableView.appearance().separatorStyle = .none
        
        _isNavigationBarHidden = isNavigationBarHidden
    }
    
    var body: some View {
//        List {
//            Text("하이")
//            Text("하이")
//            Text("하이")
//            Text("하이")
//        }
        
        List {
            Section(header:
                        Text("오늘 할 일")
                        .font(.headline)
                        .foregroundColor(Color.black)
                    ,footer: Text("footer")) {
                ForEach(1...3, id:\.self) { itemIndex in
                    //Text("하이 \($0)")
    //                Text("하이 \(itemIndex)")
                    MyCard(icon: "bookmark", title: "책읽기 \(itemIndex)", start: "10 AM", end: "11 PM", bgColor: Color.orange)
                }
            }
            .listRowInsets(EdgeInsets.init(top: 10, leading: 10, bottom: 10, trailing: 10))
            
            Section(header:
                        Text("내일 할 일")
                        .font(.headline)
                        .foregroundColor(Color.black)
            ) {
                ForEach(1...20, id:\.self) { itemIndex in
                    //Text("하이 \($0)")
    //                Text("하이 \(itemIndex)")
                    MyCard(icon: "bookmark.fill", title: "북마크 \(itemIndex)", start: "10 AM", end: "11 PM", bgColor: Color.blue)
                }
            }
            .listRowInsets(EdgeInsets.init(top: 10, leading: 10, bottom: 10, trailing: 10))
            .listRowBackground(Color.yellow)
            
        }
        .listStyle(GroupedListStyle())
        .navigationBarTitle("내 목록")
//        .navigationBarHidden(self.isNavigationBarHidden)
        .onAppear {
            self.isNavigationBarHidden = false
        }
    }
}

struct MyList_Previews: PreviewProvider {
    static var previews: some View {
        MyList()
    }
}
