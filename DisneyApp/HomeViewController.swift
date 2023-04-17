//
//  HomeViewController.swift
//  DisneyApp
//
//  Created by Aline do Amaral on 11/04/23.
//

import UIKit

class HomeViewController: UIViewController {
    private let tableView: UITableView = {
        let tableView = UITableView()
        
        return tableView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        UITableViewCell()
    }
}
extension HomeViewController: view
