//
//  ContentView.swift
//  SwiftUI_QRCodeReader_tutorial
//
//  Created by SHIN YOON AH on 2021/04/26.
//

import SwiftUI

struct ContentView: View {
    
    @State var showingSheet = false
    @State var scannedCode: String?
    
    var body: some View {
        ZStack {
            if self.scannedCode != nil {
                MyWebView(urlToLoad: scannedCode!)
            } else {
                MyWebView(urlToLoad:"https://www.naver.com")
            }
            
            
            VStack() {
                Spacer()
                
                Button(action: {
                    self.showingSheet.toggle()
                }) {
                    
                    Text("로또번호확인")
                        .font(.system(size: 25))
                        .fontWeight(.bold)
                        .padding(25)
                        .foregroundColor(.blue)
                        .background(Color.yellow)
                        .cornerRadius(15)
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .strokeBorder(lineWidth: 10)
                                
                        )
                }.padding(.bottom, 50)
            }.sheet(isPresented: $showingSheet) {
                self.scannerSheet
            }
        }
    }
    
    var scannerSheet : some View {
        CodeScannerView(
            codeTypes: [.qr],
            completion: { result in
                if case let .success(code) = result {
                    self.scannedCode = code
                    self.showingSheet = false
                }
            }
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
