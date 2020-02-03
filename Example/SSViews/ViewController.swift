//
//  ViewController.swift
//  SSViews
//
//  Created by shubhamsharma95 on 07/05/2019.
//  Copyright (c) 2019 shubhamsharma95. All rights reserved.
//

import UIKit
import SSViews

struct DropDownModel: DropDownObject {
    var firstName = ""
    var lastName =  ""
    var profile =  ""
    var age = 0
    
    func getString() -> String {
        return firstName + " " + lastName
    }
}
class ViewController: UIViewController {
    
    //MARK:- Create Refrence of SSDatePicker
    @IBOutlet weak var datePicker: SSDatePicker!
    //MARK:- Create Refrence of SSDropDown
    @IBOutlet weak var dropDown: SSDropDown!
    
    
     //MARK:- Create list for DropDown
    //you can use simple String
    fileprivate var dropDownList:[DropDownModel] = [
        DropDownModel(firstName: "Shubham", lastName: "Sharma", profile: "Full Stack Developer", age: 22),
        DropDownModel(firstName: "Paveen", lastName: "Sharma", profile: "iOS Developer", age: 28),
        DropDownModel(firstName: "Rahul", lastName: "Sharma", profile: "iOS Developer", age: 29),
        DropDownModel(firstName: "Arjun", lastName: "Das", profile: "Android Developer", age: 30)
        
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Set list to DropDown
        dropDown.data = dropDownList
        dropDown.reloadData()
        
        // Here are some properties DropDown
        dropDown.showDoneButton = true
        dropDown.hideOnChange = false
        dropDown.dropDownDelegate = self
        
        
        // Here are some properties of DatePicker
        datePicker.showDoneButton = true
        datePicker.hideOnChange = false
        datePicker.datePickerDelegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	@IBAction func didTapSwitchRadio(_ sender: SSCustomRadio) {
		sender.isOn = !sender.isOn
	}
	
}
//MARK:- Delegate of SSDropDown
extension ViewController : SSDropDownDelegate {
    func optionChange(_ ssDropDown: SSDropDown, selectedItem: DropDownObject) {
        print((selectedItem as! DropDownModel).firstName)
    }
}
//MARK:- Delegate of SSDatePicker
extension ViewController : SSDatePickerDelegate {
    func dateChange(_ ssDropDown: SSDatePicker, selectedDate: Date) {
        print(selectedDate)
    }
}
