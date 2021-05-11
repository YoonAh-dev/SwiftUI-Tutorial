//
//  ContentView.swift
//  SwiftUI_Alamofire_tutorial
//
//  Created by SHIN YOON AH on 2021/05/05.
//

import SwiftUI
import UIKit
import Introspect

class RefreshControlHelper {
    // MARK: - Properties
    var parentContentView: ContentView?
    var refreshControl: UIRefreshControl?
    
    @objc
    func didRefresh() {
        print(#fileID, #function, #line, "")
        guard let parentContentView = parentContentView,
              let refreshControl = refreshControl else {
            print("parentContentView, refreshControl 가 nil입니다")
            return
        }
        
        // UI화면 thread에서 돌린다.
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.7, execute:  {
            print("refresh completed")
            // MARK: - TODO : API 다시 땡기기
//            parentContentView.randomUserViewModel.fetchRandomUsers()
            // MARK: - Combine으로 땡겨 쓰기
            // 이벤트가 들어가는 시점
            parentContentView.randomUserViewModel.refreshActionSubject.send()
            refreshControl.endRefreshing()
        })
    }
}

struct ContentView: View {
    @ObservedObject var randomUserViewModel = RandomUserViewModel()
    
    let refreshControlHelper = RefreshControlHelper()
    
    var body: some View {
        // 각각의 아이템들을 ForEach문처럼 가져와서 뷰를 그림
        List(randomUserViewModel.randomUsers) { randomUser in
            CellView(randomUser)
         }
        .introspectTableView{ self.configureRefreshControl($0) }
//        .introspectTableView { tableView in
//            self.configureRefreshControl(tableView)
//        }
    }
}

// MARK: - Helper Methods
extension ContentView {
    fileprivate func configureRefreshControl(_ tableView: UITableView) {
        print(#fileID, #function, #line, "")
        // 이 안에 있는 건 UIKit
        let myRefreshControl = UIRefreshControl()
        myRefreshControl.tintColor = .systemBlue
        refreshControlHelper.refreshControl = myRefreshControl
        refreshControlHelper.parentContentView = self
        myRefreshControl.addTarget(refreshControlHelper, action: #selector(RefreshControlHelper.didRefresh), for: .valueChanged)
        
        tableView.refreshControl = myRefreshControl
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
