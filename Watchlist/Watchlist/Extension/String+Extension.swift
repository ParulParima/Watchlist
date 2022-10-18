//
//  String+Extension.swift
//  Hope
//
//  Created by Tnluser on 04/09/22.
//

import Foundation

extension String {
    func dateExtraction() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        print(self)
        let date: Date = dateFormatter.date(from: self)!
        dateFormatter.dateFormat = "MMM dd, yyyy"
        let resultDate = dateFormatter.string(from: date)
        return resultDate
        
    }
}
