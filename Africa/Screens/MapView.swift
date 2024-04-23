//
//  MapView.swift
//  Africa
//
//  Created by Hasan on 4/6/24.
//

import SwiftUI
import MapKit

struct MapView: View {
    @State private var cameraPosition = MapCameraPosition.region( MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599), span: MKCoordinateSpan(latitudeDelta: 60, longitudeDelta: 60)))
    
    let locations : [NationalParkLocation] = Bundle.main.decode("locations.json")
    
    var body: some View {
      
            Map(position: $cameraPosition){
                ForEach(locations) { location in
                    Annotation(location.name, coordinate:location.location) {
                        NationalParkAnnotation(location: location)
                    }
                }
            } //: Map
            .overlay(alignment: .top){
                HStack{
                    Image("compass")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 60 ,height: 60 )
                    VStack{
                        HStack{
                            Text("Latitude:")
                                .font(.footnote)
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                .foregroundStyle(.accent)
                            Spacer()
                            Text("\(cameraPosition.region?.center.latitude ?? 0.0)")
                                .font(.footnote)
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        }
                         
                        HStack{
                            Text("Longitude:")
                                .font(.footnote)
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                .foregroundStyle(.accent)
                            Spacer()
                            Text("\(cameraPosition.region?.center.longitude ?? 0.0)")
                                .font(.footnote)
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        }
                    }
                } //: HStack
                .padding(.horizontal)
                .padding(.vertical, 10)
                    .background(.black.opacity(0.6))
                    .cornerRadius(8)
                    .frame(height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                    .padding(.horizontal)
            }
    }
}

#Preview {
    MapView()
}
