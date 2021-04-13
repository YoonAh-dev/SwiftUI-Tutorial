//
//  MyWebView.swift
//  SwiftUI_WebView_tutorial
//
//  Created by SHIN YOON AH on 2021/04/13.
//

import SwiftUI
import WebKit

// UIKit의 UIView를 사용할 수 있도록 한다.
// UIViewController를 사용하고 싶다면 UIViewControllerRepresentable 사용

struct MyWebView: UIViewRepresentable {
    
    var urlToLoad: String
    
    // UIView 만들기
    func makeUIView(context: Context) -> WKWebView {
        // unwrapping
        guard let url = URL(string: self.urlToLoad) else {
            return WKWebView()
        }
        
        // webView 인스턴스 생성
        let webview = WKWebView()
        
        // webView를 로드한다.
        webview.load(URLRequest(url: url))
        
        return webview
    }
    
    // 업데이트 UI View
    // SwiftUI에서는 알아서 뷰를 다시 그린다(그 때 발동할 것이 업데이트 UI View)
    func updateUIView(_ uiView: WKWebView, context: UIViewRepresentableContext<MyWebView>) {
        
    }
}

struct MyWebView_Previews: PreviewProvider {
    static var previews: some View {
        MyWebView(urlToLoad: "https://www.naver.com")
    }
}
