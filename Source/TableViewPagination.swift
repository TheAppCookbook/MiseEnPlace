//
//  TableViewPagination.swift
//  MiseEnPlace
//
//  Created by PATRICK PERINI on 9/12/15.
//  Copyright © 2015 pcperini. All rights reserved.
//

import UIKit
import ObjectiveC
import UIScrollView_InfiniteScroll

@IBDesignable public extension UITableViewController {
    // MARK: Properties
    @IBInspectable var infiniteScrolls: Bool {
        get { return objc_getAssociatedObject(self, "InfiniteScrolls") as? Bool ?? false }
        set {
            objc_setAssociatedObject(self,
                "InfiniteScrolls",
                newValue,
                objc_AssociationPolicy.OBJC_ASSOCIATION_ASSIGN)
            
            if newValue {
                self.tableView.addInfiniteScrollWithHandler { (_) in
                    self.appendNextPage {
                        self.tableView.finishInfiniteScroll()
                    }
                }
            } else {
                self.tableView.removeInfiniteScroll()
            }
        }
    }
    
    @IBInspectable var refreshes: Bool {
        get { return objc_getAssociatedObject(self, "Refreshes") as? Bool ?? false }
        set {
            objc_setAssociatedObject(self,
                "Refreshes",
                newValue,
                objc_AssociationPolicy.OBJC_ASSOCIATION_ASSIGN)
            
            if newValue {
                let refreshControl = UIRefreshControl()
                refreshControl.addTarget(self,
                    action: "refreshControlWasTriggered:",
                    forControlEvents: .ValueChanged)
                
                self.tableView.addSubview(refreshControl)
            } else {
                let refreshControls = self.tableView.subviews.filter { $0.isKindOfClass(UIRefreshControl.self) }
                refreshControls.forEach { $0.removeFromSuperview() }
            }
        }
    }
    
    // MARK: Responders
    func refreshControlWasTriggered(sender: UIRefreshControl!) {
        self.reloadData {
            sender.endRefreshing()
        }
    }
    
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

@IBDesignable public extension UICollectionViewController {
    // MARK: Properties
    @IBInspectable var infiniteScrolls: Bool {
        get { return objc_getAssociatedObject(self, "InfiniteScrolls") as? Bool ?? false }
        set {
            objc_setAssociatedObject(self,
                "InfiniteScrolls",
                newValue,
                objc_AssociationPolicy.OBJC_ASSOCIATION_ASSIGN)
            
            if newValue {
                self.collectionView?.addInfiniteScrollWithHandler { (_) in
                    self.appendNextPage {
                        self.collectionView?.finishInfiniteScroll()
                    }
                }
            } else {
                self.collectionView?.removeInfiniteScroll()
            }
        }
    }
    
    @IBInspectable var refreshes: Bool {
        get { return objc_getAssociatedObject(self, "Refreshes") as? Bool ?? false }
        set {
            objc_setAssociatedObject(self,
                "Refreshes",
                newValue,
                objc_AssociationPolicy.OBJC_ASSOCIATION_ASSIGN)
            
            if newValue {
                let refreshControl = UIRefreshControl()
                refreshControl.addTarget(self,
                    action: "refreshControlWasTriggered:",
                    forControlEvents: .ValueChanged)
                
                self.collectionView?.addSubview(refreshControl)
            } else {
                let refreshControls = self.collectionView?.subviews.filter { $0.isKindOfClass(UIRefreshControl.self) }
                refreshControls?.forEach { $0.removeFromSuperview() }
            }
        }
    }
    
    // MARK: Responders
    func refreshControlWasTriggered(sender: UIRefreshControl!) {
        self.reloadData {
            sender.endRefreshing()
        }
    }
    
    // MARK: Data Handlers
    public func reloadData(completion: () -> Void = {}) {
        self.collectionView?.reloadData()
        completion()
    }
    
    public func appendNextPage(completion: () -> Void = {}) {
        self.collectionView?.reloadData()
        completion()
    }
}