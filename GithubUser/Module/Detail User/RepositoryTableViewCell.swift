//
//  RepositoryTableViewCell.swift
//  GithubUser
//
//  Created by Rivaldo Fernandes on 21/04/23.
//

import UIKit

class RepositoryTableViewCell: UITableViewCell {
    
    static let identifier = "RepositoryTableViewCell"

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
    
    private let bioLabel: UILabel = {
        let label = UILabel()
        label.text = "Lorem ipsum dolor sit amet "
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let starLabel: UILabel = {
        let label = UILabel()
         label.text = "20"
         label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let lastUpdatedLabel: UILabel = {
        let label = UILabel()
         label.text = "Updated 2 months ago"
         label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let starIcon: UIImageView = {
        let imageview = UIImageView()
        let config = UIImage.SymbolConfiguration(textStyle: .body)
        imageview.translatesAutoresizingMaskIntoConstraints = false
        
        imageview.image = UIImage(systemName: "star.fill", withConfiguration: config)
        return imageview
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(userAvatarImageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(bioLabel)
        contentView.addSubview(starIcon)
        contentView.addSubview(starLabel)
        contentView.addSubview(lastUpdatedLabel)
        
        configureConstraints()
    }
    
    func configure(with repo: Repository, avaURL: String){
        nameLabel.text = repo.name.isEmpty ? "-" : repo.name
        bioLabel.text = repo.desc.isEmpty ? "-" : repo.desc
        starLabel.text = "\(repo.stargazersCount)"
        
        guard let avatarURL = URL(string: avaURL) else { return }
        userAvatarImageView.sd_setImage(with: avatarURL)
    }
    
    private func configureConstraints(){
        let userAvatarImageViewConstraints = [
            userAvatarImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            userAvatarImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            userAvatarImageView.widthAnchor.constraint(equalToConstant: 40),
            userAvatarImageView.heightAnchor.constraint(equalToConstant: 40)
        ]
        
        let nameLabelConstraints = [
            nameLabel.leadingAnchor.constraint(equalTo: userAvatarImageView.trailingAnchor, constant: 16),
            nameLabel.trailingAnchor.constraint(lessThanOrEqualTo: contentView.trailingAnchor, constant: -16),
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8)
        ]
        
        let bioLabelConstraints = [
            bioLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            bioLabel.trailingAnchor.constraint(lessThanOrEqualTo: contentView.trailingAnchor, constant: -16),
            bioLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
        ]
        
        let starIconConstraints = [
            starIcon.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            starIcon.topAnchor.constraint(equalTo: bioLabel.bottomAnchor, constant: 16),
            starIcon.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
        ]
        
        let starLabelConstraints = [
            starLabel.leadingAnchor.constraint(equalTo: starIcon.trailingAnchor, constant: 4),
            starLabel.topAnchor.constraint(equalTo: starIcon.topAnchor),
            starLabel.bottomAnchor.constraint(equalTo: starIcon.bottomAnchor)
        ]
        
        let lastUpdatedLabelConstraints = [
            lastUpdatedLabel.leadingAnchor.constraint(equalTo: starLabel.trailingAnchor, constant: 16),
            lastUpdatedLabel.topAnchor.constraint(equalTo: starIcon.topAnchor),
            lastUpdatedLabel.bottomAnchor.constraint(equalTo: starIcon.bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(userAvatarImageViewConstraints)
        NSLayoutConstraint.activate(nameLabelConstraints)
        NSLayoutConstraint.activate(bioLabelConstraints)
        NSLayoutConstraint.activate(starIconConstraints)
        NSLayoutConstraint.activate(starLabelConstraints)
        NSLayoutConstraint.activate(lastUpdatedLabelConstraints)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
