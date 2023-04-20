//
//  SearchDataEntity.swift
//  GithubUser
//
//  Created by Rivaldo Fernandes on 20/04/23.
//

import Foundation
import RealmSwift

class SearchDataEntity: Object {
    @Persisted var query: String = ""
    @Persisted var users: List<UserDetailEntity> = List()
    
    override static func primaryKey() -> String? {
        return "query"
    }
}
