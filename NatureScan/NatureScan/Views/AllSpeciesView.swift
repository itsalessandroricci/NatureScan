//
//  AllSpeciesView.swift
//  NatureScan
//
//  Created by Alessandro Ricci on 21/11/23.
//

import SwiftUI

struct AllSpeciesView: View {
    
    @State private var searchText = ""
    //    @Environment(IsDetectedViewModel.self) var isdetectedviewmodel
    
    let sortedCards = IsDetectedViewModel.shared.cardsNature.sorted(by: {card1, card2 in
        card1.name < card2.name
    })
    
    var body: some View {
        NavigationStack {
            
            
            List {
                ForEach(sortedCards.filter {
                    searchText.isEmpty || $0.name.localizedCaseInsensitiveContains(searchText)
                }) { isdetectedviewmodel in
                    NavigationLink(destination: AboutView(cardNature: isdetectedviewmodel)) {
                        HStack {
                            Image(isdetectedviewmodel.image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .clipShape(Circle())
                                .shadow(radius: 10)
                                .frame(width: 90)
                            VStack(alignment: .leading) {
                                Text(isdetectedviewmodel.name)
                                Text(isdetectedviewmodel.scientificName)
                            }
                        }
                    }
                }
            }
            .searchable(text: $searchText)
            .listStyle(.automatic)
        }
        .navigationTitle("All Species")
    }
}


#Preview {
    AllSpeciesView()
}
