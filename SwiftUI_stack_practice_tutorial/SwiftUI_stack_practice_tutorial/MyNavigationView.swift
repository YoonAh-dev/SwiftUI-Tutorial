//
//  ContentView.swift
//  SwiftUI_stack_practice_tutorial
//
//  Created by SHIN YOON AH on 2021/04/22.
//

import SwiftUI

struct MyNavigationView: View {
    var body: some View {
        Text("Heelo")
            
    }
    // Navigation View로 이미 감싸져있기 때문에 profile에서 또 두면
    // 위가 붕뜨게 된다
}

struct MyNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        MyNavigationView()
    }
}
