//
//  SSImageView.swift
//  SSViews
//
//  Created by Arka Softwares on 05/07/19.
//

import UIKit


@IBDesignable
open class SSImageView: UIImageView {
    
    @IBInspectable public var radius:Bool = false {
        didSet{
            updateView()
        }
    }
	
    @IBInspectable public var radiusAmt:CGFloat = 0 {
        didSet{
            updateView()
        }
    }
	
	@IBInspectable public var clipOuterView:Bool = true {
		didSet{
			updateView()
		}
	}
	
    func updateView(){
		
		//Apply mask
		layer.masksToBounds = clipOuterView
        if(radius){
            self.layer.cornerRadius = radiusAmt;
            self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.layer.cornerRadius).cgPath
			
        } else{
            self.layer.cornerRadius = 0;
            self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.layer.cornerRadius).cgPath
        }
    }
    
}

