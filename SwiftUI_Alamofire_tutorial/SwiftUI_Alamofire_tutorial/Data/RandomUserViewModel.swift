//
//  RandomUserViewModel.swift
//  SwiftUI_Alamofire_tutorial
//
//  Created by SHIN YOON AH on 2021/05/05.
//

import Combine
import Alamofire

// ObservableObject이기 때문에 관찰이 가능
// RandomUsers 관찰가능
class RandomUserViewModel: ObservableObject {
    // MARK: - Properties
    var subscription = Set<AnyCancellable>()
    
    // @Published 되어 있어서 이벤트로 인해서 변경되는 상황을 알 수 있음
    @Published var randomUsers = [RandomUser]()
    
    var baseUrl = "https://randomuser.me/api/?results=100"
    
    init() {
        print(#fileID, #function, #line, "")
        fetchRandomUsers()
    }
    
    func fetchRandomUsers() {
        print(#fileID, #function, #line, "")
        AF.request(baseUrl)
            .publishDecodable(type: RandomUserResponse.self)
            // publisher Output으로 wrapping이 한 번 쌓여있는데
            // 이걸 .value로 unwrapping -> compactMap으로 unwrapping
            .compactMap { $0.value }
            // 이거보다 더 형변환을 하고 싶다 한다면
            // 저것들 중에서 results만 가져올래! 이런 뜻
            .map{ $0.results }
            .sink(receiveCompletion: { completion in
                print("데이터 스트림 완료")
            }, receiveValue: { receivedValue in
                print("받은 값 : \(receivedValue.count)")
                self.randomUsers = receivedValue // receivedValue 자체가 randomUser이기때문에 바로 들어감
            }).store(in: &subscription)
    }
}
