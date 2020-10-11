//
//  SSDropDown.swift
//  SSViews
//
//  Created by Shubham Sharma on 05/07/19.
//


import UIKit


typealias SSDropDownString = String

public protocol DropDownObject {
    func getString() -> String
}
extension SSDropDownString: DropDownObject {
    public func getString() -> String {
        return self
    }
}
public protocol SSDropDownDelegate {
    func optionChange(_ ssDropDown:SSDropDown, selectedItem: DropDownObject)
}
open class SSDropDown: UITextField, UIPickerViewDelegate, UIPickerViewDataSource {
    
    fileprivate let picker = UIPickerView( )
    
    public var selectedItem: DropDownObject?
    public var data: [DropDownObject] = []
    public var dropDownDelegate: SSDropDownDelegate?
    
    public var showDoneButton:Bool = false {
        didSet{
            pickerViewInit()
        }
    }
    public var hideOnChange: Bool = false
    
    override public func awakeFromNib() {
		super.awakeFromNib()
        pickerViewInit()
    }
    public func reloadData() {
        picker.reloadAllComponents()
        self.text = ""
    }
    public func selectElement(element: DropDownObject, response: Bool = false){
        _selectItem(element, response: response)
        
        for (index, item) in data.enumerated(){
            if(item.getString() == element.getString()){
//                picker.selectedRow(inComponent: index)
                picker.selectRow(index, inComponent: 0, animated: true)
                break
            }
        }
    }
    
    fileprivate func _selectItem(_ element: DropDownObject, response: Bool){
        self.text = element.getString()
        selectedItem = element
        if (response) {
             dropDownDelegate?.optionChange(self, selectedItem: element)
        }
    }
    //picker
    fileprivate func pickerViewInit( ){
        
        //Create a parent view for UIPickerView
        let pickerViewWrpper = UIView(frame: CGRect(x:0, y: 200, width: 320,height: 220))
        pickerViewWrpper.backgroundColor = .clear
        
        
        
        picker.backgroundColor = .clear
        //add UIPickerView into parent view
        pickerViewWrpper.addSubview(picker)
        
        //add some constraint to UIPickerView
        picker.translatesAutoresizingMaskIntoConstraints = false
        picker.leadingAnchor.constraint(equalTo: pickerViewWrpper.leadingAnchor, constant: 0).isActive = true
        picker.trailingAnchor.constraint(equalTo: pickerViewWrpper.trailingAnchor, constant: 0).isActive = true
        picker.bottomAnchor.constraint(equalTo: pickerViewWrpper.bottomAnchor, constant: 0).isActive = true
        picker.heightAnchor.constraint(equalToConstant: 170).isActive = true
        
        //set data source and other stuff
        picker.showsSelectionIndicator = true
        picker.delegate = self
        picker.dataSource = self
        
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
    
    
    
    //-picker
    //pickerView
    //*****************************************************
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return data.count
    }
    public func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return data[row].getString()
        
    }
    public func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //        selectedGender = genderList [row]
        //        childGender.text = selectedGender
        if data.count > 0 {
            _selectItem(data[row], response: true)
           if hideOnChange {
               resignFirstResponder()
           }
        }
    }
    //*****************************************************
    //End pickerView
    
}

