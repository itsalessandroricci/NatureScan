//
//  TabBarView.swift
//  NatureScan
//
//  Created by Alessandro Ricci on 15/11/23.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        
        TabView{
            
    MyObservationsView()
        .tabItem {
            Label("My Observations", systemImage: "magnifyingglass")
                }
    ScanView(classifier: ImageClassifier())
        .tabItem{
                    
            Label("Scan", systemImage: "camera")
                }
    FavouritesView()
        .tabItem{
                    
            Label("Favourites", systemImage: "heart")
                }
            
        }
    }
}

#Preview {
    TabBarView()
}
