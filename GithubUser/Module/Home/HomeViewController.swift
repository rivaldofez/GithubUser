//
//  HomeViewController.swift
//  GithubUser
//
//  Created by Rivaldo Fernandes on 21/04/23.
//

import UIKit

class HomeViewController: UIViewController {

    private let searchController: UISearchController = {
        let searchController = UISearchController()
        searchController.hidesNavigationBarDuringPresentation = true
        searchController.searchBar.showsScopeBar = true
        searchController.automaticallyShowsCancelButton = true
        searchController.navigationItem.hidesSearchBarWhenScrolling = false
        searchController.ignoresSearchSuggestionsForSearchBarPlacementStacked = true
        
        
        return searchController
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Github User"
        navigationController?.navigationBar.tintColor = .label
        view.backgroundColor = .systemBackground
        
        navigationItem.searchController = searchController
        searchController.searchBar.delegate = self
    }
}

extension HomeViewController: UISearchBarDelegate {
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        print("did end")
    }
    
}
