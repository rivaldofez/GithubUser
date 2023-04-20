//
//  UserRepository.swift
//  GithubUser
//
//  Created by Rivaldo Fernandes on 20/04/23.
//

import Foundation
import RxSwift

protocol UserRepositoryProtocol {
    func getListSearchUser(query: String) -> Observable<[User]>
}

final class UserRepository: NSObject {
    typealias UserInstance = (LocaleDataSource, RemoteDataSource) -> UserRepository
    
    fileprivate let remote: RemoteDataSource
    fileprivate let locale: LocaleDataSource
    
    private init(locale: LocaleDataSource, remote: RemoteDataSource){
        self.locale = locale
        self.remote = remote
    }
    
    static let sharedInstance: UserInstance = { localeSource, remoteSource in
        return UserRepository(locale: localeSource, remote: remoteSource)
    }
}

extension UserRepository: UserRepositoryProtocol {
    func getListSearchUser(query: String) -> RxSwift.Observable<[User]> {
        return self.locale.getListSearchUser(query: query).map { UserMapper.mapUserDetailEntitiesToDomain(input: $0) }
            .filter { !$0.isEmpty }
            .ifEmpty(switchTo: self.remote.getListSearchUser(query: query)
                .map { UserMapper.mapUserDetailResponseToEntities(input: $0) }
                .flatMap {
                    let searchData = SearchDataEntity()
                    searchData.query = query
                    searchData.users = $0
                    
                    return self.locale.addSearchUserData(from: searchData) }
                .filter { $0 }
                .flatMap { _ in self.locale.getListSearchUser(query: query)
                        .map { UserMapper.mapUserDetailEntitiesToDomain(input: $0) }
                }
            )
    }
}

