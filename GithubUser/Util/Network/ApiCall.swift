//
//  ApiCall.swift
//  GithubUser
//
//  Created by Rivaldo Fernandes on 20/04/23.
//

import Foundation

struct API {
    static let baseURL = "https://api.github.com/"
    static let token = "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"
}

protocol Endpoint {
    var url: String { get }
}


enum Endpoints {
    enum Gets: Endpoint {
        case searchUser(query: String)
        case detailUser(username: String)
        case reposUser(username: String)
        case defaultList
        
        var url: String {
            switch self {
            case .detailUser(let username):
                return "\(API.baseURL)users/\(username)"
            case .searchUser(let query):
                return "\(API.baseURL)search/users?q=\(query)"
            case .reposUser(username: let username):
                return "\(API.baseURL)users/\(username)/repos"
            case .defaultList:
                return "\(API.baseURL)users"
            }
        }
    }
}
