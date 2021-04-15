//
//  CircleImageView.swift
//  SwiftUI_Image_tutorial
//
//  Created by SHIN YOON AH on 2021/04/15.
//

import SwiftUI

struct CircleImageView : View {
    var body: some View {
//        Image(systemName: "tortoise")
//            .font(.system(size: 200))
//            .foregroundColor(.yellow)
//            .shadow(color: .gray, radius: 10, x: 0, y: 10)
        Image("image1")
            .resizable()
            // aspectRatio == scaledToFit
            .scaledToFill()
//            .aspectRatio(contentMode: .fill)
            .frame(width: 250, height: 250)
            .clipShape(Circle())
            .shadow(color: .gray, radius: 20, x: 5, y: 10)
            .overlay(
                Circle().foregroundColor(.black)
                    .opacity(0.2)
            )
            .overlay(
                Circle().stroke(Color.blue,
                                lineWidth: 1)
                    .padding()
            )
            .overlay(
                Circle().stroke(Color.blue,
                                lineWidth: 1)
                    .padding(30)
            )
            .overlay(
                Circle().stroke(Color.blue,
                                lineWidth: 1)
            )
            .overlay(
                Text("Stay Chill")
                    .foregroundColor(Color.white)
                    .font(.system(size: 50))
                    .fontWeight(.medium)
            )
//            .clipped()
//            .edgesIgnoringSafeArea(.all)
    }
}

struct CircleImageView_Previews: PreviewProvider {
    static var previews: some View {
        CircleImageView()
    }
}
