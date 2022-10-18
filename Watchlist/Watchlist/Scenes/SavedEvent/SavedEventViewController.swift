//
//  SavedEventViewController.swift
//  Hope
//
//  Created by Tnluser on 05/09/22.
//

import UIKit

class SavedEventViewController: UIViewController {
    
    @IBOutlet weak var savedTableView: UITableView!
    var viewModel: SavedEventViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupInterface()
    }
    func setupInterface() {
        
        savedTableView.delegate = self
        savedTableView.dataSource = self
        savedTableView.register(SavedTableViewCell.nib(), forCellReuseIdentifier: SavedTableViewCell.identifier)
        savedTableView.register(TableViewHeader.self, forHeaderFooterViewReuseIdentifier: TableViewHeader.identifier)
        savedTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        savedTableView.clipsToBounds = true
    }
}
extension SavedEventViewController: UITableViewDelegate {
    
}
extension SavedEventViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SavedTableViewCell.identifier, for: indexPath) as! SavedTableViewCell
        cell.viewModel = viewModel
        cell.eventCollectionView.tag = indexPath.section
        cell.frame = tableView.bounds
        cell.layoutIfNeeded()
        cell.eventCollectionView.reloadData()
        return cell
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 440
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
       let view = tableView.dequeueReusableHeaderFooterView(withIdentifier:
                                                                TableViewHeader.identifier) as! TableViewHeader
        section == 0 ? view.setup(with: "Movie") : view.setup(with: "TV")

       return view
    }
    
}
