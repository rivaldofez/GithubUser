//
//  RepositoryResponse.swift
//  GithubUser
//
//  Created by Rivaldo Fernandes on 21/04/23.
//

import Foundation

struct RepositoryResponse: Codable {
    let id: Int?
    let nodeID, name, fullName: String?
    let description: String?
    let stargazersCount, watchersCount: Int?
    let forksCount: Int?
    let updatedAt: String?

    enum CodingKeys: String, CodingKey {
        case id
        case nodeID = "node_id"
        case name
        case fullName = "full_name"
        case description
        case stargazersCount = "stargazers_count"
        case watchersCount = "watchers_count"
        case forksCount = "forks_count"
        case updatedAt = "updated_at"
    }
}
