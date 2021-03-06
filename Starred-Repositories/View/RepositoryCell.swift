//
//  RepositoryCell.swift
//  handslab-project
//
//  Created by Yuya Harada on 2020/10/12.
//  Copyright © 2020 Yuya Harada. All rights reserved.
//

import UIKit

class RepositoryCell: UITableViewCell {
    
    //MARK: - Properties
    
    let userImageView: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFit
        img.clipsToBounds = true
        return img
    }()
    
    let containerView: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        return view
    }()
    
    let userNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    let repositoryNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    let starNumLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    

    
    //MARK: - Init

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
                
        addSubview(userImageView)
        containerView.addSubview(userNameLabel)
        containerView.addSubview(repositoryNameLabel)
        addSubview(containerView)
        addSubview(starNumLabel)
 
        configureViewConstraints()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - Helper functions
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        userImageView.layer.cornerRadius = userImageView.frame.height / 2
    }
    
    
    func configureCellView(repository: Repository) {
        userImageView.setUserImage(imageUrl: repository.userImageUrl)
        userNameLabel.text = repository.userName
        repositoryNameLabel.text = repository.repositoryName
        starNumLabel.text = "⭐️\(String(describing: repository.starNum))"
    }
    
    
    //MARK: - Constraints
    
    
    func configureViewConstraints() {
        setUserImageConstraints()
        setContainerViewConstraints()
        setUserNameLabelConstraints()
        setRepositoryNameLabel()
        setStarNumLabel()
    }
    
    
    func setUserImageConstraints() {
        userImageView.translatesAutoresizingMaskIntoConstraints = false
        userImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        userImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        userImageView.heightAnchor.constraint(equalToConstant: 70).isActive = true
        userImageView.widthAnchor.constraint(equalTo: userImageView.heightAnchor, multiplier: 1).isActive = true
    }
    
    
    func setContainerViewConstraints() {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        containerView.topAnchor.constraint(equalTo: topAnchor, constant: 15).isActive = true
        containerView.leadingAnchor.constraint(equalTo: userImageView.trailingAnchor, constant: 10).isActive = true
        containerView.trailingAnchor.constraint(equalTo: starNumLabel.leadingAnchor, constant: -10).isActive = true
    }

    
    func setUserNameLabelConstraints() {
        userNameLabel.translatesAutoresizingMaskIntoConstraints = false
        userNameLabel.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        userNameLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        userNameLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
    }

    
    func setRepositoryNameLabel() {
        repositoryNameLabel.translatesAutoresizingMaskIntoConstraints = false
        repositoryNameLabel.topAnchor.constraint(equalTo: userNameLabel.bottomAnchor).isActive = true
        repositoryNameLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        repositoryNameLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
    }
    
    
    func setStarNumLabel() {
        starNumLabel.translatesAutoresizingMaskIntoConstraints = false
        starNumLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        starNumLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        starNumLabel.widthAnchor.constraint(equalToConstant: 70).isActive = true
    }

    
    
}
