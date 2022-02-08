//
//  UserTableViewController.swift
//
//  Created by JOSEPH KERR on 2/4/22.
//

import UIKit

class UsersTableViewController: UITableViewController {

    var viewModel: UsersViewable = UsersViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        tableView.dataSource = self
//        tableView.delegate = self
        viewModel.load {
            DispatchQueue.main.async { [weak self] in
                self?.tableView.reloadData()
            }
        }
    }
}

/// Table view data source

extension UsersTableViewController {

    override func numberOfSections(in tableView: UITableView) -> Int { 1 }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         viewModel.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath) as UITableViewCell
        if let user = viewModel[indexPath.row] {
            cell.textLabel?.text = "\(user.name) \(user.address.geo.lat) \(user.address.geo.lng)"
        }
        return cell
    }
}
