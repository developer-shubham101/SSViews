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
    
	@IBOutlet weak var sampleView: SSView!
	
	@IBOutlet weak var sampleImage: SSImageView!
	
	@IBOutlet weak var sampleBtn: SSButton!
	
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
		dropDown.selectElement = dropDownList[1]
        
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
	@IBAction func didTapSwitchRadio(_ sender: SSCustomRadio) {
		sender.isOn = !sender.isOn
		if sender.isOn {
			sampleView.shadowColor = UIColor.lightGray
			sampleView.gradientAngle = 45
		}else {
			sampleView.shadowColor = UIColor.systemYellow
			sampleView.gradientAngle = 0
		}
	}

	@IBAction func didTapToggleViewAttributes(_ sender: SSCustomRadio) {
		sender.isOn = !sender.isOn
		
		
		sampleView.gradient = sender.isOn
		
		sampleView.shadow = sender.isOn
		
		sampleView.radius = sender.isOn
		
		sampleView.border = sender.isOn
		
	}
	@IBAction func didTapToggleImageAttribute(_ sender: Any) {
		sampleBtn.radius = false
		sampleBtn.shadow = false
		sampleImage.radius = false
		
//		sampleBtn.radiusAmt = 3
//		sampleImage.radiusAmt = 3
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
