//
//  UserCollectionViewCell.swift
//  GithubUser
//
//  Created by Rivaldo Fernandes on 21/04/23.
//

import UIKit

class UserCollectionViewCell: UICollectionViewCell {
    static let identifier = "UserCollectionViewCell"
    
    private let userAvatar: UIImageView = {
        let imageview = UIImageView()
        imageview.translatesAutoresizingMaskIntoConstraints = false
        
        return imageview
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Rivaldo Fernandes"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let usernameLabel: UILabel = {
        let label = UILabel()
        label.text = "rivaldofez"
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        contentView.addSubview(userAvatar)
        contentView.addSubview(nameLabel)
        contentView.addSubview(usernameLabel)
        contentView.addSubview(bioLabel)
        contentView.addSubview(regionLabel)
        
        configureConstraints()
        
    }
    
    private func configureConstraints(){
        let userAvatarConstraints = [
            userAvatar.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            userAvatar.topAnchor.constraint(equalTo: contentView.topAnchor),
            userAvatar.widthAnchor.constraint(equalToConstant: 60),
            userAvatar.heightAnchor.constraint(equalToConstant: 60)
        
        ]
        
        let nameLabelConstraints = [
            nameLabel.leadingAnchor.constraint(equalTo: userAvatar.trailingAnchor),
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
        ]
        
        let usernameLabelConstraints = [
            usernameLabel.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
            usernameLabel.topAnchor.constraint(equalTo: contentView.topAnchor)
        ]
        
        let bioLabelConstraints = [
        
            bioLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            bioLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor),
            bioLabel.trailingAnchor.constraint(lessThanOrEqualTo: contentView.trailingAnchor)
        ]
        
        let regionLabelConstraints = [
            regionLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            regionLabel.topAnchor.constraint(equalTo: bioLabel.bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(userAvatarConstraints)
        NSLayoutConstraint.activate(nameLabelConstraints)
        NSLayoutConstraint.activate(usernameLabelConstraints)
        NSLayoutConstraint.activate(bioLabelConstraints)
        NSLayoutConstraint.activate(regionLabelConstraints)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
