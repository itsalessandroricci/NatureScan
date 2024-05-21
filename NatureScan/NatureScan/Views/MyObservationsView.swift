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
        NavigationStack {
            List {
                ForEach(AleStorage.shared.observationHistory) { card in
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
                            Button(action: {
                                deleteObservation(card: card)
                            }) {
                                Image(systemName: "trash")
                                    .foregroundColor(.red)
                            }
                            .padding(.trailing, 10)
                            .buttonStyle(BorderlessButtonStyle())
                        }
                    }
                }
            }
            .listStyle(.automatic)
            .navigationTitle("My Observation")
            .navigationBarTitleDisplayMode(.large)
        }
    }
    func deleteObservation(card: Card) {
            // Trova l'indice della carta nell'array e rimuovila
            if let index = AleStorage.shared.observationHistory.firstIndex(where: { $0.id == card.id }) {
                AleStorage.shared.observationHistory.remove(at: index)
            }
        }
    
}

#Preview {
    MyObservationsView()
        .environment(IsDetectedViewModel.shared)
}
