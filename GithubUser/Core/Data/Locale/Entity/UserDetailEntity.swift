//
//  UserDetailEntity.swift
//  GithubUser
//
//  Created by Rivaldo Fernandes on 20/04/23.

import Foundation
import RealmSwift

class UserDetailEntity: Object {
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
    @Persisted var siteAdmin: Bool = false
    @Persisted var name: String = ""
    @Persisted var company: String = ""
    @Persisted var location: String = ""
    @Persisted var email: String = ""
    @Persisted var bio: String = ""
    @Persisted var twitterUsername: String = ""
    @Persisted var publicRepos: Int = 0
    @Persisted var publicGits: Int = 0
    @Persisted var followers: Int = 0
    @Persisted var following: Int = 0
    @Persisted var createdAt: String = ""
    @Persisted var updatedAt: String = ""
    @Persisted var privateGist: Int = 0
    @Persisted var totalPrivateRepos: Int = 0
    @Persisted var ownedPrivateRepos: Int = 0
    @Persisted var diskUsage: Int = 0
    @Persisted var collaborators: Int = 0
    @Persisted var twoFactorAuthentication: Bool = false
    @Persisted var repos: List<RepositoryEntity> = List()
    
    override static func primaryKey() -> String? {
        return "id"
    }
}

