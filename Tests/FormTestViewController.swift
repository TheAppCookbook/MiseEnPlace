//
//  FormTestViewController.swift
//  MiseEnPlace
//
//  Created by PATRICK PERINI on 9/12/15.
//  Copyright © 2015 pcperini. All rights reserved.
//

import UIKit

class FormTestViewController: FormViewController {
    override func inputIsValidForView(view: UIView) -> Bool {
        guard let textField = view as? UITextField else { return false }
        switch textField.tag {
        case 1: // Username
            return textField.text?.characters.count > 0
        
        case 2: // Password
            return textField.text?.characters.count >= 10
            
        default:
            return false
        }
    }
    
    @IBAction func doneButtonWasPressed(sender: UIButton!) {
        self.navigationController?.popViewControllerAnimated(true)
    }
}
