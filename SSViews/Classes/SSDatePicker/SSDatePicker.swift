//
//  SSDatePicker.swift
//  SSViews
//
//  Created by Shubham Sharma on 05/07/19.
//


import UIKit


public protocol SSDatePickerDelegate {
    func dateChange(_ ssDropDown:SSDatePicker, selectedDate: Date)
}

open class SSDatePicker: UITextField {
    
    public var dateMode:UIDatePicker.Mode = .date
    public var datePickerDelegate:SSDatePickerDelegate?
    public var hideOnChange:Bool = false
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    override public func draw(_ rect: CGRect) {
		super.draw(rect)
        datePickerViewInit()
    }
    
    public var showDoneButton:Bool = false {
        didSet{
            datePickerViewInit()
        }
    }
    
    //    override func awakeFromNib() {
    //        datePickerViewInit()
    //    }
    //-picker
    //MARK:pickerView
    //*****************************************************
    //picker
    func datePickerViewInit(){
        
        //Create a parent view for UIPickerView
        let pickerViewWrpper = UIView(frame: CGRect(x:0, y: 200, width: UIScreen.main.bounds.width, height: 200))
        pickerViewWrpper.backgroundColor = .clear
        
        //create UIPickerView object
        let datepicker = UIDatePicker( )
        
        datepicker.backgroundColor = .clear
        //add UIPickerView into parent view
        pickerViewWrpper.addSubview(datepicker)
        
        datepicker.datePickerMode = self.dateMode
        
        //add some constraint to UIPickerView
        datepicker.translatesAutoresizingMaskIntoConstraints = false
        datepicker.leadingAnchor.constraint(equalTo: pickerViewWrpper.leadingAnchor, constant: 0).isActive = true
        datepicker.trailingAnchor.constraint(equalTo: pickerViewWrpper.trailingAnchor, constant: 0).isActive = true
        datepicker.bottomAnchor.constraint(equalTo: pickerViewWrpper.bottomAnchor, constant: 0).isActive = true
        datepicker.heightAnchor.constraint(equalToConstant: 170).isActive = true
        datepicker.addTarget(self, action: #selector(dateChanged(_:)), for: .valueChanged)
        //set data source and other stuff
        
        
        if let isoDate = text, isoDate != "" {
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            //        dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
            if let date = dateFormatter.date(from:isoDate) {
                datepicker.setDate(date, animated: true)
            }
        }
        
        
        if showDoneButton {
            
            //create UIToolbar object
            let toolBar = UIToolbar()
            
            //add UIToolbar into parent view
            pickerViewWrpper.addSubview(toolBar)
            //add some constraint to UIToolbar
            toolBar.translatesAutoresizingMaskIntoConstraints = false
            toolBar.leadingAnchor.constraint(equalTo: pickerViewWrpper.leadingAnchor, constant: 0).isActive = true
            toolBar.trailingAnchor.constraint(equalTo: pickerViewWrpper.trailingAnchor, constant: 0).isActive = true
            toolBar.topAnchor.constraint(equalTo: pickerViewWrpper.topAnchor, constant: 0).isActive = true
            //        toolBar.heightAnchor.constraint(equalToConstant: 30).isActive = true
            
            
            //add some style to UIToolbar
            toolBar.barStyle = UIBarStyle.default
            toolBar.isTranslucent = true
            //        toolBar.tintColor = UIColor(red: 76/255, green: 217/255, blue: 100/255, alpha: 1)
            toolBar.sizeToFit()
            
            //int done and cancelButton buttons
            let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.plain, target: self, action: #selector(donePicker))
            
            
            toolBar.setItems([doneButton], animated: false)
            toolBar.isUserInteractionEnabled = true
            
        }
        
        //set inputView when we enter in text field this view will show insted of keyboard
        self.inputView = pickerViewWrpper
    }
    
    @objc func donePicker(){
        resignFirstResponder()
    }
    
    @objc func dateChanged(_ sender: UIDatePicker) {
        
        let dateFormatter = DateFormatter()
        if dateMode == .date{
            //Y-m-d
            dateFormatter.dateFormat = "yyyy-MM-dd"//"dd/MM/yyyy"
            //        SubmitCodeScreen.expDate = dateFormatter.string(from: sender.date)
        }else if dateMode == .dateAndTime {
            dateFormatter.dateFormat = "yyyy-MM-dd hh:mm:ss a"
            
        }
        self.text = ""
        self.insertText(dateFormatter.string(from: sender.date))
        datePickerDelegate?.dateChange(self, selectedDate: sender.date)
        
        if hideOnChange {
            resignFirstResponder()
        }
    }
    //*****************************************************
    //End pickerView
}
