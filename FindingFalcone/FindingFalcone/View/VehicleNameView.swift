//
//  VehicleNameView.swift
//  FindingFalcone
//
//  Created by Admin on 27/08/23.
//

import SwiftUI

struct VehicleNameView: View {
    @State var vehicleName: VehicleModel
    @Binding var selectedVehicle: VehicleModel
    @Binding var selectedDestination: PlanetModel
    var isSelected: Bool {
        vehicleName.name == selectedVehicle.name
    }
    
    var isDistanceMore: Bool {
        vehicleName.maxDistance < selectedDestination.distance
    }
    
    var body: some View {
        Button {
            selectedVehicle = vehicleName
            if vehicleName.totalNo > 0 {
                vehicleName.totalNo -= 1
            }
        } label: {
            VStack(alignment: .leading) {
                HStack(alignment: .top) {
                    Image(systemName: isSelected ? "circle.fill" : "circle")
                        .foregroundColor(.black)
                    Text("\(vehicleName.name)(\(vehicleName.totalNo))")
                        .foregroundColor(isDistanceMore ? .gray : .black)
                }
            }
        }
        .disabled(!selectedVehicle.name.isEmpty || vehicleName.totalNo == 0 || isDistanceMore )
    }
}

struct VehicleNameView_Previews: PreviewProvider {
    static var previews: some View {
        VehicleNameView(vehicleName: .initialize(), selectedVehicle: .constant(.initialize()), selectedDestination: .constant(.initialize()))
    }
}
