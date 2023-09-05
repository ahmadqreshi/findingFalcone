//
//  ResultView.swift
//  FindingFalcone
//
//  Created by Admin on 28/08/23.
//

import SwiftUI

struct ResultView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var viewModel: MainViewModel
    var body: some View {
        VStack {
            Text("Finding Falcone!")
                .font(.system(size: 24))
                .fontWeight(.semibold)
            
            Text(viewModel.result?.status == "success" ? "Success! Congratulations on finding falcone. King Shan is mighty pleased." : "Failure! Please Find again.")
                .multilineTextAlignment(.center)
                .padding(.top)
            
            if let error = viewModel.apiResponseError {
                Text(error)
                    .multilineTextAlignment(.center)
                    .padding(.top)
            }
            
            Text("Time Taken: \(viewModel.timeTaken)")
                .fontWeight(.semibold)
                .padding(.top)
            if let planetName = viewModel.result?.planetName {
                Text("Planet found: \(planetName)")
                    .padding(.top)
            }
            
            startButton
                .padding(.top)
        }
        .padding(.horizontal, 16)
    }
    
    private var startButton: some View {
        Button {
            presentationMode.wrappedValue.dismiss()
            viewModel.resetValues()
        } label: {
            Text("Start Again")
                .foregroundColor(.white)
                .padding(.vertical, 10)
                .padding(.horizontal, 16)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.blue)
                )
        }

    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView(viewModel: MainViewModel())
    }
}
