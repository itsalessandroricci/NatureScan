//
//  AleStorage.swift
//  NatureScan
//
//  Created by Alessandro Ricci on 26/01/24.
//

import Foundation
import SwiftUI

@Observable
class AleStorage: ObservableObject {
    
    public static let shared: AleStorage = .init()

    public var observationHistory: [Card] = [] {
        didSet {
            AppStorage2.shared.myObservations = observationHistory.map { $0.name }.joined(separator: ",")
        }
    }
    
    public func addObservation(string observationName: String) {
        if let card = IsDetectedViewModel.shared.getCard(with: observationName) {
            self.observationHistory.append(card)
        }
    }
    
    private init() {
        let strings = AppStorage2.shared.myObservations.components(separatedBy: ",")
        var cards: [Card] = []
        for string in strings {
            if let card = IsDetectedViewModel.shared.getCard(with: string) {
                cards.append(card)
            }
        }
        self.observationHistory = cards
    }
}

class AppStorage2 {
    
    public static var shared: AppStorage2 = .init()
    
    @AppStorage("myObservations")
    fileprivate var myObservations: String = ""
    
    private init() {}
}
