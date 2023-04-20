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
    
    func getFollowingUser(username: String) -> Observable<[UserResponse]>
    
    func getFollowerUser(username: String) -> Observable<[UserResponse]>
}

final class RemoteDataSource: NSObject {
    static let sharedInstance: RemoteDataSource = RemoteDataSource()
}

extension RemoteDataSource: RemoteDataSourceProtocol {
    
    
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
    
    func getFollowingUser(username: String) -> RxSwift.Observable<[UserResponse]> {
        return Observable<[UserResponse]>.create { observer in
            if let url = URL(string: Endpoints.Gets.following(username: username).url){
                self.requestGet(url: url)
                    .responseDecodable(of: [UserResponse].self) { response in

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
    
    func getFollowerUser(username: String) -> RxSwift.Observable<[UserResponse]> {
        return Observable<[UserResponse]>.create { observer in
            if let url = URL(string: Endpoints.Gets.follower(username: username).url){
                self.requestGet(url: url)
                    .responseDecodable(of: [UserResponse].self) { response in
                        
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