//
//  VGridView.swift
//  SwiftUI_lazyVGrid_tutorial
//
//  Created by SHIN YOON AH on 2021/05/03.
//

import SwiftUI

struct VGridView: View {
    var body: some View {
        LazyVGrid(columns: [
            GridItem(.adaptive(minimum: 200)),
            GridItem(.adaptive(minimum: 200))
        ], content: {
            ForEach(1...100, id: \.self, content: { id in
                Rectangle()
                    .foregroundColor(Color.init(#colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)))
                    .frame(height: 200)
                    .cornerRadius(20)
                    .overlay(
                        VStack {
                            Circle()
                                .frame(width: 90, height: 90)
                            Text("타이틀: \(id)")
                            Text("서브 타이틀: \(id)")
                        }
                        
                    )
            })
        })
        .padding(.horizontal, 5)
    }
}
