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

public protocol Pageable: NSObjectProtocol {
    // MARK: Data Handlers
    func reloadData()
    
    // MARK: Infinite Scroll Handlers
    func addInfiniteScrollWithHandler(handler: ((AnyObject!) -> Void)!)
    func finishInfiniteScroll()
    func removeInfiniteScroll()
    
    // MARK: View Handlers
    func addSubview(view: UIView)
    var subviews: [UIView] { get }
}

public protocol PageableViewController: NSObjectProtocol {
    // MARK: Properties
    var infiniteScrolls: Bool { get set }
    var refreshes: Bool { get set }
    var pageableView: Pageable? { get }
    
    // MARK: Responders
    func refreshControlWasTriggered(sender: UIRefreshControl!)
    
    // MARK: Data Handlers
    func reloadData(completion: () -> Void)
    func appendNextPage(completion: () -> Void)
}

public extension PageableViewController {
    // MARK: Properties
    var infiniteScrolls: Bool {
        get { return objc_getAssociatedObject(self, "InfiniteScrolls") as? Bool ?? false }
        set {
            objc_setAssociatedObject(self,
                "InfiniteScrolls",
                newValue,
                objc_AssociationPolicy.OBJC_ASSOCIATION_ASSIGN)
            
            if newValue {
                self.pageableView?.addInfiniteScrollWithHandler { (_) in
                    self.appendNextPage {
                        self.pageableView?.finishInfiniteScroll()
                    }
                }
            } else {
                self.pageableView?.removeInfiniteScroll()
            }
        }
    }
    
    public var refreshes: Bool {
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
                
                self.pageableView?.addSubview(refreshControl)
            } else {
                let refreshControls = self.pageableView?.subviews.filter { $0.isKindOfClass(UIRefreshControl.self) }
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
    func reloadData(completion: () -> Void = {}) {
        self.pageableView?.reloadData()
        completion()
    }
    
    func appendNextPage(completion: () -> Void = {}) {
        self.pageableView?.reloadData()
        completion()
    }
}


// MARK: Table Views
extension UITableView: Pageable {}
extension UITableViewController: PageableViewController {
    public var pageableView: Pageable? {
        return self.tableView
    }
}

// MARK: Collection Views
extension UICollectionView: Pageable {}
extension UICollectionViewController: PageableViewController {
    public var pageableView: Pageable? {
        return self.collectionView
    }
}