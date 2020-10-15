//
//  Service.swift
//  handslab-project
//
//  Created by Yuya Harada on 2020/10/13.
//  Copyright © 2020 Yuya Harada. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire


struct Service {
    
    static var isPaginating = false
    
    static var isFirstLoadFinished = false
    
    
    static func fetchData(page: Int, completion: @escaping (Repository) -> ()) {
        
        
        isPaginating = true
        
        let api = API.gitHubEndpoint + "&page=\(String(describing: page))"

        AF.request(api).responseJSON { (response) in
            switch response.result {
            
            case .success(let value):
                let json = JSON(value)
                if let repositoryItemArray = json[API.items].array {
                    
                    for item in repositoryItemArray {
                            
                        let repository = Repository(userImageUrl: item[API.owner][API.avatarUrl].stringValue, userName: item[API.owner][API.login].stringValue, repositoryName: item[API.name].stringValue, starNum: item[API.starNum].intValue, repositoryUrl: item[API.repositoryUrl].stringValue)

                        completion(repository)
                        
                    }
            
                }
                
                isPaginating = false
                    
            case .failure(let error):
                print(error)
            }
        }
    }

}
