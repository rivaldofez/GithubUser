//
//  User.swift
//  GithubUser
//
//  Created by Rivaldo Fernandes on 20/04/23.
//

import Foundation

struct User: Equatable, Identifiable {
   
     var login: String
     var id: Int
     var nodeID: String
     var avatarURL: String
     var gravatarID: String
     var url: String
     var htmlURL: String
     var followersURL: String
     var followingURL: String
     var gistsURL: String
     var starredURL: String
     var subscriptionURL: String
     var organizationURL: String
     var reposURL: String
     var eventsURL: String
     var receivedURL: String
     var type: String
     var siteAdmin: Bool
     var name: String
     var company: String
     var location: String
     var email: String
     var bio: String
     var twitterUsername: String
     var publicRepos: Int
     var publicGits: Int
     var followers: Int
     var following: Int
     var createdAt: String
     var updatedAt: String
     var privateGist: Int
     var totalPrivateRepos: Int
     var ownedPrivateRepos: Int
     var diskUsage: Int
     var collaborators: Int
     var twoFactorAuthentication: Bool
}
