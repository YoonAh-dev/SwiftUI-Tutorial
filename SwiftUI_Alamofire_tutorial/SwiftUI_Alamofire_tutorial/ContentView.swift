//
//  ContentView.swift
//  SwiftUI_Alamofire_tutorial
//
//  Created by SHIN YOON AH on 2021/05/05.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var randomUserViewModel = RandomUserViewModel()
    
    var body: some View {
        // 각각의 아이템들을 ForEach문처럼 가져와서 뷰를 그림
        List(randomUserViewModel.randomUsers) { randomUser in
            CellView(randomUser)
        }
        
//        List(0...100, id: \.self) { id in
//            CellView(imageUrl: url)
//        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
