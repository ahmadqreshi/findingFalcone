//
//  LoaderView.swift
//  FindingFalcone
//
//  Created by Admin on 27/08/23.
//

import SwiftUI

struct LoaderView: View {
    var body: some View {
        ZStack {
            ProgressView()
                .progressViewStyle(.circular)
                .tint(.blue)
                .controlSize(.large)
        }
    }
}

struct LoaderView_Previews: PreviewProvider {
    static var previews: some View {
        LoaderView()
    }
    
}
