//
//  Example_ContentView.swift
//  SwiftUI_lazyVGrid_tutorial
//
//  Created by SHIN YOON AH on 2021/05/03.
//

import SwiftUI

// CaseIterable
enum List {
    case table, grid, multiple
}

/*
extension List {
    // 레이아웃 타입에 대한 컬럼이 자동으로 설정되도록 한다
    var columns : [GridItem] {
        switch self {
        case .table:
            return [
                // flexible 하나로 한줄로 표현
                GridItem(.flexible())
            ]
        case .grid:
            return [
                // flexible 두개를 넣어서 두개 아이템 들어가게 함
                GridItem(.flexible()),
                GridItem(.flexible())
            ]
        case .multiple:
            return [
                // 어답티브를 통해 크기 닿는데까지 아이템을 여러개 넣기
                GridItem(.adaptive(minimum: 100))
            ]
    }
}
 */

func setView(value: List) -> some View {
    switch value {
    case .table:
        return AnyView(ListView())
    case .grid:
        return AnyView(VGridView())
    case .multiple:
        return AnyView(VGrid3View())
    }
}

struct Example_ContentView: View {
    @State private var selectionValue: List = .table
    
    var body: some View {
        VStack {
            Picker(selection: $selectionValue,
                   label: Text(""),
                   content: {
                    Image(systemName: "list.bullet").tag(List.table)
                    Image(systemName: "square.grid.2x2.fill").tag(List.grid)
                    Image(systemName: "square.grid.3x3.fill").tag(List.multiple)
                    
                    // Foreach(LayoutType.allCases, id: \.self, content: { layoutType in
                    // switch layoutType -> case로 Image를 지정해주기
            })
                .pickerStyle(SegmentedPickerStyle())
                .frame(width: 250)
            
            // 내용물
            ScrollView {
                setView(value: selectionValue)
                // LazyVGrid(columns: list.columns, content:
                //  ForEach(dummyDatas)  { dataItem in // var dummyData = MyModel.dummyDataArray
                //       switch list {
                //          case .table:
                //          ...
                //      }
                //       Rectangle().frame(height: 100).foregroundColor(.blue)
                //  }
                // .animation(.easeInout)
            }
            .edgesIgnoringSafeArea(.bottom)
        }
    }
}

struct Example_ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Example_ContentView()
    }
}
