//
//  ContentView.swift
//  SwiftUI_TextField_tutorial
//
//  Created by SHIN YOON AH on 2021/04/26.
//

import SwiftUI

struct ContentView: View {
    
    @State private var inputValue: String = ""
    @State private var secureValue: String = ""
    
    var body: some View {
        VStack(spacing: 6) {
            HStack {
                TextField("사용자 이름", text: $inputValue)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                
                Button(action: {
                    self.inputValue = ""
                } ) {
                    if inputValue != "" {
                        Image(systemName: "multiply.circle.fill")
                            .foregroundColor(Color.gray)
                    } else {
                        
                    }
                }
            }
             
            HStack {
                SecureField("비밀번호", text: $secureValue)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button(action: {
                    self.secureValue = ""
                } ) {
                    if secureValue != "" {
                        Image(systemName: "multiply.circle.fill")
                            .foregroundColor(Color.gray)
                    } else {
                        
                    }
                }
            }.padding(.bottom, 6)
            
            Text("비밀번호 : \(secureValue)")
        }
        // .padding(.horizontal, 30)
        .padding([.leading, .trailing], 30)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
