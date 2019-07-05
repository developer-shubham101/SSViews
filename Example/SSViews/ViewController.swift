//
//  ViewController.swift
//  SSViews
//
//  Created by shubhamsharma95 on 07/05/2019.
//  Copyright (c) 2019 shubhamsharma95. All rights reserved.
//

import UIKit
import SSViews
class ViewController: UIViewController {

    @IBOutlet weak var dropDown: SSDropDown!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dropDown.data = ["First", "Second", "Third"]
        dropDown.reloadData()
        dropDown.showDoneButton = true
         dropDown.hideOnChange = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

