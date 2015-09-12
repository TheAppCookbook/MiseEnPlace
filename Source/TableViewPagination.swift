//
//  TableViewPagination.swift
//  MiseEnPlace
//
//  Created by PATRICK PERINI on 9/12/15.
//  Copyright © 2015 pcperini. All rights reserved.
//

import UIKit

public extension UITableViewController {
    // MARK: Data Handlers
    public func reloadData(completion: () -> Void = {}) {
        self.tableView.reloadData()
        completion()
    }
    
    public func appendNextPage(completion: () -> Void = {}) {
        self.tableView.reloadData()
        completion()
    }
}