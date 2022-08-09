//
//  SSImageView.swift
//  SSViews
//
//  Created by Shubham Sharma on 05/07/19.
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
    
    @IBInspectable public var border: Bool = false {
        didSet{
            updateView()
        }
    }
    
    @IBInspectable public var borderWidth: CGFloat = 0 {
        didSet{
            updateView()
        }
    }
    @IBInspectable public var borderColor: UIColor = UIColor.clear {
        didSet{
            updateView()
        }
    }
    
    private var shadowLayer: CAShapeLayer = CAShapeLayer()
	
    func updateView(){
		
		//Apply mask
		layer.masksToBounds = clipOuterView
        
        //Apply radius if radius is on
        if(radius){
            self.layer.cornerRadius = radiusAmt;
            self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.layer.cornerRadius).cgPath
			
        } else{
            self.layer.cornerRadius = 0;
            self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.layer.cornerRadius).cgPath
        }
        
        //Apply border if border is on
        if(border){
            layer.borderWidth = borderWidth
            layer.borderColor = borderColor.cgColor
        }else{
            layer.borderWidth = 0
            layer.borderColor = nil
        }
    }
    
}

