//
//  AppServiceProvider.swift
//  Hope
//
//  Created by Tnluser on 29/08/22.
//

import Foundation

class AppServiceProvider {    
   
    func eventListServiceProvider() -> EventListUseCaseProvider {
        let networkManager = NetworkManager()
        return EventListServiceProvider(networkManager: networkManager)
    }
}
