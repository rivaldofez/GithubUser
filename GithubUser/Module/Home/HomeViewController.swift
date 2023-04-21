//
//  HomeViewController.swift
//  GithubUser
//
//  Created by Rivaldo Fernandes on 21/04/23.
//

import UIKit
import RxSwift


protocol HomeViewProtocol {
    var viewModel: HomeViewModelProtocol? { get set }
    
    func updateSearchUserList(with users: [User])
    func updateSearchUserList(with error: String)
    func isLoading(with state: Bool)
}

class HomeViewController: UIViewController, HomeViewProtocol {
    var viewModel: HomeViewModelProtocol?
    
    private var users: [User] = []
    
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
        layout.itemSize = CGSize(width: view.frame.size.width, height: 120)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(UserCollectionViewCell.self, forCellWithReuseIdentifier: UserCollectionViewCell.identifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        collectionView.layer.cornerRadius = 12
        collectionView.layer.masksToBounds = false
        collectionView.clipsToBounds = true
        collectionView.backgroundColor = .gray.withAlphaComponent(0.05)
        collectionView.showsVerticalScrollIndicator = false
        
        return collectionView
    }()
    
    private let errorMessageLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .label
        return label
    }()
    
    private let spinnerLoading: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView()
        spinner.translatesAutoresizingMaskIntoConstraints = false
        
        return spinner
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Github User"
        navigationController?.navigationBar.tintColor = .label
        view.backgroundColor = .systemBackground
        
        navigationItem.searchController = searchController
        view.addSubview(errorMessageLabel)
        view.addSubview(spinnerLoading)
        view.addSubview(userCollectionView)
        
        searchController.searchBar.delegate = self
        userCollectionView.dataSource = self
        userCollectionView.delegate = self
        
        setError(isError: true, message: "Empty data, please try with other keyword")
        
        configureConstraints()
    }
    
    func updateSearchUserList(with users: [User]) {
        if users.isEmpty {
            setError(isError: true, message: "Empty data, please try with other keyword")
        } else {
            DispatchQueue.main.async {
                self.users.removeAll()
                self.users.append(contentsOf: users)
                self.userCollectionView.reloadData()
            }
            setError(isError: false)
        }
    }
    
    func updateSearchUserList(with error: String) {
        self.users.removeAll()
        setError(isError: true, message: error)
    }
    
    func isLoading(with state: Bool) {
        spinnerLoading.isHidden = !state
        errorMessageLabel.isHidden = state
        userCollectionView.isHidden = state
        
        state ? spinnerLoading.startAnimating() : spinnerLoading.stopAnimating()
    }
    
    func setError(isError: Bool, message: String = ""){
        errorMessageLabel.isHidden = !isError
        errorMessageLabel.text = message
        
        userCollectionView.isHidden = isError
        spinnerLoading.isHidden = isError
    }
    
    
    private func configureConstraints(){
        let userCollectionViewCellConstraints = [
            userCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            userCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            userCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            userCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]
        
        let errorMessageLabelConstraints = [
            errorMessageLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            errorMessageLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            errorMessageLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            errorMessageLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]
        
        let spinnerLoadingConstraints = [
            spinnerLoading.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            spinnerLoading.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            spinnerLoading.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            spinnerLoading.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(spinnerLoadingConstraints)
        
        NSLayoutConstraint.activate(errorMessageLabelConstraints)
        
        NSLayoutConstraint.activate(userCollectionViewCellConstraints)
    }
}

extension HomeViewController: UISearchBarDelegate {
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        if let query = searchBar.text {
            viewModel?.getListSearchUser(query: query)
        }
    }
    
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return users.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UserCollectionViewCell.identifier, for: indexPath) as? UserCollectionViewCell else { return UICollectionViewCell() }
        
        cell.configure(with: users[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let user = users[indexPath.item]
        viewModel?.didSelectUser(with: user)
    }
}
