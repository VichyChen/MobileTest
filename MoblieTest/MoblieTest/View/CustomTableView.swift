//
//  CustomTableView.swift
//  MoblieTest
//
//  Created by Dajie Chen on 2025/2/15.
//

import Foundation
import UIKit

class CustomTableView : UITableView, UITableViewDataSource, UITableViewDelegate {
    
    private var _booking: Booking?

    var booking : Booking? {
        get {
            return _booking
        }
        set {
            _booking = newValue
            self.reloadData()
            self.endRefreshing()
        }
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        self.delegate = self
        self.dataSource = self
        self.refreshControl = UIRefreshControl()
    }
    
    func endRefreshing() {
        self.refreshControl?.endRefreshing()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let segments = self.booking?.segments else { return 0 }
        return segments.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as? CustomTableViewCell else {
            fatalError("some unknown error occurred")
        }
        if let segment = self.booking?.segments?[indexPath.row] {
            cell.idLabel.text = String(segment.id ?? 0)
            cell.titleLabel.text = "origin: \(segment.originAndDestinationPair?.originCity ?? "") -> destination: \(segment.originAndDestinationPair?.destinationCity ?? "")"
        }

        return cell
    }
}
