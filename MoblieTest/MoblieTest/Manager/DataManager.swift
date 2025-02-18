//
//  MTDataManager.swift
//  MoblieTest
//
//  Created by Dajie Chen on 2025/2/15.
//

import Foundation

class MTDataManager {
    
    let service: ServiceProtocol = Service()
    let store: Store = Store()
    
    func fetchData(forceRefresh: Bool = false, complete: @escaping (Result<Booking, Error>) -> Void) {
        if !forceRefresh, let cacheData = store.getCacheData() {
            print("cacheData: \(cacheData)")
            complete(.success(cacheData))
            return
        }
        
        service.fetchBookingData { [weak self] result in
            switch result {
            case .success(let booking):
                self?.store.setCacheData(booking)
                print("serviceData: \(booking)")
                complete(.success(booking))
            case .failure:
                complete(.failure(NSError()))
            }
        }
    }
}
