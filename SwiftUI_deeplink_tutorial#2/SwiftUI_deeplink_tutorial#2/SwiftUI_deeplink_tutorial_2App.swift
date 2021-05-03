//
//  SwiftUI_deeplink_tutorial_2App.swift
//  SwiftUI_deeplink_tutorial#2
//
//  Created by SHIN YOON AH on 2021/05/03.
//

import SwiftUI

@main
struct SwiftUI_deeplink_tutorial_2App: App {
    @State var selectedTab = TabIdentifier.todos
        
        var body: some Scene {
            WindowGroup {
                TabView(selection: $selectedTab,
                    content:  {
                        TodosView().tabItem {
                            VStack{
                                Image(systemName: "list.bullet")
                                Text("할일목록")
                            }
                        }.tag(TabIdentifier.todos)
                        ProfileView().tabItem {
                            VStack{
                                Image(systemName: "person.circle.fill")
                                Text("프로필")
                            }
                        }.tag(TabIdentifier.profile)
                    })
                    .onOpenURL(perform: { url in
                        // 열려야 하는 url 처리
                        guard let tabId = url.tabIdentifier else { return }
                        selectedTab = tabId
                    })
            }
        }
    }

    struct SwiftUI_deeplink_tutorial_2App_Previews: PreviewProvider {
        static var previews: some View {
            /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
        }
    }

    // 어떤 탭이 선택되었는지 여부
    enum TabIdentifier : Hashable {
    //    case todos, profile
        case todos
        case profile
    }

    // 어떤 페이지를 보여줘야 하는지
    enum PageIdentifier: Hashable {
        case todoItem(id: UUID)
    }

    extension URL {
        // info 에서 추가한 딥링크가 들어왔는지 여부
        var isDeeplink : Bool {
            return scheme == "deeplink-swiftui"
        }
        
        // url 들어오는 것으로 어떤 타입의 탭을 보여줘야 하는지 가져오기
        var tabIdentifier: TabIdentifier? {
            
            guard isDeeplink else { return nil }
            
            // deeplink-swiftui://hohoho
            switch host {
            case "todos":
                return .todos
            case "profile":
                return .profile
            default: return nil
            }
        }
        
        
        var detailPage: PageIdentifier? {
            
            // deeplink-swiftui://hohoho/great
            
    //        ["/", "id"]
    //        ["/", "great"]
            
            print("pathComponents: \(pathComponents)")
            
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

