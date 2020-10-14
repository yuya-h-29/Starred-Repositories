//
//  RepositoryListVC.swift
//  handslab-project
//
//  Created by Yuya Harada on 2020/10/12.
//  Copyright © 2020 Yuya Harada. All rights reserved.
//

import UIKit

class RepositoryListVC: UIViewController{
    
    var tableView = UITableView()
    var repositories: [Repository] = []
    var pageNumber = 1

    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureTableView()
        fetchData()
        
    }
    
    
    //MARK: - API
    
    func fetchData() {
        Service.fetchData(page: pageNumber, pagination: true) { (repository) in
//            self.repositories = repository
            
            self.repositories.append(repository)
            
            print(repository)
            
            DispatchQueue.main.async {
//                print(self.repositories.count)
                Service.isFirstLoadFinished = true
                self.tableView.reloadData()
            }
        }

        pageNumber += 1
    }
    
    
    //MARK: - Helper functions
    
    func configureTableView() {
        
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 100
        tableView.register(RepositoryCell.self, forCellReuseIdentifier: Cells.repositoryCell)
        tableView.pin(to: view)
        
    }
}


//MARK: - RepositoryListVC Extensions


extension RepositoryListVC: UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repositories.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Cells.repositoryCell) as! RepositoryCell
        
        cell.configureCellView(repository: repositories[indexPath.row])
        cell.selectionStyle = .none
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let repository = repositories[indexPath.row]
        
        if let url = URL(string: repository.repositoryUrl){
            UIApplication.shared.open(url, options: [:])
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let position = tableView.contentOffset.y
        
        if position >= (tableView.contentSize.height - tableView.frame.size.height) && Service.isFirstLoadFinished{
            
            guard !Service.isPaginating else {
                return
            }
 
//            print("did scroll has called")
            
//            Service.fetchData(page: pageNumber, pagination: true) { (repository) in
//
//                self.repositories.append(contentsOf: repository)
//
//                DispatchQueue.main.async {
//                    self.tableView.reloadData()
//                }
//            }
            fetchData()
            
//            pageNumber += 1
//            print(pageNumber)
        }
    }
    

    
}
