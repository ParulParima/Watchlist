//
//  AddEventViewController.swift
//  Hope
//
//  Created by Tnluser on 28/08/22.
//

import UIKit

class AddEventViewController: UIViewController {
    

    @IBOutlet weak var TableView: UITableView!
    var viewModel: AddEventViewModel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        viewModel.viewDidDisappear()
    }
    
}
