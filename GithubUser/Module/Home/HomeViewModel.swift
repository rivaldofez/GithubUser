//
//  HomeViewModel.swift
//  GithubUser
//
//  Created by Rivaldo Fernandes on 21/04/23.
//

import Foundation
import RxSwift

protocol HomeViewModelProtocol {
    
    var view: HomeViewProtocol? { get set }
    var query: String { get set }
    var isLoading: Bool { get set }
    
    func getListSearchUser(query: String)
}

class HomeViewModel: HomeViewModelProtocol {
    var isLoading: Bool = false {
        didSet {
            view?.isLoading(with: isLoading)
        }
    }
    
    var query: String = "" {
        didSet {
            getListSearchUser(query: query)
        }
    }
    
    var view: HomeViewProtocol?
    private let disposeBag = DisposeBag()
    private let repository: UserRepositoryProtocol
    
    required init(repository: UserRepositoryProtocol) {
        self.repository = repository
    }
    
    func getListSearchUser(query: String){
        isLoading = true
        
        repository.getListSearchUser(query: query)
            .observe(on: MainScheduler.instance)
            .subscribe{ [weak self] userResult in
                self?.view?.updateSearchUserList(with: userResult)
            } onError: { error in
                self.view?.updateSearchUserList(with: error.localizedDescription)
            } onCompleted: {
                self.isLoading = false
            }.disposed(by: disposeBag)
    }
}
