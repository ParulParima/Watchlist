//
//  g.swift
//  Hope
//
//  Created by Tnluser on 29/08/22.
//

import Foundation

protocol DomainConvertibleType {
    associatedtype DomainType
    
    func asDomain() -> DomainType
}
