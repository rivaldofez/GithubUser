//
//  UserCollectionViewCell.swift
//  GithubUser
//
//  Created by Rivaldo Fernandes on 21/04/23.
//

import UIKit
import SDWebImage

class UserCollectionViewCell: UICollectionViewCell {
    static let identifier = "UserCollectionViewCell"
    
    private let userAvatarImageView: UIImageView = {
        let imageview = UIImageView()
        imageview.translatesAutoresizingMaskIntoConstraints = false
        
        imageview.layer.masksToBounds = false
        imageview.layer.cornerRadius = 20
        imageview.clipsToBounds = true
        
        return imageview
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(userAvatarImageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(usernameLabel)
        contentView.addSubview(bioLabel)
        contentView.addSubview(regionLabel)
        configureConstraints()
        
    }
    
    func configure(with user: User){
        usernameLabel.text = user.login
        nameLabel.text = user.name
        bioLabel.text = user.bio
        regionLabel.text = user.location
        
        guard let avatarURL = URL(string: user.avatarURL) else { return }
        userAvatarImageView.sd_setImage(with: avatarURL)
    }
    
    private func configureConstraints(){
        let userAvatarConstraints = [
            userAvatarImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 32),
            userAvatarImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            userAvatarImageView.widthAnchor.constraint(equalToConstant: 40),
            userAvatarImageView.heightAnchor.constraint(equalToConstant: 40)
            
        ]
        
        let nameLabelConstraints = [
            nameLabel.leadingAnchor.constraint(equalTo: userAvatarImageView.trailingAnchor, constant: 10),
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
        ]
        
        let usernameLabelConstraints = [
            usernameLabel.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 8),
            usernameLabel.trailingAnchor.constraint(lessThanOrEqualTo: contentView.trailingAnchor, constant: -32),
            usernameLabel.topAnchor.constraint(equalTo: nameLabel.topAnchor),
            usernameLabel.bottomAnchor.constraint(equalTo: nameLabel.bottomAnchor),
        ]
        
        let bioLabelConstraints = [
            
            bioLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            bioLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 12),
            bioLabel.trailingAnchor.constraint(lessThanOrEqualTo: contentView.trailingAnchor, constant: -32)
        ]
        
        let regionLabelConstraints = [
            regionLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            regionLabel.topAnchor.constraint(equalTo: bioLabel.bottomAnchor, constant: 12),
            regionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
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
