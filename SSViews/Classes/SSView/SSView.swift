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
	
	@IBInspectable public var gradient: Bool = false {
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
	
	
	private func updateView(){
		//Cast layey into CAGradientLayer so we can apply gradient color
		let layer = self.layer as! CAGradientLayer
		
		//Apply gradient color on layer if gradient is on
		if gradient {
			layer.colors = [gradientFirstColor.cgColor, gradientSecondColor.cgColor]
		}
		
		//Apply border if border is on
		if(border){
			layer.borderWidth = borderWidth
			layer.borderColor = borderColor.cgColor
		}
		
		//Apply mask
		layer.masksToBounds = clipOuterView
		
		//Apply shadow if shadow is on
		if shadow {
			layer.shadowColor = shadowColor.cgColor
			layer.shadowOpacity = shadowAlpha
			layer.shadowOffset = CGSize(width: shadowX, height: shadowY)
			layer.shadowRadius = shadowRadius
		}
		
		//Apply radius if radius is on
		if(radius){
			layer.cornerRadius = radiusAmt;
			layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.layer.cornerRadius).cgPath
			
		}
		
	}
}

