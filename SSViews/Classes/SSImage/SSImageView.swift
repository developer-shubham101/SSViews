//
//  SSImageView.swift
//  SSViews
//
//  Created by Arka Softwares on 05/07/19.
//

import UIKit


@IBDesignable
open class SSImageView: UIImageView {
    
    @IBInspectable var radius:Bool = false {
        didSet{
            updateRadius()
        }
    }
    //    @IBInspectable var ShadowX:Int = 1 {
    //        didSet{
    //            updateRadius()
    //        }
    //    }
    //    @IBInspectable var ShadowY:Int = 1 {
    //        didSet{
    //            updateRadius()
    //        }
    //    }
    
    
    @IBInspectable var radiusAmt:CGFloat = 0 {
        didSet{
            updateRadius()
        }
    }
    
    
    
    
    func updateRadius(){
        if(radius){
            self.layer.cornerRadius = radiusAmt;
            self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.layer.cornerRadius).cgPath
            self.layer.masksToBounds = true;
        }
    }
    
}

