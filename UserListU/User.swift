//
//  User.swift
//  FidelityU
//
//  Created by JOSEPH KERR on 2/4/22.
//

import Foundation

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

// MARK: - UserElement
struct UserElement: Codable {
    let id: Int
    let name, username, email: String
    let address: Address
    let phone, website: String
    let company: Company
}

// MARK: - Address
struct Address: Codable {
    let street, suite, city, zipcode: String
    let geo: Geo
}

// MARK: - Geo
struct Geo: Codable {
    let lat, lng: String
}

// MARK: - Company
struct Company: Codable {
    let name, catchPhrase, bs: String
}

typealias Users = [UserElement]
