//
//  AccountViewController.swift
//  Resto
//
//  Created by santos perez edson on 25/01/2021.
//

import SwiftUI

struct AccountForm {
    let title: String
}

class AccountViewController: UIViewController {
    
    let tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
           
        
    }
    
    
}
