//
//  MyTextView.swift
//  SwiftUI_tutorial_#1
//
//  Created by SHIN YOON AH on 2021/04/13.
//

import SwiftUI

struct MyTextView: View {
    
    @State
    private var index: Int = 0
    
    // 배경색 배열 준비
    private let backgroundColors = [
        Color.red,
            .green,
            .blue,
            .orange,
            .yellow
    ]
    
    var body: some View {
        VStack {
            Spacer()
            Text("배경 아이템 인덱스 \(self.index%5)")
                .font(.system(size: 30))
                .fontWeight(.bold)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            Spacer()
        }
        .background(backgroundColors[index%5])
        .edgesIgnoringSafeArea(.all)
        .onTapGesture {
            print("배경 아이템 clicked")
            self.index += 1
        }
    }
}

struct MyTextView_Previews: PreviewProvider {
    static var previews: some View {
        MyTextView()
    }
}
