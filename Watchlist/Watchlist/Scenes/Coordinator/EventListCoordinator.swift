//
//  EventListCoordinator.swift
//  YouCanDoIt
//
//  Created by Tnluser on 27/08/22.
//

import Foundation
import UIKit

final class EventListCoordinator: Coordinator {

    var navigationController: UINavigationController
    let sceneProvider: EventListSceneProvider
    var eventMovieEntity: [MovieEventEntity] = []
    var eventTVEntity: [TVEventEntity] = []
    
    private(set) var childCoordinator: [Coordinator] = []
    
    init(sceneProvider: EventListSceneProvider, navigationController: UINavigationController) {
        self.sceneProvider = sceneProvider
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = sceneProvider.makeEventViewController()
        viewController.navigator = self
        navigationController.setViewControllers([viewController], animated: false)
    }
    
    func showDetails(id: String, eventType: EventType) {
        let viewController = sceneProvider.makeDetailViewController(id : id, eventType: eventType)
        viewController.navigateBackClosure = { [weak self]  (movie, tv) in
            self?.navigationController.popViewController(animated: true)
            if movie != nil {
                if !(self?.eventMovieEntity.contains(where: {$0.title == movie?.title}))! {
                self?.eventMovieEntity.append(movie!)
                }
            }
            else if tv != nil  {
                if !(self?.eventTVEntity.contains(where: {$0.name == tv?.name}))! {
                self?.eventTVEntity.append(tv!)
                }
            }
            
        }
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func showSavedData() {
        let viewController = sceneProvider.makeSavedEventViewController(savedMovieEvent: self.eventMovieEntity , savedTVEvent: self.eventTVEntity )
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func addEvent() {
        let addEventCoordinator = AddEventCoordinator(navigationController: navigationController)
        addEventCoordinator.parentCoordinator = self
        childCoordinator.append(addEventCoordinator)
        addEventCoordinator.start()
    }
    
    func childDidFinish(child: Coordinator) {
        for (index, coordinator) in childCoordinator.enumerated() {
            if (coordinator === child)
            {
                childCoordinator.remove(at: index)
                break
            }
        }
        }
    
}
