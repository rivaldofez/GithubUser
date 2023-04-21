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
        
        print("called 1")
        
        return Observable<List<UserDetailEntity>>.create { observer in
            if let realm = self.realm {
                print("called 2")
                
                let searchDataUsers: Results<SearchDataEntity> = {
                    realm.objects(SearchDataEntity.self)
                        .where { $0.query == query }
                }()
                print("called 3")
                
                
                observer.onNext(searchDataUsers.toArray(ofType: SearchDataEntity.self).first?.users ?? List())
                observer.onCompleted()
                
                print("called 4")
                
            } else {
                observer.onError(DatabaseError.invalidInstance)
                print("called 5")
                
            }
            
            return Disposables.create()
        }
        
    }
    
//    func getSearchUser(query: String) -> RxSwift.Observable<List<UserEntity>> {
//        return Observable<List<UserEntity>>.create { observer in
//            if let realm = self.realm {
//                let searchDataUsers: Results<SearchDataEntity> = {
//                    realm.objects(SearchDataEntity.self)
//                        .where {
//                            $0.query == query
//                        }
//
//                }()
//                observer.onNext(searchDataUsers.toArray(ofType: SearchDataEntity.self).first?.users ?? List())
//                observer.onCompleted()
//            } else {
//                observer.onError(DatabaseError.invalidInstance)
//            }
//
//            return Disposables.create()
//        }
//    }
    
    func addSearchUserData(from searchData: SearchDataEntity) -> RxSwift.Observable<Bool> {
        
        print("added")
        
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
