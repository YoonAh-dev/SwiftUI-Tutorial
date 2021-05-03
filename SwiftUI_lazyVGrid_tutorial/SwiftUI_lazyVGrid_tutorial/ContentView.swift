//
//  ContentView.swift
//  SwiftUI_lazyVGrid_tutorial
//
//  Created by SHIN YOON AH on 2021/05/03.
//

import SwiftUI

// lazyVGrid : 화면에 뷰를 그려줄 때, 화면에 보이는 부분만 보여주는 렌더링해줌
// dequeReusableCell 같은 역할

struct MyModel: Identifiable, Hashable {
    let id = UUID() // UUID로 해야지 Identifiable이 적용된다.
    let title: String
    let content: String
}

// MyModel 생성자를 쓰지 않아도 MyModel를 사용할 수 있도록 static
extension MyModel {
    static var dummyDataArray: [MyModel] {
        (1...2000).map{ (number: Int) in
            MyModel(title: "타이틀: \(number)", content: "컨텐트: \(number)")
        }
    }
}

struct ContentView: View {
    // 2000개를 담은 배열 생성
//    let myDataArray = Array(1...2000).map({ (number: Int) in
//        return "\(number) 번"
//    })
    var dummyDataArray = MyModel.dummyDataArray
    
    var body: some View {
        // lazyVGrid는 ScrollView와 같이 사용
        // 스크롤뷰로 감싸서 스크롤 가능하도록 설정
        ScrollView {
            // 레이지 버티칼 그리드 뷰
            // column은 호리젠탈 아이템 레이아웃을 설정하는 부분
            // 그리드 아이템 옵션 3개(어떤식으로 분배를 시킬거냐)
            // .fixed 고정
            // .adaptive 최소로 채우기 - 계산해서 분할로 채우기(최대한 여러개로)
            // .flexible 하나만 채우기
            // spacing - 각 줄에 대한 spacing
            LazyVGrid(columns: [
                GridItem(.adaptive(minimum: 200)),
                GridItem(.adaptive(minimum: 200)),
                GridItem(.flexible(minimum: 100))
            ], spacing: 100, content: {
                ForEach(dummyDataArray, id: \.self, content: { (dataItem: MyModel) in
                    Rectangle()
                        .foregroundColor(.blue)
                        .frame(height: 120)
                        .overlay(
                            Text("\(dataItem.title)")
                        )
                })
                
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
