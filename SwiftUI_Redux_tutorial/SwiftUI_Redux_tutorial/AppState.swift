//
//  AppState.swift
//  SwiftUI_Redux_tutorial
//
//  Created by SHIN YOON AH on 2021/05/04.
//

import Foundation

// 앱의 상태 즉 데이터 -
struct AppState {
    var currentDice: String = "" {
        didSet {
            print("currentDice: \(currentDice)", #fileID, #function)
        }
    }
}
