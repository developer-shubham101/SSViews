//
//  GradientView.swift
//  Currency Converter
//
//  Created by Shubham Sharma on 02/01/18.
//  Copyright © 2018 Shubham Sharma. All rights reserved.
//

import UIKit

@IBDesignable
open class SSView: UIView {
	//just random comment
	
	@IBInspectable public var gradient: Bool = false {
		didSet{
			updateView()
		}
	}
	@IBInspectable public var gradientAngle: Float = 0.0 {
		didSet{
			updateView()
		}
	}
	@IBInspectable public var gradientFirstColor: UIColor = UIColor.clear {
		didSet{
			updateView()
		}
	}
	@IBInspectable public var gradientSecondColor: UIColor = UIColor.clear {
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
	
	@IBInspectable public var shadow: Bool = false {
		didSet{
			updateView()
		}
	}
	@IBInspectable public var shadowColor: UIColor = UIColor.blue {
		didSet{
			updateView()
		}
	}
	@IBInspectable public var shadowAlpha: Float = 0.3 {
		didSet{
			updateView()
		}
	}
	@IBInspectable public var shadowRadius: CGFloat = 0 {
		didSet{
			updateView()
		}
	}
	
	@IBInspectable public var shadowX: Int = 1 {
		didSet{
			updateView()
		}
	}
	@IBInspectable public var shadowY: Int = 1 {
		didSet{
			updateView()
		}
	}
	
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
	
	@IBInspectable public var clipOuterView:Bool = false {
		didSet{
			updateView()
		}
	}
	
	override open class var layerClass: Swift.AnyClass {
		get {
			return CAGradientLayer.self
		}
	}
	 
	public override init(frame: CGRect) {
		 super.init(frame: frame)
	}
	
	required public init?(coder: NSCoder) {
		super.init(coder: coder) 
	}
	
	private func updateView(){
		//Cast layey into CAGradientLayer so we can apply gradient color
		let layer = self.layer as! CAGradientLayer
		
		layer.colors = nil
		
		//Apply gradient color on layer if gradient is on
		if gradient {
			layer.colors = [gradientFirstColor.cgColor, gradientSecondColor.cgColor]
			
			let alpha: Float = gradientAngle / 360
			let startPointX = powf(
				sinf(2 * Float.pi * ((alpha + 0.75) / 2)),
				2
			)
			let startPointY = powf(
				sinf(2 * Float.pi * ((alpha + 0) / 2)),
				2
			)
			let endPointX = powf(
				sinf(2 * Float.pi * ((alpha + 0.25) / 2)),
				2
			)
			let endPointY = powf(
				sinf(2 * Float.pi * ((alpha + 0.5) / 2)),
				2
			)
			
			layer.endPoint = CGPoint(x: CGFloat(endPointX),y: CGFloat(endPointY))
			layer.startPoint = CGPoint(x: CGFloat(startPointX), y: CGFloat(startPointY))
            
        } else {
            layer.colors = nil
        }
		
		//Apply border if border is on
		if(border){
			layer.borderWidth = borderWidth
			layer.borderColor = borderColor.cgColor
        }else{
            layer.borderWidth = 0
            layer.borderColor = nil
        }
		
		//Apply mask
		layer.masksToBounds = clipOuterView
		
		//Apply shadow if shadow is on
		if shadow {
			layer.shadowColor = shadowColor.cgColor
			layer.shadowOpacity = shadowAlpha
			layer.shadowOffset = CGSize(width: shadowX, height: shadowY)
			layer.shadowRadius = shadowRadius
        } else {
            layer.shadowColor = nil
            layer.shadowOpacity = 0.0
            layer.shadowOffset = CGSize(width: 0, height: 0)
            layer.shadowRadius = 0
        }
		
		//Apply radius if radius is on
		if(radius){
			layer.cornerRadius = radiusAmt;
			layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.layer.cornerRadius).cgPath
        }else{
            layer.cornerRadius = 0;
            layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.layer.cornerRadius).cgPath
        }
		
	}
}

