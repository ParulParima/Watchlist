//
//  AddEventCoordinator.swift
//  Hope
//
//  Created by Tnluser on 28/08/22.
//

import UIKit

final class AddEventCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    
    weak var parentCoordinator: EventListCoordinator?
    
    private(set) var childCoordinator: [Coordinator] = []
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let addEventViewController: AddEventViewController = .instanciate()
        let viewModel = AddEventViewModel()
        viewModel.coordinator = self
        addEventViewController.viewModel = viewModel
        navigationController.present(addEventViewController, animated: false, completion: nil)
    
    }
    func didFinishAddEvent() {
        parentCoordinator?.childDidFinish(child: self)
    }
    
    deinit {
        print("I'm out!")
    }
}
