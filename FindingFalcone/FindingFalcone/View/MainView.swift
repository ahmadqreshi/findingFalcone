//
//  ContentView.swift
//  FindingFalcone
//
//  Created by Admin on 27/08/23.
//

import SwiftUI

struct MainView: View {
    
    @StateObject private var viewModel: MainViewModel = MainViewModel()
    
    var body: some View {
        NavigationView {
            if viewModel.showLoader {
                LoaderView()
            } else {
                ScrollView(.vertical) {
                    Text("Select planets you want to search in:")
                        .font(.system(size: 18))
                    
                    Text("Time Taken: \(viewModel.timeTaken)")
                        .font(.system(size: 16, weight: .semibold))
                        .padding(.vertical, 10)
                    
                    DestinationView(
                        destinationIndex: 1,
                        destination: $viewModel.destination1,
                        destinationVehicle: $viewModel.destination1Vehicle,
                        viewModel: viewModel
                    )
                    
                    DestinationView(
                        destinationIndex: 2,
                        destination: $viewModel.destination2,
                        destinationVehicle: $viewModel.destination2Vehicle,
                        viewModel: viewModel
                    )
                    
                    DestinationView(
                        destinationIndex: 3,
                        destination: $viewModel.destination3,
                        destinationVehicle: $viewModel.destination3Vehicle,
                        viewModel: viewModel
                    )
                    
                    DestinationView(
                        destinationIndex: 4,
                        destination: $viewModel.destination4,
                        destinationVehicle: $viewModel.destination4Vehicle,
                        viewModel: viewModel
                    )
                    
                    findingFalconeButton
                        .padding(.vertical, 30)
                    
                    Text("Coding problem - www.geektrust.in/finding-falcone")
                        .padding(.top)
                        .font(.system(size: 10))
                    
                    NavigationLink(
                        destination: ResultView(viewModel: viewModel),
                        isActive: $viewModel.navigateToResultView
                    ) { EmptyView() }
                }
                .navigationViewStyle(.stack)
                .navigationTitle("Finding Falcone!")
                .toolbar {
                    resetButton
                }
            }
        }
    }
    
    private var resetButton: some View {
        Button {
            viewModel.resetValues()
        } label: {
            Text("Reset")
        }
    }
    
    private var findingFalconeButton: some View {
        Button {
            if viewModel.isFindEnable {
                viewModel.findFalcone()
                viewModel.showLoader = true
            }
        } label: {
            Text("Finding Falcone")
                .foregroundColor(.white)
                .padding(.vertical, 10)
                .padding(.horizontal, 16)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                )
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
