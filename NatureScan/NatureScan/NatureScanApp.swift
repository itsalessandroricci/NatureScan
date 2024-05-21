//
//  NatureScanApp.swift
//  NatureScan
//
//  Created by Alessandro Ricci on 15/11/23.
//

import SwiftUI

@main
struct NatureScanApp: App {
    
    var isdetectedviewmodel = IsDetectedViewModel.shared
    
    var body: some Scene {
        WindowGroup {
           TabBarView()
        }
        .environment(isdetectedviewmodel)
    }
}
