//
//  DetailUserViewController.swift
//  GithubUser
//
//  Created by Rivaldo Fernandes on 21/04/23.
//

import UIKit

protocol DetailUserViewProtocol {
    var viewModel: DetailUserViewModelProtocol? { get set }
    
    func updateListRepo(with repos: [Repository])
    func updateListRepo(with error: String)
    func isLoading(with state: Bool)
}

class DetailUserViewController: UIViewController, DetailUserViewProtocol {
    var viewModel: DetailUserViewModelProtocol?
    
    func updateListRepo(with repos: [Repository]) {
        print(repos)
    }
    
    func updateListRepo(with error: String) {
        print(error)
    }
    
    func isLoading(with state: Bool) {
        print(state)
    }
    
    
    private let userAvatarImageView: UIImageView = {
        let imageview = UIImageView()
        imageview.translatesAutoresizingMaskIntoConstraints = false
        imageview.image = UIImage(systemName: "person")
        
        imageview.layer.masksToBounds = false
        imageview.layer.cornerRadius = 20
        imageview.clipsToBounds = true
        
        return imageview
    }()
    
    private let repositoryTableView: UITableView = {
        let tableview = UITableView()
        tableview.translatesAutoresizingMaskIntoConstraints = false
        tableview.register(RepositoryTableViewCell.self, forCellReuseIdentifier: RepositoryTableViewCell.identifier)
        
        return tableview
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Rivaldo Fernandes"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textColor = .label
        
        return label
    }()
    
    private let usernameLabel: UILabel = {
        let label = UILabel()
        label.text = "rivaldofez"
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let bioLabel: UILabel = {
        let label = UILabel()
        label.text = "Lorem ipsum dolor sit amet "
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let regionLabel: UILabel = {
       let label = UILabel()
        label.text = "Bandar Lampung, Indonesia"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let followersLabel: UILabel = {
        let label = UILabel()
         label.text = " 180 Followers"
         label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let followingLabel: UILabel = {
        let label = UILabel()
         label.text = "200 Following"
         label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()

    
    private let emailLabel: UILabel = {
        let label = UILabel()
         label.text = "rivaldofez@gmail.com"
         label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let followersIcon: UIImageView = {
        let imageview = UIImageView()
        let config = UIImage.SymbolConfiguration(textStyle: .body)
        imageview.translatesAutoresizingMaskIntoConstraints = false
        
        imageview.image = UIImage(systemName: "person.3", withConfiguration: config)
        return imageview
    }()
    
    private let followingIcon: UIImageView = {
        let imageview = UIImageView()
        let config = UIImage.SymbolConfiguration(textStyle: .body)
        imageview.translatesAutoresizingMaskIntoConstraints = false
        
        imageview.image = UIImage(systemName: "circle.fill", withConfiguration: config)
        return imageview
    }()
    
    private let pinIcon: UIImageView = {
        let imageview = UIImageView()
        let config = UIImage.SymbolConfiguration(textStyle: .body)
        imageview.translatesAutoresizingMaskIntoConstraints = false
        
        imageview.image = UIImage(systemName: "mappin", withConfiguration: config)
        return imageview
    }()
    
    private let emailIcon: UIImageView = {
        let imageview = UIImageView()
        let config = UIImage.SymbolConfiguration(textStyle: .body)
        imageview.translatesAutoresizingMaskIntoConstraints = false
        
        imageview.image = UIImage(systemName: "envelope", withConfiguration: config)
        return imageview
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        
        view.addSubview(userAvatarImageView)
        view.addSubview(nameLabel)
        view.addSubview(usernameLabel)
        view.addSubview(bioLabel)
        view.addSubview(regionLabel)
        view.addSubview(followersIcon)
        view.addSubview(followersLabel)
        view.addSubview(followingIcon)
        view.addSubview(followingLabel)
        view.addSubview(pinIcon)
        view.addSubview(emailIcon)
        view.addSubview(emailLabel)
        view.addSubview(repositoryTableView)
        
        configureConstraints()
        
        repositoryTableView.delegate = self
        repositoryTableView.dataSource = self
        
        viewModel?.getListRepo(username: "rivaldofez")
    }
    
    
    private func configureConstraints(){
        let userAvatarImageViewConstraints = [
            userAvatarImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            userAvatarImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            userAvatarImageView.widthAnchor.constraint(equalToConstant: 70),
            userAvatarImageView.heightAnchor.constraint(equalToConstant: 70)
        ]
        
        let nameLabelConstraints = [
            nameLabel.leadingAnchor.constraint(equalTo: userAvatarImageView.trailingAnchor, constant: 16),
            nameLabel.topAnchor.constraint(equalTo: userAvatarImageView.topAnchor)
        ]
        
        let usernamelabelConstraints = [
            usernameLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            usernameLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 16),
        ]
        
        let bioLabelConstraints = [
            bioLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            bioLabel.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: 16)
            
        ]
        
        let followersIconConstraints = [
            followersIcon.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            followersIcon.topAnchor.constraint(equalTo: bioLabel.bottomAnchor, constant: 16)
        ]
        
        let followersLabelConstraints = [
            followersLabel.leadingAnchor.constraint(equalTo: followersIcon.trailingAnchor, constant: 8),
            followersLabel.topAnchor.constraint(equalTo: followersIcon.topAnchor),
            followersLabel.bottomAnchor.constraint(equalTo: followersIcon.bottomAnchor)
        ]
        
        let followingIconConstraints = [
            followingIcon.leadingAnchor.constraint(equalTo: followersLabel.trailingAnchor, constant: 16),
            followingIcon.topAnchor.constraint(equalTo: bioLabel.bottomAnchor, constant: 16)
        ]
        
        let followingLabelConstraints = [
            followingLabel.leadingAnchor.constraint(equalTo: followingIcon.trailingAnchor, constant: 8),
            followingLabel.topAnchor.constraint(equalTo: followingIcon.topAnchor),
            followingLabel.bottomAnchor.constraint(equalTo: followingIcon.bottomAnchor)
        
        ]
        
        let pinIconConstrains = [
            pinIcon.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            pinIcon.topAnchor.constraint(equalTo: followersIcon.bottomAnchor, constant: 16)
        ]
        
        let locationLabelConstrains = [
            regionLabel.leadingAnchor.constraint(equalTo: pinIcon.trailingAnchor, constant: 8),
            regionLabel.topAnchor.constraint(equalTo: pinIcon.topAnchor),
            regionLabel.bottomAnchor.constraint(equalTo: pinIcon.bottomAnchor)
        ]
        
        let emailIconConstraints = [
            emailIcon.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            emailIcon.topAnchor.constraint(equalTo: pinIcon.bottomAnchor, constant: 16)
        ]
        
        let emailLabelConstrains = [
            emailLabel.leadingAnchor.constraint(equalTo: emailIcon.trailingAnchor, constant: 8),
            emailLabel.topAnchor.constraint(equalTo: emailIcon.topAnchor),
            emailLabel.bottomAnchor.constraint(equalTo: emailIcon.bottomAnchor)
        ]
        
        let repositoryTableViewConstraints = [
            repositoryTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            repositoryTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            repositoryTableView.topAnchor.constraint(equalTo: emailIcon.bottomAnchor, constant: 16),
            repositoryTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            
        ]
        
        NSLayoutConstraint.activate(userAvatarImageViewConstraints)
        NSLayoutConstraint.activate(nameLabelConstraints)
        NSLayoutConstraint.activate(usernamelabelConstraints)
        NSLayoutConstraint.activate(bioLabelConstraints)
        NSLayoutConstraint.activate(followersIconConstraints)
        NSLayoutConstraint.activate(followersLabelConstraints)
        NSLayoutConstraint.activate(followingIconConstraints)
        NSLayoutConstraint.activate(followingLabelConstraints)
        NSLayoutConstraint.activate(pinIconConstrains)
        NSLayoutConstraint.activate(locationLabelConstrains)
        NSLayoutConstraint.activate(emailIconConstraints)
        NSLayoutConstraint.activate(emailLabelConstrains)
        NSLayoutConstraint.activate(repositoryTableViewConstraints)
    }
}

extension DetailUserViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RepositoryTableViewCell.identifier, for: indexPath) as? RepositoryTableViewCell else { return UITableViewCell()}
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    
}
