//
//  UserEntity.swift
//  GithubUser
//
//  Created by Rivaldo Fernandes on 20/04/23.
//

import Foundation
import RealmSwift

class UserEntity: Object {
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
    @objc dynamic var score: Int = 0
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
