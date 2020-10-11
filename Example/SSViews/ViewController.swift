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
    
    
    
    @IBOutlet weak var sampleButton: SSButton!
    @IBOutlet weak var sampleImageVIew: SSImageView!
    @IBOutlet weak var sampleView: SSView!
	
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
         
        dropDown.selectElement(element: dropDownList[1])
        
        // Here are some properties DropDown
        dropDown.showDoneButton = true
        dropDown.hideOnChange = false
        dropDown.dropDownDelegate = self
        
        
        // Here are some properties of DatePicker
        datePicker.showDoneButton = true
        datePicker.hideOnChange = false
        datePicker.datePickerDelegate = self
		
		
		sampleView.borderWidth = 1
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
	}
    @IBAction func didTapSwitchImageRadius(_ sender: SSCustomRadio) {
        sender.isOn = !sender.isOn
        sampleImageVIew.radius = sender.isOn
    }
    @IBAction func didTapSwitchButtonShadow(_ sender: SSCustomRadio) {
        sender.isOn = !sender.isOn
        if sender.isOn {
            sampleButton.shadowColor = UIColor.lightGray
        }else {
            sampleButton.shadowColor = UIColor.systemYellow
        }
    }
	@IBAction func didTapSwitchRadioColor(_ sender: SSCustomRadio) {
        sender.isOn = !sender.isOn
        if sender.isOn {
            sampleView.shadowColor = UIColor.lightGray
            sampleView.gradientAngle = 45
        }else {
            sampleView.shadowColor = UIColor.systemYellow
            sampleView.gradientAngle = 0
        }
    }
    @IBAction func didTapSwitchRadio(_ sender: SSCustomRadio) {
        sender.isOn = !sender.isOn
        if sender.isOn {
            sampleView.shadow = false
            sampleView.radius = false
            sampleView.border = false
            sampleView.gradient = false
        } else {
            sampleView.shadow = true
            sampleView.radius = true
            sampleView.border = true
            sampleView.gradient = false
        }
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
