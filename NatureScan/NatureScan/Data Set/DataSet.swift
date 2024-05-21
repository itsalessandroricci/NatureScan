//
//  DataSet.swift
//  NatureScan
//
//  Created by Alessandro Ricci on 15/11/23.
//

import Foundation
import MapKit


struct Card: Identifiable, Hashable
{
    static func == (lhs: Card, rhs: Card) -> Bool {
        lhs.hashValue == rhs.hashValue
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
    
    var id: UUID = UUID()
    var name: String
    var scientificName: String
    var image: String
    var about: String
    var locations: [Location] = []
    var isDetected: Bool = false
    
    
}

struct Location: Identifiable
{
    let id: UUID = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
    
}

