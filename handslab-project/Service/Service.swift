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

    static func fetchData() {

        AF.request(API.gitHubEndpoint).responseJSON { (response) in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                
//                debugPrint(json)
                
                let repositoryItemArr = json["items"].arrayValue
                    
                for item in repositoryItemArr {
                    print(item["owner"]["avatar_url"])
                    
                    
                    Repository(userImageUrl: item["owner"]["avatar_url"].stringValue, userName: item["owner"]["user_name"].stringValue, repositoryName: item["owner"]["repository_name"].stringValue, starNum: item["owner"]["star_number"].intValue)
 
                }
                
            case .failure(let error):
                print(error)
            }
            
        }

    }

}
