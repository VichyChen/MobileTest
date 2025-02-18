//
//  MTBooking.swift
//  MoblieTest
//
//  Created by Dajie Chen on 2025/2/15.
//

import Foundation

struct Booking: Codable {
    let shipReference: String?
    let shipToken: String?
    let canIssueTicketChecking: Bool?
    let expiryTime: String?
    let duration: Int?
    let segments: [Segment]?
}

struct Segment: Codable {
    let id: Int?
    let originAndDestinationPair: OriginAndDestinationPair?
}

struct OriginAndDestinationPair: Codable {
    let destination: Destination?
    let destinationCity: String?
    let origin: Destination?
    let originCity: String?
}

struct Destination: Codable {
    let code: String?
    let displayName: String?
    let url: String?
}


