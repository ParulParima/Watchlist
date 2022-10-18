//
//  PopularHeaderCollectionReusableView.swift
//  Hope
//
//  Created by Tnluser on 06/09/22.
//

import UIKit

class TableViewHeader: UITableViewHeaderFooterView {
    
    static let identifier = "TableViewHeader"
    let title = UILabel()

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        configureContents()
    }
    static func nib() -> UINib {
                return UINib(nibName: "TableViewHeader", bundle: nil)
            }
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
    func setup(with title: String) {
        self.title.text = title
    }

    func configureContents() {
       
        title.translatesAutoresizingMaskIntoConstraints = false

        contentView.addSubview(title)
        title.font = UIFont(name:"ArialRoundedMTBold", size: 20.0)

        NSLayoutConstraint.activate([
            title.heightAnchor.constraint(equalToConstant: 50),
            title.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            title.topAnchor.constraint(equalTo:
                   contentView.layoutMarginsGuide.topAnchor, constant: 10)
        ])
    }
}
