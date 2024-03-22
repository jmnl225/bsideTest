//
//  ContentView.swift
//  bsideTest
//
//  Created by joomin on 3/22/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .contentShape(Rectangle()) // 추가
        .onTapGesture {
            print("touch")
            let geoManager = GeoManager()
            geoManager.performRequest(with: geoManager.urlString + geoManager.apiKey)
        }
    }
}

#Preview {
    ContentView()
}
