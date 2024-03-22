//
//  AddressData.swift
//  bsideTest
//
//  Created by joomin on 3/22/24.
//

import Foundation

struct AddressData: Codable {
    let status: Status
    let results: [Result]
}

struct Status: Codable {
    let code: Int
    let name: String
    let message: String
}

struct Result: Codable {
    let name: String
    let code: Code
    let region: Region
}

struct Code: Codable {
    let id: String
    let type: String
    let mappingId: String
}

struct Region: Codable {
    let area0: Area
    let area1: Area
    let area2: Area
    let area3: Area
    let area4: Area
}

struct Area: Codable {
    let name: String
    let coords: Coords
    let alias: String?
}

struct Coords: Codable {
    let center: Center
}

struct Center: Codable {
    let crs: String
    let x: Double
    let y: Double
}

