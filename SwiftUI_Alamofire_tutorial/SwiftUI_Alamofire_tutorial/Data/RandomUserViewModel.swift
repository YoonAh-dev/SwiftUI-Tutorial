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
    @Published var pageInfo: Info? {
        didSet {
            print("pageInfo : \(pageInfo)")
        }
    }
    @Published var isLoading: Bool = false
    
    // 단방향으로 이벤트를 보냄
    // 보내는 데이터가 없기 때문에 () 이렇게 생성
    var refreshActionSubject = PassthroughSubject<(), Never>()
    var fetchMoreActionSubject = PassthroughSubject<(), Never>()
    
    init() {
        print(#fileID, #function, #line, "")
        fetchRandomUsers()
        
        refreshActionSubject.sink { [weak self] _ in
            guard let self = self else { return }
            self.fetchRandomUsers()
        }.store(in: &subscription)
        
        fetchMoreActionSubject.sink { [weak self] _ in
            guard let self = self else { return }
            if !self.isLoading {
                self.fetchMore()
            }
        }.store(in: &subscription)
    }
    
    // 다음 페이지에 접근하는 메소드
    fileprivate func fetchMore() {
        print(#fileID, #function, #line, "")
        guard let currentPage = pageInfo?.page else {
            print("페이지 정보가 없습니다.")
            return
        }
        
        self.isLoading = true
        
        let pageToLoad = currentPage + 1
        AF.request(RandomUserRouter.getUsers(page: pageToLoad))
            .publishDecodable(type: RandomUserResponse.self)
            .compactMap { $0.value }
            .sink(receiveCompletion: { completion in
                print("데이터 스트림 완료")
                self.isLoading = false
            }, receiveValue: { receivedValue in
                print("받은 값 : \(receivedValue.results.count)")
                // 기존데이터에서 더함
                self.randomUsers += receivedValue.results
                self.pageInfo = receivedValue.info
            }).store(in: &subscription)
    }
    
    // 외부에서 접근 불가능
    // 하지만 refreshActionSubject에서 api땡기기 가능
    fileprivate func fetchRandomUsers() {
        print(#fileID, #function, #line, "")
        
        AF.request(RandomUserRouter.getUsers())
            .publishDecodable(type: RandomUserResponse.self)
            // publisher Output으로 wrapping이 한 번 쌓여있는데
            // 이걸 .value로 unwrapping -> compactMap으로 unwrapping
            .compactMap { $0.value }
            // 이거보다 더 형변환을 하고 싶다 한다면
            // 저것들 중에서 results만 가져올래! 이런 뜻
//            .map{ $0.results }
            .sink(receiveCompletion: { completion in
                print("데이터 스트림 완료")
            }, receiveValue: { receivedValue in
                print("받은 값 : \(receivedValue.results.count)")
                self.randomUsers = receivedValue.results // receivedValue 자체가 randomUser이기때문에 바로 들어감
                self.pageInfo = receivedValue.info
            }).store(in: &subscription)
    }
}
