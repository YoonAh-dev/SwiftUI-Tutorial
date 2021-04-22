//
//  MyProjectCard.swift
//  SwiftUI_stack_practice_tutorial
//
//  Created by SHIN YOON AH on 2021/04/22.
//

import SwiftUI

struct MyBasicCard: View {
    var body: some View {
        HStack(spacing: 20) {
            // Image 크기 조정은 font 사이즈로
            Image(systemName: "flame.fill")
                .font(.system(size: 40))
                .foregroundColor(.white)
            
            
            VStack(alignment: .leading, spacing: 0) {
                Rectangle().frame(height: 0)
                Text("하하하")
                    .fontWeight(.bold)
                    .font(.system(size: 23))
                    .foregroundColor(.white)
                
                Spacer().frame(height: 5)
                
                Text("하하하")
                    .foregroundColor(.white)
            }
        }
        .padding(30)
        .background(Color.purple)
        .cornerRadius(20)
    }
}

struct MyBasicCard_Previews: PreviewProvider {
    static var previews: some View {
        MyBasicCard()
    }
}
