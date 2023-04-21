//
//  DetailUserVIewModel.swift
//  GithubUser
//
//  Created by Rivaldo Fernandes on 21/04/23.
//

import Foundation
import RxSwift


protocol DetailUserViewModelProtocol {
    var view: DetailUserViewProtocol? { get set }
    var username: String { get set }
    var isLoading: Bool { get set }
    var user: User? { get set }
    
    func getListRepo(username: String)
    
}

class DetailUserViewModel: DetailUserViewModelProtocol {
    var user: User? {
        didSet {
            if let user = user {
                self.view?.configure(with: user)
                self.getListRepo(username: user.login)
            }
        }
    }
    
    var view: DetailUserViewProtocol?
    
    var username: String = ""
    
   
    
    var isLoading: Bool = false
    
    private let disposeBag = DisposeBag()
    private let repository: UserRepositoryProtocol
    
    required init(repository: UserRepositoryProtocol) {
        self.repository = repository
    }
    
    func getListRepo(username: String) {
        isLoading = true
        
        repository.getListRepoUser(username: username).observe(on: MainScheduler.instance).subscribe { [weak self] repoResult in
            self?.view?.updateListRepo(with: repoResult)
            
        } onError: { error in
            self.view?.updateListRepo(with: error.localizedDescription)
        } onCompleted: {
            self.isLoading = false
        }.disposed(by: disposeBag)
    }
}
