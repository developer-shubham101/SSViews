//
//  SSShadowRadusView.swift
//  Pods-SSViews_Example
//
//  Created by Shubham Sharma on 02/12/19.
//

import UIKit

open class SSShadowRadusView: UIView {
	
	@IBInspectable open var viewBackgroundColor: UIColor = UIColor.white {
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
	
	
	private var shadowLayer: CAShapeLayer = CAShapeLayer()
	
	private func updateView(){
		
		//Apply radius if radius is on
		if(radius){
			shadowLayer.path = UIBezierPath(roundedRect: bounds, cornerRadius: radiusAmt).cgPath
			//			let bgColor = (backgroundColor ?? UIColor.white).cgColor
			shadowLayer.fillColor = viewBackgroundColor.cgColor//UIColor.clear.cgColor//backgroundColor as! CGColor
		}
		//Apply shadow if shadow is on
		if shadow {
			shadowLayer.shadowColor = shadowColor.cgColor
			shadowLayer.shadowPath = shadowLayer.path
			shadowLayer.shadowOffset = CGSize(width: shadowX, height: shadowY)
			shadowLayer.shadowOpacity = shadowAlpha
			shadowLayer.shadowRadius = shadowRadius
			
			
		}
		layer.insertSublayer(shadowLayer, at: 0)
		
		backgroundColor = .clear
		
	}
	
}
