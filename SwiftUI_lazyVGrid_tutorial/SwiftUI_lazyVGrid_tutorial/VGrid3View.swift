//
//  VGrid3View.swift
//  SwiftUI_lazyVGrid_tutorial
//
//  Created by SHIN YOON AH on 2021/05/03.
//

import SwiftUI

struct VGrid3View: View {
    var body: some View {
        GeometryReader { geometry in
            LazyVGrid(columns: [
                GridItem(.adaptive(minimum: geometry.size.width / 3)),
                GridItem(.adaptive(minimum: geometry.size.width / 3)),
                GridItem(.adaptive(minimum: geometry.size.width / 3))
            ], content: {
                ForEach(1...100, id: \.self, content: { id in
                    Rectangle()
                        .frame(height: geometry.size.width / 3)
                })
            })
            .padding(.horizontal, 5)
        }
    }
}
