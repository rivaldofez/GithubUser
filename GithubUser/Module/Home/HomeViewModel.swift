//
//  HomeViewModel.swift
//  GithubUser
//
//  Created by Rivaldo Fernandes on 21/04/23.
//

import Foundation
import RxSwift

class HomeViewModel {
    private let repository: UserRepositoryProtocol
    
    required init(repository: UserRepositoryProtocol) {
        self.repository = repository
    }
    
    func getListSearchUser(query: String) -> Observable<[User]> {
        return repository.getListSearchUser(query: query)
    }
}
