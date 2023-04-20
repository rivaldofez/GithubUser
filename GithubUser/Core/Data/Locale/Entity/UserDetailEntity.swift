//
//  UserDetailEntity.swift
//  GithubUser
//
//  Created by Rivaldo Fernandes on 20/04/23.
//

import Foundation
import RealmSwift

class UserDetailEntity: Object {
    @objc dynamic var login: String = ""
    @objc dynamic var id: Int = 0
    @objc dynamic var nodeID: String = ""
    @objc dynamic var avatarURL: String = ""
    @objc dynamic var gravatarID: String = ""
    @objc dynamic var url: String = ""
    @objc dynamic var htmlURL: String = ""
    @objc dynamic var followersURL: String = ""
    @objc dynamic var followingURL: String = ""
    @objc dynamic var gistsURL: String = ""
    @objc dynamic var starredURL: String = ""
    @objc dynamic var subscriptionURL: String = ""
    @objc dynamic var organizationURL: String = ""
    @objc dynamic var reposURL: String = ""
    @objc dynamic var eventsURL: String = ""
    @objc dynamic var receivedURL: String = ""
    @objc dynamic var type: String = ""
    @objc dynamic var siteAdmin: String = ""
    @objc dynamic var name: String = ""
    @objc dynamic var company: String = ""
    @objc dynamic var location: String = ""
    @objc dynamic var email: String = ""
    @objc dynamic var hireable: String = ""
    @objc dynamic var bio: String = ""
    @objc dynamic var twitterUsername: String = ""
    @objc dynamic var publicRepos: Int = 0
    @objc dynamic var publicGits: Int = 0
    @objc dynamic var followers: Int = 0
    @objc dynamic var following: Int = 0
    @objc dynamic var createdAt: Date? = nil
    @objc dynamic var updatedAt: Date? = nil
    @objc dynamic var privateGist: Int = 0
    @objc dynamic var totalPrivateRepos: Int = 0
    @objc dynamic var ownedPrivateRepos: Int = 0
    @objc dynamic var diskUsage: Int = 0
    @objc dynamic var collaborators: Int = 0
    @objc dynamic var twoFactorAuthentication: Bool = false
    
    override static func primaryKey() -> String? {
        return "id"
    }
}

