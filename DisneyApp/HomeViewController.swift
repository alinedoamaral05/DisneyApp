//
//  HomeViewController.swift
//  DisneyApp
//
//  Created by Aline do Amaral on 11/04/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    var itemList: [Characters] = []
    let viewModel = ViewModel()
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
        itemList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? DisneyInfoCard {
            cell.name.text = itemList[indexPath.row].name
            cell.filmsArray = itemList[indexPath.row].films
            cell.shortFilmsArray = itemList[indexPath.row].shortFilms
            cell.tvShowsArray = itemList[indexPath.row].tvShows
            cell.parkAttractionsArray = itemList[indexPath.row].parkAttractions
            cell.alliesArray = itemList[indexPath.row].allies
            cell.enemiesArray = itemList[indexPath.row].enemies
            
            return cell
        } else {
            return UITableViewCell()
        }
    }
}
extension HomeViewController: ViewModelDelegate {
    func getOptions() -> [Characters] {
        itemList = viewModel.charactersList
        tableView.reloadData()
        return itemList
    }
    
    func errorMessage(_ message: String) {
        print("error")
    }
    
    
}
