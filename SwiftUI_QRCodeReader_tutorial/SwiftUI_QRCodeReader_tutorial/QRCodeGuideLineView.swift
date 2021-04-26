//
//  QRCodeGuideLineView.swift
//  SwiftUI_QRCodeReader_tutorial
//
//  Created by SHIN YOON AH on 2021/04/26.
//

import SwiftUI

struct QRCodeGuideLineView: View {
    var body: some View {
        GeometryReader { geo in
            RoundedRectangle(cornerRadius: 20)
                .stroke(style: StrokeStyle(lineWidth: 10, dash: [9]))
                .frame(width: geo.size.width / 2, height: geo.size.height / 3)
                .position(x: geo.size.width/2, y: geo.size.height/2)
                .foregroundColor(Color.yellow)
        }
    }
}

struct QRCodeGuideLineView_Previews: PreviewProvider {
    static var previews: some View {
        QRCodeGuideLineView()
    }
}
