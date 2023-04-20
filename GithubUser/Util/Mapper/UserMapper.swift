//
//  UserMapper.swift
//  GithubUser
//
//  Created by Rivaldo Fernandes on 20/04/23.
//

import Foundation
import RealmSwift

final class UserMapper {
    
    static func mapUserDetailResponseToEntities(
    
        input userDetailResponses: [UserDetailResponse]
    ) -> List<UserDetailEntity> {
        let users = List<UserDetailEntity>()
        users.append(objectsIn: userDetailResponses.map { source in
            let newUserEntity = UserDetailEntity()
            newUserEntity.login = source.login ?? ""
            newUserEntity.id = source.id ?? 0
            newUserEntity.nodeID = source.nodeID ?? ""
            newUserEntity.avatarURL = source.avatarURL ?? ""
            newUserEntity.gravatarID = source.gravatarID ?? ""
            newUserEntity.url = source.url ?? ""
            newUserEntity.htmlURL = source.htmlURL ?? ""
            newUserEntity.followersURL = source.followersURL ?? ""
            newUserEntity.followingURL = source.followingURL ?? ""
            newUserEntity.gistsURL = source.gistsURL ?? ""
            newUserEntity.starredURL = source.starredURL ?? ""
            newUserEntity.subscriptionURL = source.subscriptionsURL ?? ""
            newUserEntity.organizationURL = source.organizationsURL ?? ""
            newUserEntity.reposURL = source.reposURL ?? ""
            newUserEntity.eventsURL = source.eventsURL ?? ""
            newUserEntity.receivedURL = source.receivedEventsURL ?? ""
            newUserEntity.type = source.type ?? ""
            newUserEntity.siteAdmin = source.siteAdmin ?? false
            newUserEntity.name = source.name  ?? ""
            newUserEntity.company = source.company  ?? ""
            newUserEntity.location = source.location  ?? ""
            newUserEntity.email = source.email ?? ""
            newUserEntity.bio = source.bio  ?? ""
            newUserEntity.twitterUsername = source.twitterUsername ?? ""
            newUserEntity.publicRepos = source.publicRepos ?? 0
            newUserEntity.publicGits = source.publicGists ?? 0
            newUserEntity.followers = source.followers ?? 0
            newUserEntity.following = source.following ?? 0
            newUserEntity.createdAt = source.createdAt
            newUserEntity.updatedAt = source.updatedAt
            newUserEntity.privateGist = source.privateGists ?? 0
            newUserEntity.totalPrivateRepos = source.totalPrivateRepos ?? 0
            newUserEntity.ownedPrivateRepos = source.ownedPrivateRepos ?? 0
            newUserEntity.diskUsage = source.diskUsage ?? 0
            newUserEntity.collaborators = source.collaborators ?? 0
            newUserEntity.twoFactorAuthentication = source.twoFactorAuthentication  ?? false
        
            return newUserEntity
        })
        return users
    }
    
    
    static func mapUserResponseToEntities(
        input userResponses: [UserResponse]
    ) -> List<UserEntity> {
        let users = List<UserEntity>()
        users.append(objectsIn: userResponses.map { source in
            let newUserEntity = UserEntity()
            newUserEntity.login = source.login
            newUserEntity.id = source.id
            newUserEntity.nodeID = source.nodeID
            newUserEntity.avatarURL = source.avatarURL
            newUserEntity.gravatarID = source.gravatarID
            newUserEntity.url = source.url
            newUserEntity.htmlURL = source.htmlURL
            newUserEntity.followersURL = source.followersURL
            newUserEntity.followingURL = source.followingURL
            newUserEntity.gistsURL = source.gistsURL
            newUserEntity.starredURL = source.starredURL
            newUserEntity.subscriptionURL = source.subscriptionsURL
            newUserEntity.organizationURL = source.organizationsURL
            newUserEntity.reposURL = source.reposURL
            newUserEntity.eventsURL = source.eventsURL
            newUserEntity.receivedURL = source.receivedEventsURL
            newUserEntity.type = source.type
            newUserEntity.siteAdmin = source.siteAdmin
            newUserEntity.score = source.score ?? 0
            
            return newUserEntity
            
        })
        return users
        
    }
    
    static func mapUserEntitiesToDomain(
        input userEntities: List<UserEntity>
    ) -> [User] {
        return userEntities.map { source in
            return User(id: source.id, login: source.login)
        }
    }
    
    static func mapUserDetailEntitiesToDomain(
        input userEntities: List<UserDetailEntity>
    ) -> [User] {
        return userEntities.map { source in
            return User(id: source.id, login: source.login)
        }
    }
}
