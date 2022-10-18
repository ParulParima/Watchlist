//
//  AddEventViewModel.swift
//  Hope
//
//  Created by Tnluser on 28/08/22.
//

import Foundation


class AddEventViewModel {
    
    var coordinator: AddEventCoordinator?
    
    func viewDidDisappear() {
        coordinator?.didFinishAddEvent()
    }
}
