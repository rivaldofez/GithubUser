//
//  HomeViewController.swift
//  GithubUser
//
//  Created by Rivaldo Fernandes on 21/04/23.
//

import UIKit
import RxSwift

class HomeViewController: UIViewController {
    
    private var viewModel: HomeViewModel = Injection.init().provideHomeViewModel()
    private let disposeBag = DisposeBag()

    private let searchController: UISearchController = {
        let searchController = UISearchController()
        searchController.hidesNavigationBarDuringPresentation = true
        searchController.searchBar.showsScopeBar = true
        searchController.automaticallyShowsCancelButton = true
        searchController.navigationItem.hidesSearchBarWhenScrolling = false
        searchController.ignoresSearchSuggestionsForSearchBarPlacementStacked = true
        
        return searchController
    }()
    
    
    private lazy var userCollectionView: UICollectionView = {
      
        let layout = UICollectionViewFlowLayout()
        
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: view.frame.size.width, height: 150)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(UserCollectionViewCell.self, forCellWithReuseIdentifier: UserCollectionViewCell.identifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        return collectionView
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Github User"
        navigationController?.navigationBar.tintColor = .label
        view.backgroundColor = .systemBackground
        
        navigationItem.searchController = searchController
        view.addSubview(userCollectionView)
        
        searchController.searchBar.delegate = self
        userCollectionView.dataSource = self
        userCollectionView.delegate = self
        
        
        configureConstraints()
        
        
        viewModel.getListSearchUser(query: "rivaldo")
            .observe(on: MainScheduler.instance).subscribe { results in
                print(results)
            } onError: { error  in
                print(error.localizedDescription)
            } onCompleted: {
                print("completed")
            }.disposed(by: disposeBag)
    }
    
    private func configureConstraints(){
        let userCollectionViewCellConstraints = [
            userCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            userCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            userCollectionView.topAnchor.constraint(equalTo: view.topAnchor),
            userCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(userCollectionViewCellConstraints)
    }
}

extension HomeViewController: UISearchBarDelegate {
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        print("did end")
    }
    
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UserCollectionViewCell.identifier, for: indexPath) as? UserCollectionViewCell else { return UICollectionViewCell() }
        
        return cell
    }
    
    
}
