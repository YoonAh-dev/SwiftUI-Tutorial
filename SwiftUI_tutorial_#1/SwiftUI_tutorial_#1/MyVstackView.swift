//
//  MyVstackView.swift
//  SwiftUI_tutorial_#1
//
//  Created by SHIN YOON AH on 2021/04/13.
//

import SwiftUI

struct MyVstackView: View {
    
    // 데이터를 연동시킨다
    @Binding
    var isActivated: Bool
    
    // Binding를 쓸려면 기본생성자를 설정해줘야 함
    init(isActivated: Binding<Bool> = .constant(false)) {
        // _으로 쓰는 거 처음 봄 -> 이게 뭐지??
        _isActivated = isActivated
    }
    
    var body: some View {
        VStack {
            Text("1!")
                .fontWeight(.bold)
                .font(.system(size: 40))
            Text("2!")
                .fontWeight(.bold)
                .font(.system(size: 40))
            Text("3!")
                .fontWeight(.bold)
                .font(.system(size: 40))
        }
        .padding(self.isActivated ? 10 : 0)
        .background(self.isActivated ? Color.green : Color.red)
    }
}

// 보여주는 용도
struct MyVstackView_Previews: PreviewProvider {
    static var previews: some View {
        MyVstackView()
    }
}
