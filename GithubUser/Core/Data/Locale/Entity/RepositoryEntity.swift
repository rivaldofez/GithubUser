//
//  RepositoryEntity.swift
//  GithubUser
//
//  Created by Rivaldo Fernandes on 21/04/23.
//

import Foundation
import RealmSwift

class RepositoryEntity: Object {
    @Persisted var id: Int = 0
    @Persisted var nodeID: String = ""
    @Persisted var name: String  = ""
    @Persisted var fullName: String = ""
    @Persisted var desc: String = ""
    @Persisted var stargazersCount: Int = 0
    @Persisted var varwatchersCount: Int = 0
    @Persisted var forksCount: Int = 0
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
