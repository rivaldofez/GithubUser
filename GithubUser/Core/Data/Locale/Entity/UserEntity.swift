//
//  UserEntity.swift
//  GithubUser
//
//  Created by Rivaldo Fernandes on 20/04/23.
//

import Foundation
import RealmSwift

class UserEntity: Object {
    @Persisted var login: String = ""
    @Persisted var id: Int = 0
    @Persisted var nodeID: String = ""
    @Persisted var avatarURL: String = ""
    @Persisted var gravatarID: String = ""
    @Persisted var url: String = ""
    @Persisted var htmlURL: String = ""
    @Persisted var followersURL: String = ""
    @Persisted var followingURL: String = ""
    @Persisted var gistsURL: String = ""
    @Persisted var starredURL: String = ""
    @Persisted var subscriptionURL: String = ""
    @Persisted var organizationURL: String = ""
    @Persisted var reposURL: String = ""
    @Persisted var eventsURL: String = ""
    @Persisted var receivedURL: String = ""
    @Persisted var type: String = ""
    @Persisted var siteAdmin: String = ""
    @Persisted var score: Int = 0
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
