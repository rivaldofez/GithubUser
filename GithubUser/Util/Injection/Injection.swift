//
//  Injection.swift
//  GithubUser
//
//  Created by Rivaldo Fernandes on 21/04/23.
//

import Foundation
import RealmSwift

final class Injection: NSObject {
    private func provideRepository() -> UserRepositoryProtocol {
      let realm = try? Realm()

      let locale: LocaleDataSource = LocaleDataSource.sharedInstance(realm)
      let remote: RemoteDataSource = RemoteDataSource.sharedInstance

      return UserRepository.sharedInstance(locale, remote)
    }
    
    func provideHomeViewModel() -> HomeViewModel {
        let repository = provideRepository()
        return HomeViewModel(repository: repository)
    }
}
