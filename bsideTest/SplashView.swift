//
//  SplashView.swift
//  bsideTest
//
//  Created by joomin on 3/23/24.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
        ZStack {
                    Color.blue
                        .edgesIgnoringSafeArea(.all)
                    
                    VStack {
                        Text("Loading...")
                            .font(.title)
                            .foregroundColor(.white)
                    }
                }
    }
}

#Preview {
    SplashView()
}
