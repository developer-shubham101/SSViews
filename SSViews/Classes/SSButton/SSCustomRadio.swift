//
//  SSCustomRadio.swift
//  UpgradeMySelf-ios
//
//  Created by Arka Softwares on 26/06/19.
//  Copyright © 2019 Arka Softwares. All rights reserved.
//

import UIKit
@IBDesignable
open class SSCustomRadio: SSButton {
	public var isOn:Bool = false {
		didSet {
			updateView()
		}
	}
	@IBInspectable var changeImage: Bool = false {
		didSet{
			updateView()
		}
	}
	@IBInspectable var changeBackGroundConr: Bool = false {
		didSet{
			updateView()
		}
	}
	@IBInspectable var applyTint: Bool = false {
		didSet{
			updateView()
		}
	}
	@IBInspectable var defaultColor: UIColor = UIColor.clear {
		didSet{
			updateView()
		}
	}
	@IBInspectable var highlitedColor: UIColor = UIColor.clear {
		didSet{
			updateView()
		}
	}
	@IBInspectable var defaultImage: UIImage? {
		didSet{
			updateView()
		}
	}
	@IBInspectable var highlitedImage: UIImage? {
		didSet{
			updateView()
		}
	}
	
	
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
