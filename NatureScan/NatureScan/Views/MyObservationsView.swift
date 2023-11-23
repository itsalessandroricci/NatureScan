//
//  MyObservationsView.swift
//  NatureScan
//
//  Created by Alessandro Ricci on 15/11/23.
//

import SwiftUI

struct MyObservationsView: View {
    
    @Environment(IsDetectedViewModel.self) var isdetectedviewmodel
    @State private var showModal: Bool = false
    
    var body: some View {
        NavigationStack{
            List{
                ForEach(isdetectedviewmodel.cardsNature) { card in
                    if card.isDetected {
                        NavigationLink(destination: AboutView(cardNature: card))  {
                            HStack{
                                Image(card.image)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                                    .frame(width: 90)
                                VStack(alignment: .leading){
                                    Text(card.name)
                                    Text(card.scientificName)
                                }
                            }
                        }
                    }
                }
            }
            .listStyle(.automatic)
            .navigationTitle("My Observation")
        }
    }
}

#Preview {
    MyObservationsView()
        .environment(IsDetectedViewModel())
}
