//
//  CompactMapView.swift
//  Africa
//
//  Created by Hasan on 4/22/24.
//

import SwiftUI
import MapKit

struct CompactMapView: View {
    @State private var cameraPosition = MapCameraPosition.region( MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599), span: MKCoordinateSpan(latitudeDelta: 60.0, longitudeDelta: 60.0)))
    
    var body: some View {
       Map(position: $cameraPosition)
            .overlay(alignment: .topTrailing){
                NavigationLink(destination:{
                    MapView()
                }){
                    HStack{
                        Image(systemName: "mappin.circle")
                            .imageScale(.large)
                            .foregroundColor(.white)
                        Text("Locations")
                            .font(.title2)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .foregroundColor(.accent)
                    }
                    .padding(10)
                    .background(.ultraThinMaterial)
                    .cornerRadius(8)
                }
                .padding(.horizontal, 8)
                .padding(.vertical,8)
            }
            .frame(height: 256)
            .cornerRadius(12)
    }
}

#Preview {
     CompactMapView()
}
