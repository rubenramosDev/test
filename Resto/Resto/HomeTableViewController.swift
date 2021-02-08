//
//  ViewController.swift
//  Resto
//
//  Created by santos perez edson on 25/01/2021.
//

import UIKit

class HomeViewController: UIViewController {

    var tableView: UITableView!
    
    var username: String!
    
    var dishes: [Dish] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureViewController()
        configureTableView()
        getDishes()
    }
    
    func getDishes(){
        //Network
        NetworkManager.shared.getDishes(){ result in
            switch result {
            case .success(let dishes):
                self.dishes = dishes
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
            case .failure(let error):
                let alert = GeneralAlert(title: "Oops!", message: error.rawValue)
                DispatchQueue.main.async {
                    alert.showAlert(on: self)
                }
            }
        }
    }
    
    func configureViewController(){
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func configureTableView(){
        tableView = UITableView()
        tableView.rowHeight = 80
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(DishCell.self, forCellReuseIdentifier: "DishCell")
        
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }

}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DishCell", for: indexPath) as! DishCell
        
        let dish = dishes [indexPath.row]
        cell.set(dish: dish)//send the dish object
        return cell
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //let selectedIndexPath = tableView.indexPathForSelectedRow!
               //let selected = personnages[selectedIndexPath.row]
               
               
               //let detailVC = segue.destination as! ViewController
               //detailVC.personnage = selectedPersonnage
    }
    
}
