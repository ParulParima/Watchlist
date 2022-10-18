//
//  PopularFooterCollectionReusableView.swift
//  Hope
//
//  Created by Tnluser on 07/09/22.
//

import UIKit

class PopularFooterCollectionReusableView: UICollectionReusableView {

    static let identifier = "PopularFooterCollectionReusableView"
    @IBOutlet weak var footer: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    static func nib() -> UINib {
        return UINib(nibName: "PopularFooterCollectionReusableView", bundle: nil)
    }
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
    
    func setup(with title: String) {
        footer.text = title
    }
    
}
