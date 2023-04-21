//
//  UserMapper.swift
//  GithubUser
//
//  Created by Rivaldo Fernandes on 20/04/23.
//

import Foundation
import RealmSwift

final class UserMapper {
    
    static func mapRepositoryResponseToEntities (
        input repositoryResponses: [RepositoryResponse]
    ) -> List<RepositoryItemEntity> {
        let repositories = List<RepositoryItemEntity>()
        repositories.append(objectsIn: repositoryResponses.map { source in
            let newRepoEntity = RepositoryItemEntity()
            newRepoEntity.id = source.id ?? 0
            newRepoEntity.name = source.name ?? ""
            newRepoEntity.desc = source.description ?? ""
            newRepoEntity.fullName = source.fullName ?? ""
            newRepoEntity.nodeID = source.nodeID ?? ""
            newRepoEntity.stargazersCount = source.stargazersCount ?? 0
            newRepoEntity.watchersCount = source.watchersCount ?? 0
            newRepoEntity.forksCount = source.forksCount ?? 0
            newRepoEntity.updatedAt = source.updatedAt ?? ""
            
            return newRepoEntity
        })
        
        return repositories
    }
    

    
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
    

    static func mapRepositoryEntitiesToDomain(
        input repositoryEntities: List<RepositoryItemEntity>
    ) -> [Repository] {
        return repositoryEntities.map { source in
            return Repository(id: source.id, nodeID: source.nodeID, name: source.name, fullName: source.fullName, desc: source.desc, stargazersCount: source.stargazersCount, watchersCount: source.watchersCount, forksCount: source.forksCount, updatedAt: source.updatedAt)
        }
    }

    
    static func mapUserDetailEntitiesToDomain(
        input userEntities: List<UserDetailEntity>
    ) -> [User] {
        return userEntities.map { source in
            return User(
                login: source.login,
                id: source.id,
                nodeID: source.nodeID,
                avatarURL: source.avatarURL,
                gravatarID: source.gravatarID,
                url: source.url,
                htmlURL: source.htmlURL,
                followersURL: source.followersURL,
                followingURL: source.followingURL,
                gistsURL: source.gistsURL,
                starredURL: source.starredURL,
                subscriptionURL: source.subscriptionURL,
                organizationURL: source.organizationURL,
                reposURL: source.reposURL,
                eventsURL: source.eventsURL,
                receivedURL: source.receivedURL,
                type: source.type,
                siteAdmin: source.siteAdmin,
                name: source.name,
                company: source.company,
                location: source.location,
                email: source.email,
                bio: source.bio,
                twitterUsername: source.twitterUsername,
                publicRepos: source.publicRepos,
                publicGits: source.publicGits,
                followers: source.followers,
                following: source.following,
                createdAt: source.createdAt,
                updatedAt: source.updatedAt,
                privateGist: source.privateGist,
                totalPrivateRepos: source.totalPrivateRepos,
                ownedPrivateRepos: source.ownedPrivateRepos,
                diskUsage: source.diskUsage,
                collaborators: source.collaborators,
                twoFactorAuthentication: source.twoFactorAuthentication)
        }
    }
}
