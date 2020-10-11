//
//  SSCustomRadio.swift
//  UpgradeMySelf-ios
//
//  Created by Shubham Sharma on 26/06/19.
//  Copyright © 2019 Shubham Sharma. All rights reserved.
//

import UIKit
@IBDesignable
open class SSCustomRadio: SSButton {
	public var isOn:Bool = false {
		didSet {
			updateView()
		}
	}
	@IBInspectable public var changeImage: Bool = false {
		didSet{
			updateView()
		}
	}
	@IBInspectable public var changeBackGroundConr: Bool = false {
		didSet{
			updateView()
		}
	}
	@IBInspectable public var applyTint: Bool = false {
		didSet{
			updateView()
		}
	}
	@IBInspectable public var defaultColor: UIColor = UIColor.clear {
		didSet{
			updateView()
		}
	}
	@IBInspectable public var highlitedColor: UIColor = UIColor.clear {
		didSet{
			updateView()
		}
	}
	@IBInspectable public var defaultImage: UIImage? {
		didSet{
			updateView()
		}
	}
	@IBInspectable public var highlitedImage: UIImage? {
		didSet{
			updateView()
		}
	}
    
    public var userData: String = ""
	
	
	func updateView(){
		
		if changeImage {
			if(isOn){
				if applyTint {
					tintColor = highlitedColor
				}
				
				if let hImage = highlitedImage {
					setImage(hImage, for: .normal)
				}else if let dImage = defaultImage {
					setImage(dImage, for: .normal)
				}
			}else{
				if applyTint {
					tintColor = defaultColor
				}
				
				if let dImage = defaultImage {
					setImage(dImage, for: .normal)
				}
			}
		}
		if changeBackGroundConr {
			if(isOn){
				backgroundColor = highlitedColor
			}else{
				backgroundColor = defaultColor
			}
		} 
	}
	
}
