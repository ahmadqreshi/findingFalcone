//
//  DestinationView.swift
//  FindingFalcone
//
//  Created by Admin on 27/08/23.
//

import SwiftUI

struct DestinationView: View {
    var destinationIndex: Int
    @Binding var destination: PlanetModel
    @Binding var destinationVehicle: VehicleModel
    @ObservedObject var viewModel: MainViewModel
    
    var body: some View {
        HStack(alignment: .top) {
            Menu {
                Picker("", selection: $destination) {
                    ForEach(Array(viewModel.destinations.enumerated()), id:\.offset) { index, destination in
                        Text(destination.name)
                            .tag(destination)
                    }
                }
                .disabled(!destination.name.isEmpty)
            } label: {
                Text(destination.name.isEmpty ? "Destination \(destinationIndex) ▼" : destination.name)
                    .foregroundColor(.white)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 16)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                    )
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .accessibilityIdentifier("Destination \(destinationIndex)")
            }
           
            Spacer()
            if !destination.name.isEmpty {
                VStack(alignment: .leading, spacing: 10) {
                    ForEach(Array(viewModel.vehicles.enumerated()), id:\.offset) { index, vehicle in
                        VehicleNameView(vehicleName: vehicle, selectedVehicle: $destinationVehicle, selectedDestination: $destination)
                    }
                }
            }
        }
        .padding(.horizontal, 16)
        .frame(maxWidth: .infinity)
        .padding(.vertical, 30)
    }
}

struct DestinationView_Previews: PreviewProvider {
    static var previews: some View {
        DestinationView(
            destinationIndex: 1,
            destination: .constant(.initialize()),
            destinationVehicle: .constant(.initialize()),
            viewModel: MainViewModel()
        )
    }
}
