//
//  Store.swift
//  MoblieTest
//
//  Created by Dajie Chen on 2025/2/15.
//

import Foundation

class Store {
    
    var cacheData: Booking?
    var lastFetchDate: Date?
    var cacheExpireTime: TimeInterval = 10

    func getCacheData() -> Booking? {
        guard let cacheData = cacheData, let lastFetchDate = lastFetchDate else { return nil }
        if Date().timeIntervalSince(lastFetchDate) < cacheExpireTime {
            return cacheData
        }
        return nil
    }
    
    func setCacheData(_ data:Booking) {
        cacheData = data
//        cacheExpireTime = Double(data.duration ?? 0)
        lastFetchDate = Date()
    }
}
