//
//  GeoData.swift
//  bsideTest
//
//  Created by joomin on 3/22/24.
//

import UIKit

struct Response: Decodable {
    let results: [Component]
    let status: String

    struct Component: Decodable {
        let address_components: [Address]
        let formatted_address: String
        let geometry: Geometry
        let place_id: String
        let plus_code: PlusCode?
        let types: [String]
    }

    struct Address: Decodable {
        let long_name: String
        let short_name: String
        let types : [String]
    }

    struct Geometry: Decodable {
        let location: Location
        let location_type: String
        let viewport: Viewport
    }

    struct Viewport: Decodable {
        let northeast: Location
        let southwest: Location
    }

    struct PlusCode: Decodable {
        let compound_code: String
        let global_code: String
    }

    struct Location: Decodable {
        let lat: Float
        let lng: Float
    }
}
