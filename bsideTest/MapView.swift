//
//  MapView.swift
//  bsideTest
//
//  Created by joomin on 3/22/24.
//

import SwiftUI

struct MapView: View {
    
    var body: some View {
        Canvas(rendersAsynchronously: true) { context, size in
            // as an example, I coloured Russia green
            let drawer = GeoJSONMapDrawer(featureCollection: loadGeojson(), colorDict: [
                // the keys in this dictionary corresponds to the "id" property in each feature
                "RU": Color.green
            ])
            drawer.drawMap(borderColor: .black, borderWidth: 1, size: size, context: context)
        }
        // from a quick google, 1.65 is apparently best for a mercator map
        .aspectRatio(1.65, contentMode: .fit)
    }
    
    func loadGeojson() -> MapFeatureCollection {
        let data = try! Data(contentsOf: Bundle.main.url(forResource: "world", withExtension: "json")!)
        return try! JSONDecoder().decode(MapFeatureCollection.self, from: data)
    }
}
#Preview {
    MapView()
}
