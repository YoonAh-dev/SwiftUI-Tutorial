//
//  Reducer.swift
//  SwiftUI_Redux_tutorial
//
//  Created by SHIN YOON AH on 2021/05/04.
//

import Foundation

// typealias -> 별칭으로 만든다
// State가 매개변수로 들어올때 그걸 변경할때 쓰는게 inout 키워드 -> 매개변수로 들어오는 걸 변경시키고자 할 때 사용(inout)
// 이거 자체가 클로져
// Void 해당 클로져 자체를 별칭으로 리듀서로 칭함 State와 Action를 가지고 있음
typealias Reducer<State, Action> = (inout State, Action) -> Void

// filtering method
func appReducer(_ state: inout AppState, _ action: AppAction) -> Void {
    // 들어오는 액션에 따라 분기 처리 - 즉 필터링
    switch action {
    case .rolltheDice:
        // 앱의 상태를 변경하기(랜덤하게)
        state .currentDice = ["⚀", "⚁", "⚂", "⚃", "⚄", "⚅"].randomElement() ?? "⚀"
    }
}
