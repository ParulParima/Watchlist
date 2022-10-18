//
//  AppCoordinator.swift
//  YouCanDoIt
//
//  Created by Tnluser on 27/08/22.
//

import Foundation
import UIKit

protocol Coordinator: AnyObject {
    var childCoordinator: [Coordinator] {get}
    func start()
}

final class AppCoordinator: Coordinator {
    
    var window: UIWindow
    
    var eventListServiceProvider = AppServiceProvider()
    
    init(window: UIWindow) {
        self.window = window
    }
    private(set) var childCoordinator: [Coordinator] = []
    
    func start() {
        
        let navigationController = UINavigationController()
    
        let sceneProvider = EventListSceneProvider(useCaseProvider: eventListServiceProvider.eventListServiceProvider())
        let eventListCoordinator  = EventListCoordinator(sceneProvider: sceneProvider, navigationController: navigationController)
        childCoordinator.append(eventListCoordinator)
        eventListCoordinator.start()
        
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
