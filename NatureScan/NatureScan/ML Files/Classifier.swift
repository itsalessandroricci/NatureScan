//
//  Classifier.swift
//  NatureScan
//
//  Created by Alessandro Ricci on 16/11/23.
//

import CoreML
import Vision
import CoreImage
import SwiftUI


struct Classifier {
    
    private let storage: AleStorage = .shared
    
    private(set) var results: String?
    
    mutating func detect(ciImage: CIImage) {
        
        guard let model = try? VNCoreMLModel(for: NatureScanML(configuration: MLModelConfiguration()).model)
        else {
            return
        }
        
        let request = VNCoreMLRequest(model: model)
        
        let handler = VNImageRequestHandler(ciImage: ciImage, options: [:])
        
        try? handler.perform([request])
        
        guard let results = request.results as? [VNClassificationObservation] else {
            return
        }
        
        if let firstResult = results.first {
            self.results = firstResult.identifier
            storage.addObservation(string: firstResult.identifier)
            print(storage.observationHistory.debugDescription)
        }
        
    }
    
}
