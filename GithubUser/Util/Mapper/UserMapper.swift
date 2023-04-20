//
//  UserMapper.swift
//  GithubUser
//
//  Created by Rivaldo Fernandes on 20/04/23.
//

import Foundation
import RealmSwift

final class UserMapper {
    static func mapUserResponseToEntities(
        input userResponses: [UserResponse]
    ) -> [UserEntity] {
        return userResponses.map { source in
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
            
        }
    }
    
    static func mapUserEntitiesToDomain(
        input userEntities: List<UserEntity>
    ) -> [User] {
        return userEntities.map { source in
            return User(id: source.id, login: source.login)
        }
    }
}
