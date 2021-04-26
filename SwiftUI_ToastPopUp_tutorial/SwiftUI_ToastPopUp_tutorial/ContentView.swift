//
//  ContentView.swift
//  SwiftUI_ToastPopUp_tutorial
//
//  Created by SHIN YOON AH on 2021/04/26.
//

import SwiftUI
import ExytePopupView

struct ContentView: View {
    
    @State var shouldShowBottomSolidMessage = false
    @State var shouldShowBottomToastMessage = false
    @State var shouldShowTopSolidMessage = false
    @State var shouldShowTopToastMessage = false
    @State var shouldShowPopup = false
    
    func createBottomSolidMessage() -> some View {
        HStack(spacing: 10) {
            Image(systemName: "book")
                .font(.system(size: 40))
                .foregroundColor(Color.white)
            
            VStack(alignment: .leading) {
                Text("안내 메세지")
                    .fontWeight(.black)
                    .foregroundColor(Color.white)

                
                Text("토스트 메시지 입니다.")
                    .font(.system(size: 14))
                    .foregroundColor(Color.white)
                    .lineLimit(2)
                Divider().opacity(0)
            }
            
        }
        .padding()
        .frame(width: UIScreen.main.bounds.width)
        .padding(.bottom, UIApplication.shared.windows.first?.safeAreaInsets.bottom == 0 ? 0 : 20)
        .background(Color.purple)
    }
    
    func createTopSolidMessage() -> some View {
        HStack(spacing: 10) {
            Image("2")
                .resizable()
                .aspectRatio(contentMode: ContentMode.fill)
                .frame(width: 80, height: 80)
                .cornerRadius(20)
            
            VStack(alignment: .leading) {
                Text("개발하는 신우나님의 메세지")
                    .fontWeight(.black)
                    .foregroundColor(Color.white)

                Text("죽고 잡냐\n팝업팝업 되고 있냐")
                    .font(.system(size: 14))
                    .foregroundColor(Color.white)
                    .lineLimit(2)
                Divider().opacity(0)
            }
            
        }
        .padding()
        .frame(width: UIScreen.main.bounds.width)
        .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.bottom == 0 ? 0 : 20)
        .background(Color.purple)
    }
    
    func createBottomToastMessage() -> some View {
        HStack(alignment: .top, spacing: 10) {
            Image("1")
                .resizable()
                .aspectRatio(contentMode: ContentMode.fill)
                .frame(width: 80, height: 80)
                .cornerRadius(20)
            
            VStack(alignment: .leading) {
                Text("내 주인님")
                    .fontWeight(.black)
                    .foregroundColor(Color.white)

                
                Text("고양이에게 반항하지말아라. 고양이가 곧 주인이고 사람은 집사다. 절대 고양이를 건들지마라. 내가 가만 안둔다. 고양이가 진짜 최고다. 고양이가 곧 지구를 지배한다고 해도 우리는 가만히 있어야 한다.")
                    .font(.system(size: 14))
                    .foregroundColor(Color.white)
                Divider().opacity(0)
            }
            
        }
        .padding(15)
        .frame(width: 300)
        .background(Color.green)
        .cornerRadius(20)
    }
    
    func createTopToastMessage() -> some View {
        HStack(alignment: .center, spacing: 10) {
            Image(systemName: "paperplane.fill")
                .font(.system(size: 40))
                .padding(.horizontal, 5)
                .foregroundColor(Color.white)
            
            VStack(alignment: .leading, spacing: 5) {
                Text("신우나님의 메세지")
                    .fontWeight(.black)
                    .foregroundColor(Color.white)
                
                Text("밥먹었냐?")
                    .font(.system(size: 14))
                    .lineLimit(1)
                    .foregroundColor(Color.white)
//                Divider().opacity(0)
            }
            .padding(.trailing, 30)
        }
        .padding(15)
        .background(Color.green)
        .cornerRadius(30)
    }
    
    func createPopup() -> some View {
        VStack(spacing: 10) {
            Image("2")
                .resizable()
                .aspectRatio(contentMode: ContentMode.fit)
                .frame(width: 100, height: 100)
                .cornerRadius(20)
            
            Text("개발하는 XXIN")
                .fontWeight(.black)
                .foregroundColor(Color.white)
            
            Text("밥먹었냐? 밥먹었냐? 밥먹었냐? 밥먹었냐? 밥먹었냐? 밥먹었냐? 밥먹었냐? 밥먹었냐? 밥먹었냐? 밥먹었냐? 밥먹었냐? 밥먹었냐? 밥먹었냐? 밥먹었냐? 밥먹었냐? 밥먹었냐? 밥먹었냐? 밥먹었냐? 밥먹었냐? 밥먹었냐? 밥먹었냐?")
                .font(.system(size: 14))
                .foregroundColor(Color.white)
                .padding(.horizontal, 20)
                .multilineTextAlignment(.center)
            
            Spacer().frame(height: 10)
            
            Button(action: {
                self.shouldShowPopup = false
            }) {
                Text("닫기")
                    .font(.system(size: 14))
                    .foregroundColor(.black)
                    .fontWeight(.bold)
            }
            .frame(width: 100, height: 40)
            .background(Color.white)
            .cornerRadius(20)
        }
        .padding(.horizontal, 10)
        .frame(width: 300, height: 400)
        .background(Color(hexcode: "9999FF"))
        .cornerRadius(10)
        .shadow(color: Color(.sRGBLinear, white: 0, opacity: 0.13), radius: 10)
    }
    
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                Button(action: {
                    self.shouldShowBottomSolidMessage = true
                }) {
                    Text("바텀솔리드메세지")
                        .font(.headline)
                        .fontWeight(.bold)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(Color.white)
                        .cornerRadius(10)
                }
                
                Button(action: {
                    self.shouldShowBottomToastMessage = true
                }) {
                    Text("바텀토스트메세지")
                        .font(.headline)
                        .fontWeight(.bold)
                        .padding()
                        .background(Color.green)
                        .foregroundColor(Color.white)
                        .cornerRadius(10)
                }
                
                Button(action: {
                    self.shouldShowTopSolidMessage = true
                }) {
                    Text("탑솔리드메세지")
                        .font(.headline)
                        .fontWeight(.bold)
                        .padding()
                        .background(Color.red)
                        .foregroundColor(Color.white)
                        .cornerRadius(10)
                }
                
                Button(action: {
                    self.shouldShowTopToastMessage = true
                }) {
                    Text("탑토스트메세지")
                        .font(.headline)
                        .fontWeight(.bold)
                        .padding()
                        .background(Color.black)
                        .foregroundColor(Color.white)
                        .cornerRadius(10)
                }
                
                Button(action: {
                    self.shouldShowPopup = true
                }) {
                    Text("팝업")
                        .font(.headline)
                        .fontWeight(.bold)
                        .padding()
                        .background(Color(hexcode: "9999FF"))
                        .foregroundColor(Color.white)
                        .cornerRadius(10)
                }
                Spacer()
            }
        }
        .edgesIgnoringSafeArea(.all)
        .popup(isPresented: $shouldShowBottomSolidMessage, type: .toast, position: .bottom, animation: .spring(), autohideIn: 2, closeOnTap: true, closeOnTapOutside: true) {
            createBottomSolidMessage()
        }
        .popup(isPresented: $shouldShowBottomToastMessage, type: .floater(verticalPadding: 20), position: .bottom, animation: .spring(), autohideIn: 2, closeOnTap: true, closeOnTapOutside: true) {
            createBottomToastMessage()
        }
        .popup(isPresented: $shouldShowTopSolidMessage, type: .toast, position: .top, animation: .spring(), autohideIn: 2, closeOnTap: true, closeOnTapOutside: true) {
            createTopSolidMessage()
        }
        .popup(isPresented: $shouldShowTopToastMessage, type: .floater(verticalPadding: UIApplication.shared.windows.first?.safeAreaInsets.bottom == 0 ? 20 : 60), position: .top, animation: .spring(), autohideIn: 2, closeOnTap: true, closeOnTapOutside: true) {
            createTopToastMessage()
        }
        .popup(isPresented: $shouldShowPopup, type: .default, position: .bottom, animation: .easeIn, autohideIn: 2, closeOnTap: true, closeOnTapOutside: true) {
            createPopup()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
