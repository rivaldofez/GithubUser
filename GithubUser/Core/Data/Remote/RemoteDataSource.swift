//
//  RemoteDataSource.swift
//  GithubUser
//
//  Created by Rivaldo Fernandes on 20/04/23.
//

import Foundation
import RxSwift
import Alamofire

protocol RemoteDataSourceProtocol: AnyObject {
    func getSearchUser(query: String) -> Observable<[UserResponse]>
    
    func getDetailUser(username: String) -> Observable<UserDetailResponse>
    
    func getListSearchUser(query: String) -> Observable<[UserDetailResponse]>
    
    func getListRepoUser(username: String) -> Observable<[RepositoryResponse]>
}

final class RemoteDataSource: NSObject {
    private let disposeBag = DisposeBag()
    static let sharedInstance: RemoteDataSource = RemoteDataSource()
    
}

extension RemoteDataSource: RemoteDataSourceProtocol {
    
    
    func getListSearchUser(query: String) -> RxSwift.Observable<[UserDetailResponse]> {
        return Observable<[UserDetailResponse]>.create { observer in
            self.getSearchUser(query: query).subscribe { userPageResponse in
                var userObservables: [Observable<UserDetailResponse>] = []

                for userItem in userPageResponse {
                    userObservables.append(self.getDetailUser(username: userItem.login))
                }
                
                Observable.zip(userObservables)
                    .subscribe { detailResponses in
                        observer.onNext(detailResponses)
                    } onError: { error in
                        observer.onError(URLError.invalidResponse)
                    } onCompleted: {
                        observer.onCompleted()
                    }.disposed(by: self.disposeBag)
            }.disposed(by: self.disposeBag)
            
            return Disposables.create()
        }
    }
    
    
    private func generateHeader(bearerToken: String) -> HTTPHeaders {
        return ["Authorization": "Bearer " + bearerToken]
    }
    
    private func requestGet(url: URL) -> DataRequest {
        return AF.request(url, headers: generateHeader(bearerToken: API.token))
    }
    
    func getSearchUser(query: String) -> RxSwift.Observable<[UserResponse]> {
        return Observable<[UserResponse]>.create { observer in
            if let url = URL(string: Endpoints.Gets.searchUser(query: query).url){
                self.requestGet(url: url)
                    .responseDecodable(of: UserListResponse.self) { response in
                        
                        switch (response.result) {
                        case .success(let value):
                            observer.onNext(value.items)
                            observer.onCompleted()
                            
                        case .failure:
                            observer.onError(URLError.invalidResponse)
                        }
                    }
            }
            
            return Disposables.create()
        }
    }
    
    func getListRepoUser(username: String) -> RxSwift.Observable<[RepositoryResponse]> {
        return Observable<[RepositoryResponse]>.create { observer in
            if let url = URL(string: Endpoints.Gets.reposUser(username: username).url){
                self.requestGet(url: url)
                    .responseDecodable(of: [RepositoryResponse].self) { response in
                        switch (response.result) {
                        case .success(let value) :
                            observer.onNext(value)
                            observer.onCompleted()
                        case .failure:
                            observer.onError(URLError.invalidResponse)
                        }
                    }
            }
            return Disposables.create()
        }
    }
    
    func getDetailUser(username: String) -> RxSwift.Observable<UserDetailResponse> {
        return Observable<UserDetailResponse>.create { observer in
            if let url = URL(string: Endpoints.Gets.detailUser(username: username).url) {
                self.requestGet(url: url)
                    .responseDecodable(of: UserDetailResponse.self) { response in
                        
                        switch (response.result) {
                            
                        case .success(let value):
                            observer.onNext(value)
                            observer.onCompleted()
                            
                        case .failure:
                            observer.onError(URLError.invalidResponse)
                        }
                    }
            }
            return Disposables.create()
        }
    }
    
}
