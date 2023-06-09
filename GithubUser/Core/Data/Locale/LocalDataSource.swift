//
//  LocalDataSource.swift
//  GithubUser
//
//  Created by Rivaldo Fernandes on 20/04/23.
//

import Foundation
import RealmSwift
import RxSwift

protocol LocaleDataSourceProtocol: AnyObject {
    func getListSearchUser(query: String) -> Observable<List<UserDetailEntity>>
    func addSearchUserData(from searchData: SearchDataEntity) ->  Observable<Bool>
    func getListRepository(username: String) -> Observable<List<RepositoryItemEntity>>
    func addReposUserData(from repoData: RepositoryDataEntity) -> Observable<Bool>
    
}

final class LocaleDataSource: NSObject {
    private let realm: Realm?
    
    private init(realm: Realm?) {
        self.realm = realm
    }
    
    static let sharedInstance: (Realm?) -> LocaleDataSource = { realmDatabase in
        return LocaleDataSource(realm: realmDatabase)
    }
}

extension LocaleDataSource: LocaleDataSourceProtocol {
    func getListSearchUser(query: String) -> RxSwift.Observable<RealmSwift.List<UserDetailEntity>> {
        
        
        return Observable<List<UserDetailEntity>>.create { observer in
            if let realm = self.realm {
                
                let searchDataUsers: Results<SearchDataEntity> = {
                    realm.objects(SearchDataEntity.self)
                        .where { $0.query == query }
                }()
                observer.onNext(searchDataUsers.toArray(ofType: SearchDataEntity.self).first?.users ?? List())
                observer.onCompleted()
            } else {
                observer.onError(DatabaseError.invalidInstance)
            }
            
            return Disposables.create()
        }
        
    }
    
    func getListRepository(username: String) -> RxSwift.Observable<RealmSwift.List<RepositoryItemEntity>> {
        
        return Observable<List<RepositoryItemEntity>>.create { observer in
            if let realm = self.realm {
                let repoDataUser: Results<RepositoryDataEntity> = {
                    realm.objects(RepositoryDataEntity.self)
                        .where { $0.username == username }
                }()
                
                observer.onNext(repoDataUser.toArray(ofType: RepositoryDataEntity.self).first?.repos ?? List())
                observer.onCompleted()
            } else {
                observer.onError(DatabaseError.invalidInstance)
            }
            return Disposables.create()
        }
    }
    
    func addSearchUserData(from searchData: SearchDataEntity) -> RxSwift.Observable<Bool> {
        return Observable<Bool>.create { observer in
            if let realm = self.realm {
                do {
                    try realm.write {
                        realm.add(searchData, update: .all)
                    }
                    observer.onNext(true)
                    observer.onCompleted()
                } catch {
                    observer.onError(DatabaseError.requestFailed)
                }
            } else {
                observer.onError(DatabaseError.invalidInstance)
            }
            
            return Disposables.create()
        }
    }
    
    func addReposUserData(from repoData: RepositoryDataEntity) -> RxSwift.Observable<Bool> {
        return Observable<Bool>.create { observer in
            if let realm = self.realm {
                do {
                    try realm.write {
                        realm.add(repoData, update: .all)
                    }
                    
                    observer.onNext(true)
                    observer.onCompleted()
                } catch {
                    observer.onError(DatabaseError.requestFailed)
                }
            } else {
                observer.onError(DatabaseError.invalidInstance)
            }
            return Disposables.create()
        }
    }
}

extension Results {
    
    func toArray<T>(ofType: T.Type) -> [T] {
        var array = [T]()
        for index in 0 ..< count {
            if let result = self[index] as? T {
                array.append(result)
            }
        }
        return array
    }
    
}
