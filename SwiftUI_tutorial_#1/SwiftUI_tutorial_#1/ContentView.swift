//
//  ContentView.swift
//  SwiftUI_tutorial_#1
//
//  Created by SHIN YOON AH on 2021/04/13.
//

import SwiftUI

struct ContentView: View {
    // binding : 데이터의 상태를 서로 묶는 것 -> 뷰끼리 데이터 공유 가능
    
    
    // state : 값이 변화되면 알아서 값을 렌더링, 다시 계산해줌
    // @State 값의 변화를 감지 -> 뷰에 적용
    @State
    private var isActivated: Bool = false
        
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    // $ sign도 처음 봄 ??
                    // 서브뷰한테 isActivated 전달
                    MyVstackView(isActivated: $isActivated)
                    MyVstackView(isActivated: $isActivated)
                    MyVstackView(isActivated: $isActivated)
                }
                // isActivated 추가
                .padding(isActivated ? 50 : 10)
                .background(isActivated ? Color.yellow : Color.black)
                //탭 제스쳐 추가
                .onTapGesture {
                    print("Hstack clicked.")
                    // 애니메이션과 함께
                    withAnimation {
                        // toggle() true이면 false로 false 이면 true
                        // content View 자체를 다시 그림
                        self.isActivated.toggle()
                    }
                } // HStack
                
                // 네비게이션 버튼(링크)
                // destination : 다음에 보여질 화면을 뜻함
                NavigationLink(
                    destination: MyTextView(isActivated: $isActivated)) {
                    Text("네비게이션")
                        .fontWeight(.heavy)
                        .font(.system(size: 30))
                        .padding(10)
                        .background(Color.orange)
                        .foregroundColor(Color.white)
                        .cornerRadius(30)
                } .padding(.top, 50)
            }
            
        } // NavigationView
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
