//
//  RandomUser+ResponseData.swift
//  SwiftUI_Alamofire_tutorial
//
//  Created by SHIN YOON AH on 2021/05/05.
//

import Foundation

struct RandomUser: Codable, Identifiable {
    var id = UUID()
    var name: Name
    var photo: Photo
    
    private enum CodingKeys: String, CodingKey {
        case name = "name"
        case photo = "picture"
    }
    
    static func getDummy() -> Self {
        print(#fileID, #function, #line, "")
        return RandomUser(name: Name.getDummy(), photo: Photo.getDummy())
    }
    
    var profileImgUrl: URL {
        get {
            URL(string: photo.medium)!
        }
    }
}

struct Name: Codable, CustomStringConvertible {
    var title: String
    var first: String
    var last: String
    
    var description: String {
        return "[\(title)] \(last) \(first)"
    }
    
    static func getDummy() -> Self {
        print(#fileID, #function, #line, "")
        return Name(title: "학생", first: "윤아", last: "신")
    }
}

struct Photo: Codable {
    var large: String
    var medium: String
    var thumbnail: String
    
    static func getDummy() -> Self {
        print(#fileID, #function, #line, "")
        return Photo(large: "https://randomuser.me/api/portraits/men/65.jpg",
                     medium: "https://randomuser.me/api/portraits/men/65.jpg",
                     thumbnail: "https://randomuser.me/api/portraits/men/65.jpg")
    }
}

struct Info: Codable {
    var seed: String
    var resultsCount: Int
    var page: Int
    var version: String
    
    private enum CodingKeys: String, CodingKey {
        case seed = "seed"
        case resultsCount = "results"
        case page = "page"
        case version = "version"
    }
}

struct RandomUserResponse: Codable, CustomStringConvertible {
    var results: [RandomUser]
    var info: Info
    
    private enum CodingKeys: String, CodingKey {
        case results, info
    }
    
    var description: String {
        return "results.count: \(results.count) / info: \(info.seed)"
    }
}
