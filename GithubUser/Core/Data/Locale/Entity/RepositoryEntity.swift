//
//  RepositoryEntity.swift
//  GithubUser
//
//  Created by Rivaldo Fernandes on 21/04/23.
//

import Foundation
import RealmSwift


class RepositoryDataEntity: Object {
    @Persisted var username: String = ""
    @Persisted var repos: List<RepositoryItemEntity> = List()
    
    override static func primaryKey() -> String? {
        return "username"
    }
}

class RepositoryItemEntity: Object {
    @Persisted var id: Int = 0
    @Persisted var nodeID: String = ""
    @Persisted var name: String  = ""
    @Persisted var fullName: String = ""
    @Persisted var desc: String = ""
    @Persisted var stargazersCount: Int = 0
    @Persisted var watchersCount: Int = 0
    @Persisted var forksCount: Int = 0
    @Persisted var updatedAt: String = ""
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
