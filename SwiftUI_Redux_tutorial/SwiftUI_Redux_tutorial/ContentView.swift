//
//  ContentView.swift
//  SwiftUI_Redux_tutorial
//
//  Created by SHIN YOON AH on 2021/05/04.
//

import SwiftUI

// Store - 앱 전체의 상태를 가지고 있는 녀석
// Action - 리듀서에게 알리는 상태 변경에 대한 액션
// Reducer
// - 액션으로 새로운 앱 상태를 변경하는 메소드들을 제공하는 것들
// - 현재 앱 상태를 받거나 앱 상태를 변경하기 위해 액션을 보내는 녀석

struct ContentView: View {
    
    // appReducer가 실행된겨
    // 스토어 인스턴스 생성
    let store = AppStore(initState: .init(currentDice: "⚀"), reducer: appReducer(_:_:))
    
    var body: some View {
        // 하위뷰에 변경가능한 녀석을 넣어줌
        // 그게 AppStore
        // 서브뷰에 옵져버블 오브젝트를 연결
        // 스토어의 값이 변경되면 DiceView에서 그걸 계속해서 인지
        // 스토어와 UI를 서로 바인딩해준 상태
        DiceView().environmentObject(store)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
