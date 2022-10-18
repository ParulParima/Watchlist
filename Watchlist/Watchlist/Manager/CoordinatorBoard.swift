//
//  CoordinatorBoard.swift
//  YouCanDoIt
//
//  Created by Tnluser on 27/08/22.
//

import Foundation
import UIKit

extension UIViewController {
    static func instanciate() -> Self {
        let storyBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let id = String(describing: self)
        return storyBoard.instantiateViewController(withIdentifier: id) as! Self
    }
}

