//
//  AppStore.swift
//  SwiftUI_Redux_tutorial
//
//  Created by SHIN YOON AH on 2021/05/04.
//

import Foundation

// 앱스토어는 앱 상태와 앱 액션을 가지고 있다
// 앱의 상태를 지니고 있기 위해 앱 스토어를 만들어 준다.
// 앱의 모든 상태를 가지고 있음
typealias AppStore = Store<AppState, AppAction>

// ObservableObject 앱 상태를 가지고 있는 옵져버블 오브젝트 스토어
// 상속을 받지 못하도록 final 설정
// 바인딩 가능해짐
final class Store<State, Action>: ObservableObject {
    // Combine에서 사용하는 Published
    // Store가 가지고 있는 무엇인가가 변경이 되면 그걸 받는게 Published
    // 외부에서 읽을 수만 있도록 private(set) 설정하였음
    @Published private(set) var state: State
    
    private let reducer: Reducer<State, Action>
    
    // 생성자 메소드 생성
    // reducer는 클로저이기 때문에 언제나 탈출할 수 있도록 @escaping를 달아줌
    // 제너릭 형태의 State
    // 즉 Store가 가지고 있는 제네릭 State
    init(initState: State, reducer: @escaping Reducer<State, Action>) {
        self.state = initState
        self.reducer = reducer
    }
    
    // 액션 처리를 하는 것 : dispatch
    func dispatch(_ action: Action) {
        // 내가 가지고 있는 State 값을 변경할때는 &(inout) 표시를 해줘야 함
        // 리듀서 클로저를 실행해서 액션을 필터링함
        reducer(&self.state, action)
    }
}
