//
//  KeyboardTestViewController.swift
//  MiseEnPlace
//
//  Created by PATRICK PERINI on 9/12/15.
//  Copyright © 2015 pcperini. All rights reserved.
//

import UIKit

class KeyboardTestViewController: UIViewController {
    // MARK: Responders
    @IBAction func tapGestureWasRecognized(sender: UITapGestureRecognizer!) {
        self.view.endEditing(false)
    }
}
