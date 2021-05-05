//
//  CellView.swift
//  SwiftUI_Alamofire_tutorial
//
//  Created by SHIN YOON AH on 2021/05/05.
//

import SwiftUI
import URLImage

struct CellView : View {
    
    var randomUser: RandomUser
    
    init(_ randomUser: RandomUser) {
        self.randomUser = randomUser
    }
    
    var body: some View {
        HStack() {
            URLImage(url: randomUser.profileImgUrl, content: { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .scaledToFill()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                    .overlay(
                        Circle().stroke(Color.yellow,
                                        lineWidth: 2)
                    )
            })
                
            Text("\(randomUser.name.description)")
                .font(.system(size: 20))
                .bold()
                .lineLimit(2)
                .minimumScaleFactor(0.5)
        }
    }
}

struct CellView_Previews : PreviewProvider {
    static var previews: some View {
        CellView(RandomUser.getDummy())
    }
}
