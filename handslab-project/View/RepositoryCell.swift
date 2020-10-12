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
        return label
    }()
    
    let repositoryNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    let containerView: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        return view
    }()
    
    let starNumLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    


    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addViews()
 
        configureViewComponents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func addViews(){
        addSubview(userImageView)
        containerView.addSubview(userNameLabel)
        containerView.addSubview(repositoryNameLabel)
        addSubview(starNumLabel)
    }
    
    
    func set(){
        userImageView.image = UIImage(named: "001")
    }
    
    
    
    func configureViewComponents() {
        
        setUserImageConstraints()
        
    }
    
    
    func setUserImageConstraints(){
        userImageView.translatesAutoresizingMaskIntoConstraints = false
        userImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        userImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        userImageView.heightAnchor.constraint(equalToConstant: 70).isActive = true
        userImageView.widthAnchor.constraint(equalTo: userImageView.heightAnchor, multiplier: 1).isActive = true
    }
    
    
//    profileImageView.centerYAnchor.constraint(equalTo:self.contentView.centerYAnchor).isActive = true
//    profileImageView.leadingAnchor.constraint(equalTo:self.contentView.leadingAnchor, constant:10).isActive = true
//    profileImageView.widthAnchor.constraint(equalToConstant:70).isActive = true profileImageView.heightAnchor.constraint(equalToConstant:70).isActive = true
}
