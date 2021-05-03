//
//  ListView.swift
//  SwiftUI_lazyVGrid_tutorial
//
//  Created by SHIN YOON AH on 2021/05/03.
//

import SwiftUI

struct ListView: View {
    var body: some View {
        ForEach(1...100, id: \.self) { id in
            VStack {
                Rectangle()
                    .frame(width: UIScreen.main.bounds.size.width - 10, height: 80)
                    .cornerRadius(20)
                    .foregroundColor(.green)
                    .overlay(
                        HStack() {
                            Image(systemName: "book.fill")
                                .foregroundColor(.white)
                                .font(.largeTitle)
                            VStack(alignment: .leading) {
                                Text("책읽기")
                                    .font(.system(size: 20))
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                Text("1PM - 3PM")
                                    .foregroundColor(.white)
                            }
                        }
                        .padding()
                    , alignment: .leading)
            }
        }
    }
}
