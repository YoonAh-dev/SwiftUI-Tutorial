//
//  ContentView.swift
//  SwiftUI_DeepLink_tutorial
//
//  Created by SHIN YOON AH on 2021/05/02.
//

import SwiftUI

// 앱에 대한 고유한 URL : 딥링크

func prepareData() -> [Int] {
    var newList = [Int]()
    
    for i in 0...20 {
        newList.append(i)
    }
    
    return newList
}

struct ContentView: View {
    @State private var list: [Int] = []
    @State var selectedTab = TabIdentifier.todos
    @State var activeUUID: UUID?
    
    init() {
        _list = State(initialValue: prepareData())
    }
    
    var body: some View {
        TabView {
            NavigationView {
                List {
                    ForEach(list, id: \.self) { id in
                        HStack {
                            Text("내 할일 \(id)")
                            Spacer()
                            NavigationLink(
                            destination: Text("Hello") ) {
                                
                            }
                            /*
                             NavigationLink(
                                destination: Text("\(todoItem.title)"),
                                tag: todoItem.id,
                             // activeUUID 값이 변경되면 해당 하는 링크로 이동
                                selection: $activeUUID,
                                label: {
                                    Text("\(todoItem.title)")
                             })
                             */
                        }
                    }
                }
                .navigationBarTitle("할 일 목록")
                .onOpenURL(perform: { url in
                    if case .todoItem(let id) = url.detailPage {
                        print("넘어온 Id: \(id)")
                        activeUUID = id
                    }
                })
                
            }
            .tabItem {
                Image(systemName: "list.bullet")
                Text("할일목록")
            }
            .tag(TabIdentifier.todos)
            
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 100, height: 100)
                    .foregroundColor(.blue)
                // .overlay {
                //      Text("프로필")
                //  }
                
                Text("프로필")
                    .font(.system(size: 30))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
            }
            .tabItem {
                Image(systemName: "person.crop.circle.fill")
                Text("프로필")
            }
            .tag(TabIdentifier.profile)
        }
        .onOpenURL(perform: { url in
            // 열려야 하는 url 처리
            guard let tabId = url.tabIdentifier else { return }
            selectedTab = tabId
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// 어떤 탭이 선택되었는지 여부
enum TabIdentifier: Hashable {
    case todos, profile
}

// 어떤 페이지를 보여줘야 하는지
enum PageIdentifier: Hashable {
    case todoItem(id: UUID)
}

extension URL {
    // info에서 추가한 딥링크가 들어왔는지 여부
    var isDeeplink : Bool {
        return scheme == "deeplink-swiftui"
    }
    
    // url 들어오는 것으로 어떤 타입의 탭을 보여줘야 하는지 가져오기
    var tabIdentifier: TabIdentifier? {
        guard isDeeplink else { return nil }
        
        // deeplink-swiftui://(hohoho) 호스트 부분
        switch host {
        case "todos":
            return .todos
        case "profile":
            return .profile
        default:
            return nil
        }
    }
    
    var detailPage: PageIdentifier? {
        // index가 쭉쭉 들어오게 된다 /hohoho/great <- todoId 부분
        guard let tabId = tabIdentifier,
              pathComponents.count > 1,
              let uuid = UUID(uuidString: pathComponents[1])
              else { return nil }
        
        switch tabId {
        case .todos:
            return .todoItem(id: uuid)
        default:
            return nil
        }
    }
}
