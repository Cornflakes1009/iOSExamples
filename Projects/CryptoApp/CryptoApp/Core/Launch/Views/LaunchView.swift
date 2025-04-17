//
//  LaunchView.swift
//  CryptoApp
//
//  Created by Harold Davidson on 4/16/25.
//

import SwiftUI

struct LaunchView: View {
    var body: some View {
        ZStack {
            Color.launch.background
                .ignoresSafeArea()
            
            Image("logo-transparent")
                .resizable()
                .frame(width: 100, height: 100)
        }
    }
}

#Preview {
    LaunchView()
}
