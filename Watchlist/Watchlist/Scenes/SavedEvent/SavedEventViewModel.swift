//
//  SavedEventViewModel.swift
//  Hope
//
//  Created by Tnluser on 05/09/22.
//

import Foundation

final class SavedEventViewModel {
    
    var savedTVEvent: [TVEventEntity]
    var savedMovieEvent: [MovieEventEntity]
    
    init(savedMovieEvent: [MovieEventEntity], savedTVEvent: [TVEventEntity]) {
        self.savedMovieEvent = savedMovieEvent
        self.savedTVEvent = savedTVEvent
    }
}


