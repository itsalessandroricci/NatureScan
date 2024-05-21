//
//  AboutView.swift
//  NatureScan
//
//  Created by Alessandro Ricci on 21/11/23.
//

import SwiftUI
import MapKit

struct AboutView: View {
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 40.85143619677846, longitude: 14.267463135697087),
        span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        
    )
    @Environment(IsDetectedViewModel.self) var isdetectedviewmodel
    var cardNature: Card
    
    var body: some View {
        NavigationStack {
            ScrollView {
                Image(cardNature.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 394, height: 264)
                    .clipped()
                VStack(alignment: .leading) {
                    Text(cardNature.name)
                        .font(.largeTitle)
                    Text(cardNature.scientificName)
                        .font(.title2)
                        .italic()
                    
                    Text("ABOUT")
                        .font(.largeTitle)
                        .bold()
                        .padding(.top, 10)
                    
                    Text(cardNature.about)
                        .multilineTextAlignment(.leading)
                        .padding(.bottom)
                    
                    
//                        VStack{
//                            Map(coordinateRegion: $region, showsUserLocation: true, annotationItems: getAnnotations()) { location in
//                                MapMarker(coordinate: location.coordinate, tint: .blue)
//                            }
//                            .frame(height: 200)
//                            .cornerRadius(10)
//                        }
                    }
                    .padding()
                }
            }
        }
        
            private func getAnnotations() -> [Location] {
            var annotations: [Location] = []
                for card in isdetectedviewmodel.cardsNature {
                annotations.append(contentsOf: card.locations)
            }
            return annotations
        }
    }


struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView(cardNature: Card( name: "Plant - Sunflower", scientificName: "Helianthus", image: "sunflower", about: "The sunflower, scientifically known as Helianthus annuus, is a vibrant and iconic flower that captivates with its brilliant hues and distinctive features. Standing tall and proud, the sunflower derives its name from its unique behavior of tracking the sun across the sky, a phenomenon known as heliotropism. This characteristic manifests in the bud's initial eastward-facing orientation, gradually following the sun's trajectory until it reaches its full bloom, symbolizing resilience and optimism.  The sunflower's anatomy is equally fascinating. Its large, disk-shaped flower head is an intricate arrangement of tiny individual florets, creating a stunning display reminiscent of a radiant sun. The golden-yellow petals surround a central disk, which houses the sunflower's true flowers, eventually maturing into the seeds we commonly associate with this botanical marvel.  Cultivated for both ornamental and practical purposes, sunflowers have a rich cultural significance. Beyond their aesthetic appeal, they hold symbolic value across various cultures, often representing adoration, loyalty, and positivity. In agriculture, sunflowers contribute substantially as oilseed crops, with their seeds yielding nutrient-rich oils. Furthermore, sunflower fields, with their vast stretches of golden blooms, paint picturesque landscapes that attract admirers and photographers alike.  Whether gracing gardens, fields, or artworks, the sunflower's enchanting beauty and symbolism continue to brighten landscapes and hearts worldwide, making it an enduring emblem of warmth, vitality, and the enduring spirit of nature.", locations: [Location(name: "Orto Botanico di Napoli", coordinate: CLLocationCoordinate2D(latitude: 40.8614, longitude: 14.2623))]))
    }
}

