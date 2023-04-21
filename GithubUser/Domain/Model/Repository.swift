//
//  Repository.swift
//  GithubUser
//
//  Created by Rivaldo Fernandes on 21/04/23.
//

import Foundation

struct Repository: Equatable, Identifiable {
     var id: Int
     var nodeID: String
     var name: String
     var fullName: String
     var desc: String
     var stargazersCount: Int
     var watchersCount: Int
     var forksCount: Int
     var updatedAt: String
}
