//
//  RepositoryListVC.swift
//  handslab-project
//
//  Created by Yuya Harada on 2020/10/12.
//  Copyright © 2020 Yuya Harada. All rights reserved.
//

import UIKit

class RepositoryListVC: UIViewController {
    
    var tableView = UITableView()
    var repositories: [Repository] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        title = "AAAAAA"
        
        configureTableView()
        fetchData()
        
    }
    
    //MARK: - API
    
    func fetchData() {
        Service.fetchData { (repository) in
            self.repositories = repository
            self.tableView.reloadData()
        }
        
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


extension RepositoryListVC: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repositories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Cells.repositoryCell) as! RepositoryCell
        
        cell.set()
        
        return cell
    }
    
    
}
