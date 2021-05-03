//
//  Example_ContentView.swift
//  SwiftUI_lazyVGrid_tutorial
//
//  Created by SHIN YOON AH on 2021/05/03.
//

import SwiftUI

enum List {
    case list, grid2, grid3
}

func setView(value: List) -> some View {
    switch value {
    case .list:
        return AnyView(ListView())
    case .grid2:
        return AnyView(VGridView())
    case .grid3:
        return AnyView(VGrid3View())
    }
}

struct Example_ContentView: View {
    @State private var selectionValue: List = .list
    
    var body: some View {
        VStack {
            Picker(selection: $selectionValue,
                   label: Text(""),
                   content: {
                    Image(systemName: "list.bullet").tag(List.list)
                    Image(systemName: "square.grid.2x2.fill").tag(List.grid2)
                    Image(systemName: "square.grid.3x3.fill").tag(List.grid3)
            })
                .pickerStyle(SegmentedPickerStyle())
                .frame(width: 250)
            
            ScrollView {
                setView(value: selectionValue)
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
