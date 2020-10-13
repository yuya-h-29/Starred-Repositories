//
//  RepositoryCell.swift
//  handslab-project
//
//  Created by Yuya Harada on 2020/10/12.
//  Copyright © 2020 Yuya Harada. All rights reserved.
//

import UIKit

class RepositoryCell: UITableViewCell {
    
    
    let userImageView: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFit
        img.layer.cornerRadius = 35
        img.clipsToBounds = true
        img.backgroundColor = .black
        
        return img
    }()
    
    let userNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.text = "AAAAAAAA"
        label.textColor = .white
        return label
    }()
    
    let repositoryNameLabel: UILabel = {
        let label = UILabel()
//        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 14)
        label.text = "BBBBBB"
        label.textColor = .white
        return label
    }()
    
    let containerView: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.backgroundColor = .black
        return view
    }()
    
    let starNumLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemPink
        label.font = UIFont.systemFont(ofSize: 16)
        label.text = "1000"
        return label
    }()
    


    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(userImageView)
        addSubview(containerView)
        containerView.addSubview(userNameLabel)
        containerView.addSubview(repositoryNameLabel)
        addSubview(starNumLabel)
 
        configureViewComponents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func set() {
        userImageView.image = UIImage(named: "001")
//        userNameLabel.text = "AAAAAAA"
//        repositoryNameLabel.text = "BBBBBBBB"
    }
    
    
    
    func configureViewComponents() {
        
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
        userImageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        userImageView.widthAnchor.constraint(equalTo: userImageView.heightAnchor, multiplier: 1).isActive = true
    }
    
    
    func setContainerViewConstraints() {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        containerView.leadingAnchor.constraint(equalTo: userImageView.trailingAnchor, constant: 10).isActive = true
        containerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
        containerView.heightAnchor.constraint(equalToConstant: 80).isActive = true
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
    }
    
    
    func setStarNumLabel() {
        starNumLabel.translatesAutoresizingMaskIntoConstraints = false
        starNumLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        starNumLabel.leadingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: 10).isActive = true
        
    }

    
    
}
