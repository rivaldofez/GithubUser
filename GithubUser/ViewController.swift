//
//  ViewController.swift
//  GithubUser
//
//  Created by Rivaldo Fernandes on 20/04/23.
//

import UIKit
import RxSwift

class ViewController: UIViewController {
    
    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .red
        
        
        RemoteDataSource.sharedInstance.getSearchUser(query: "rivaldofez").observe(on: MainScheduler.instance).subscribe { results in
            
            print(results)
            
        } onError: { error  in
            print(error.localizedDescription)
        } onCompleted: {
            print("completed")
        }.disposed(by: disposeBag)
    }


}

