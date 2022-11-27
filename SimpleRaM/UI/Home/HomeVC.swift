//
//  ViewController.swift
//  SimpleRaM
//
//  Created by Hakan Adanur on 27.11.2022.
//

import Foundation
import UIKit

class HomeVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    private var viewModel = HomeVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Rick And Morty"
        tableView.dataSource = self
        tableView.delegate = self
        viewModel.delegate = self
        viewModel.fetchCharacters()
        }
    

}

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = viewModel.characters[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailsVC = DetailsVC.create(name: viewModel.characters[indexPath.row].name)
        navigationController?.pushViewController(detailsVC, animated: true)
    }
}

extension HomeVC: HomeVMDelegate {
    func fetchCharactersOnSuccess() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func fetchCharactersOnUnsuccess() {
        print("Failed")
    }
}

