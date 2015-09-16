//
//  FormViewController.swift
//  MiseEnPlace
//
//  Created by PATRICK PERINI on 9/12/15.
//  Copyright © 2015 pcperini. All rights reserved.
//

import UIKit

public class FormViewController: UITableViewController {
    // MARK: Properties
    @IBOutlet public var doneButton: UIButton?
    @IBOutlet public var inputViews: [UIView] = [] {
        willSet {
            for case let control as UIControl in self.inputViews  {
                control.removeTarget(self,
                    action: "inputDidChange",
                    forControlEvents: .AllEditingEvents)
            }
        }
        
        didSet {
            for case let control as UIControl in self.inputViews  {
                control.addTarget(self,
                    action: "inputDidChange",
                    forControlEvents: .AllEditingEvents)
            }
        }
    }
    
    public var inputValid: Bool {
        return self.inputViews.reduce(true) { (value: Bool, view: UIView) in
            return self.inputIsValidForView(view) && value
        }
    }
    
    // MARK: Lifecycle
    public override func viewDidLoad() {
        super.viewDidLoad()
        self.inputDidChange()
    }
    
    // MARK: Validation Handlers
    public func inputIsValidForView(view: UIView) -> Bool {
        return false
    }
    
    // MARK: Responders
    @IBAction public func inputDidChange() {
        self.doneButton?.enabled = self.inputValid
    }
}
