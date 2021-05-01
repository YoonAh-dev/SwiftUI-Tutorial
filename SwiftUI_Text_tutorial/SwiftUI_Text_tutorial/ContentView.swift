//
//  ContentView.swift
//  SwiftUI_Text_tutorial
//
//  Created by SHIN YOON AH on 2021/04/13.
//

import SwiftUI

struct ContentView: View {
    
    // dateFormat를 return 시켜서 사용
    static let dateFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY년 M월 d일"
//        formatter.dateStyle = .long
        return formatter
    }()
    
    var today = Date()
    
    var trueOfFalse : Bool = false
    
    var number: Int = 123
    
    var body: some View {
        VStack {
            Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.")    .tracking(1)
                .font(.system(.body, design: .monospaced))
                .fontWeight(.light)
                .multilineTextAlignment(.leading)

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
