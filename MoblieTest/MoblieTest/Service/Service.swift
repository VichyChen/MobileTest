//
//  MTService.swift
//  MoblieTest
//
//  Created by Dajie Chen on 2025/2/15.
//

import Foundation

protocol ServiceProtocol {
    func fetchBookingData(complete: @escaping (Result<Booking, Error>) -> Void)
}

class Service : ServiceProtocol {
    
    func fetchBookingData(complete: @escaping (Result<Booking, Error>) -> Void) {
        guard let url = Bundle.main.url(forResource: "booking", withExtension: "json") else {
            complete(.failure(NSError()))
            return
        }
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let booking = try decoder.decode(Booking.self, from: data)
            complete(.success(booking))
        } catch {
            complete(.failure(error))
        }
    }
}
