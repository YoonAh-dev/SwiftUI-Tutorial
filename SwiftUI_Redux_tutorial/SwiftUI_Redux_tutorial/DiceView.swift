//
//  DiceView.swift
//  SwiftUI_Redux_tutorial
//
//  Created by SHIN YOON AH on 2021/05/04.
//

import SwiftUI

struct DiceView: View {
    // 외부에서 enviromentObject()로 연결됨
    @EnvironmentObject var store: AppStore
    
    @State private var shouldRoll = false
    
    @State private var pressed = false
    
    var diceRollAnimation: Animation {
        Animation.spring()
    }
    
    // 주사위 굴리기 액션을 실행
    func rollTheDice() {
        // 어떤 파일의, 어떤 함수, 어떤 라인이 실행됐는지 나옴
        print(#fileID, #function, #line)
        self.shouldRoll.toggle()
        self.store.dispatch(.rolltheDice)
    }
    
    var body: some View {
        VStack {
            Text(self.store.state.currentDice)
                .font(.system(size: 300, weight: .bold, design: .monospaced))
                .foregroundColor(Color.init(#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)))
                .rotationEffect(.degrees(shouldRoll ? 360 : 0))
                .animation(diceRollAnimation)
            Button(action: {
                self.rollTheDice()
            }, label: {
                Text("랜덤 주사위 굴리기")
                    .fontWeight(.black)
            })
            .buttonStyle(MyButtonStyle(color: Color.yellow))
            .scaleEffect(self.pressed ? 0.8 : 1.0)
            .onLongPressGesture(minimumDuration: .infinity, maximumDistance: .infinity, pressing: { pressing in
                withAnimation(.easeInOut(duration: 0.2), {
                    self.pressed = pressing
                })
            }, perform: {})
        }
    }
}

struct DiceView_Previews: PreviewProvider {
    static var previews: some View {
        DiceView()
    }
}
