//
//  ApiCall.swift
//  GithubUser
//
//  Created by Rivaldo Fernandes on 20/04/23.
//

import Foundation

struct API {
    static let baseURL = "https://api.github.com/"
    static let token = "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"
}


protocol Endpoint {
    var url: String { get }
}


enum Endpoints {
    enum Gets: Endpoint {
        case searchUser(query: String)
        case following(username: String)
        case follower(username: String)
        case detailUser(username: String)
        
        var url: String {
            switch self {
            case .detailUser(let username):
                return "\(API.baseURL)users/\(username)"
            case .searchUser(let query):
                return "\(API.baseURL)search/users?q=\(query)"
            case .follower(let username):
                return "\(API.baseURL)/users/\(username)/followers"
            case .following(let username):
                return "\(API.baseURL)/users/\(username)/following"
            }
        }
    }
}


//interface RetrofitService {
//
//    @GET("search/users")
//    fun searchUsers(
//        @Header("Authorization") token : String,
//        @Query("q") keyword: String
//    ): Call<UserList>
//
//    @GET("users/{username}")
//    fun getDetailUser(
//        @Header("Authorization") token: String,
//        @Path("username") username: String
//    ):Call<DetailUser>
//
//    @GET("users/{username}/{option}")
//    fun getFollowInfo(
//        @Header("Authorization") token: String,
//        @Path("username") username: String,
//        @Path("option") option: String
//    ):Call<List<User>>
//}
