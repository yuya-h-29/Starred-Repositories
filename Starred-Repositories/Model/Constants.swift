//
//  Constants.swift
//  handslab-project
//
//  Created by Yuya Harada on 2020/10/13.
//  Copyright © 2020 Yuya Harada. All rights reserved.
//

import Foundation

enum Cells {
    
    static let repositoryCell = "repositoryCell"
    
}

enum API {
    
    static let gitHubEndpoint = "https://api.github.com/search/repositories?q=language:swift&sort=stars&order=desc"
    
    // properties
    static let items = "items"
    static let owner = "owner"
    static let avatarUrl = "avatar_url"
    static let name = "name"
    static let login = "login"
    static let starNum = "stargazers_count"
    static let repositoryUrl = "html_url"
    
}

