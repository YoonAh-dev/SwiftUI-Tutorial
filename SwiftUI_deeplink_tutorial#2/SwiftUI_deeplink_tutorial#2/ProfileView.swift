//
//  ProfileView.swift
//  SwiftUI_deeplink_tutorial#2
//
//  Created by SHIN YOON AH on 2021/05/03.
//

import SwiftUI

struct ProfileView: View {
    var body: some View{
        Rectangle()
            .foregroundColor(Color.init(#colorLiteral(red: 0.7216244729, green: 0.2885139788, blue: 1, alpha: 1)))
            .frame(width: 100, height: 100)
            .cornerRadius(15)
            .overlay(
                Text("프로필")
                    .font(.system(size: 23))
                    .fontWeight(.black)
                    .foregroundColor(.white)
            )
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
