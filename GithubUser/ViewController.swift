//
//  ViewController.swift
//  GithubUser
//
//  Created by Rivaldo Fernandes on 20/04/23.
//

import UIKit
import RxSwift
import RealmSwift

class ViewController: UIViewController {
    
    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .red
        
        
        let realm = try? Realm()
        
        let locale : LocaleDataSource = LocaleDataSource.sharedInstance(realm)
        let remote : RemoteDataSource = RemoteDataSource.sharedInstance
        
        let repo = UserRepository.sharedInstance(locale, remote)
        
        
        repo.getSearchUser(query: "rivaldo")
            .observe(on: MainScheduler.instance).subscribe { results in
                print(results)
            } onError: { error  in
                print(error.localizedDescription)
            } onCompleted: {
                print("completed")
            }.disposed(by: disposeBag)
        
        
        
//        RemoteDataSource.sharedInstance.getFollowerUser(username: "rivaldofez").observe(on: MainScheduler.instance).subscribe { results in
//
//            print(results)
//
//        } onError: { error  in
//            print(error.localizedDescription)
//        } onCompleted: {
//            print("completed")
//        }.disposed(by: disposeBag)
    }


}

