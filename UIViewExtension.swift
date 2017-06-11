//
//  AppDelegate.swift
//  AutoLayoutTest
//
//  Created by jetani kalpesh on 27/08/16.
//  Copyright © 2017 sigmacoder. All rights reserved.
//

import Foundation
import UIKit


extension UIView {
    
    func bindFrameToSuperviewBounds() {
        guard let superview = self.superview else {
            print("Error! `superview` was nil – call `addSubview(view: UIView)` before calling `bindFrameToSuperviewBounds()` to fix this.")
            return
        }
        
        self.translatesAutoresizingMaskIntoConstraints = false
        superview.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[subview]-0-|", options: .directionLeadingToTrailing, metrics: nil, views: ["subview": self]))
        superview.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[subview]-0-|", options: .directionLeadingToTrailing, metrics: nil, views: ["subview": self]))
    }
    
    func bindFrameToSuperviewTop(top:CGFloat, left:CGFloat, bottom:CGFloat, right:CGFloat) {
        guard let superview = self.superview else {
            print("Error! `superview` was nil – call `addSubview(view: UIView)` before calling `bindFrameToSuperviewBounds()` to fix this.")
            return
        }
        
        self.translatesAutoresizingMaskIntoConstraints = false
        superview.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-\(left)-[subview]-\(right)-|", options: .directionLeadingToTrailing, metrics: nil, views: ["subview": self]))
        superview.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-\(top)-[subview]-\(bottom)-|", options: .directionLeadingToTrailing, metrics: nil, views: ["subview": self]))
    }
    
    func bindFrameToSuperviewWithHeight(height:CGFloat, left:CGFloat, bottom:CGFloat, right:CGFloat) {
        guard let superview = self.superview else {
            print("Error! `superview` was nil – call `addSubview(view: UIView)` before calling `bindFrameToSuperviewBounds()` to fix this.")
            return
        }
        
        self.translatesAutoresizingMaskIntoConstraints = false
        superview.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[subview(\(height))]-\(bottom)-|", options: .directionLeadingToTrailing, metrics: nil, views: ["subview": self]))
        superview.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-\(left)-[subview]-\(right)-|", options: .directionLeadingToTrailing, metrics: nil, views: ["subview": self]))
    }
    
    /*
    func bindFrameToSuperviewTop(top:CGFloat, left:CGFloat, width:CGFloat, height:CGFloat) {
        guard let superview = self.superview else {
            print("Error! `superview` was nil – call `addSubview(view: UIView)` before calling `bindFrameToSuperviewBounds()` to fix this.")
            return
        }
        self.translatesAutoresizingMaskIntoConstraints = false
        superview.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-\(top)-[subview(\(height))]", options: .DirectionLeadingToTrailing, metrics: nil, views: ["subview": self]))
        superview.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-\(left)-[subview(\(width))]", options: .DirectionLeadingToTrailing, metrics: nil, views: ["subview": self]))
    }*/
    
    func bindFrameToSuperviewTop(top:CGFloat, right:CGFloat, width:CGFloat, height:CGFloat) {
        guard let superview = self.superview else {
            print("Error! `superview` was nil – call `addSubview(view: UIView)` before calling `bindFrameToSuperviewBounds()` to fix this.")
            return
        }
        self.translatesAutoresizingMaskIntoConstraints = false
        superview.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-\(top)-[subview(\(height))]", options: .directionLeadingToTrailing, metrics: nil, views: ["subview": self]))
        superview.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[subview(\(width))]-\(right)-|", options: .directionLeadingToTrailing, metrics: nil, views: ["subview": self]))
    }
    
    func rotateView(rotate : Bool = true) {
        
        let kRotationAnimationKey = "com.myapplication.rotationanimationkey"
        if self.layer.animation(forKey: kRotationAnimationKey) == nil {
            let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation")
            
            rotationAnimation.fromValue = 0.0
            rotationAnimation.toValue = Float(M_PI * 2.0)
            rotationAnimation.duration = 2.0
            rotationAnimation.repeatCount = Float.infinity
            
            self.layer.add(rotationAnimation, forKey: kRotationAnimationKey)
        }
        else{
            self.layer.removeAnimation(forKey: kRotationAnimationKey)
        }
    }
    
    
    //func addDropShadowToCircleView(){
    //    
    //    let shadowLayer = UIView(frame: self.frame)
    //    
    //    shadowLayer.backgroundColor = UIColor.clearColor()
    //    shadowLayer.layer.shadowColor = UIColor.darkGrayColor().CGColor
    //    shadowLayer.layer.rasterizationScale = 45
    //    shadowLayer.layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: self.frame.size.width/2.0).CGPath
    //    shadowLayer.layer.shadowOffset = CGSize(width: -0.5, height: 0.5)
    //    shadowLayer.layer.shadowOpacity = 0.1
    //    shadowLayer.layer.shadowRadius = 1.0
    //    shadowLayer.layer.masksToBounds = true
    //    shadowLayer.clipsToBounds = false
    //    
    //    self.addSubview(shadowLayer)
    //    
    //    //self.layer.masksToBounds =  false
    //    //self.layer.shadowColor = UIColor.grayColor().CGColor;
    //    //self.layer.shadowOffset = CGSizeMake(2.0, 2.0)
    //    //self.layer.shadowRadius = radius
    //    //self.layer.shadowOpacity = 1.0
    //}
    
    
    static func configureViewLayout(view : UIView?, containerView : UIView?,top : CGFloat?, left : CGFloat?, bottom : CGFloat?, right : CGFloat?, width : CGFloat?, height : CGFloat?) -> (top : NSLayoutConstraint?, left: NSLayoutConstraint?, bottom: NSLayoutConstraint?, right : NSLayoutConstraint?, width : NSLayoutConstraint?, height : NSLayoutConstraint?) {
        
        if let viewConfigure = view,
            let superView = containerView {
            
            superView.addSubview(viewConfigure)
            viewConfigure.translatesAutoresizingMaskIntoConstraints = false
            viewConfigure.removeConstraints(viewConfigure.constraints)
            var const_top     : NSLayoutConstraint?
            var const_left    : NSLayoutConstraint?
            var const_bottom  : NSLayoutConstraint?
            var const_right   : NSLayoutConstraint?
            var const_width   : NSLayoutConstraint?
            var const_height  : NSLayoutConstraint?
            
            if let value = top {
                const_top = NSLayoutConstraint(item: viewConfigure, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: superView, attribute: NSLayoutAttribute.top, multiplier: 1.0, constant: value)
                superView.addConstraint(const_top!)
            }
            
            if let value = left {
                const_left = NSLayoutConstraint(item: viewConfigure, attribute: NSLayoutAttribute.left, relatedBy: NSLayoutRelation.equal, toItem: superView, attribute: NSLayoutAttribute.left, multiplier: 1.0, constant: value)
                superView.addConstraint(const_left!)
            }
            
            if let value = bottom{
                const_bottom = NSLayoutConstraint(item: viewConfigure, attribute: NSLayoutAttribute.bottom, relatedBy: NSLayoutRelation.equal, toItem: superView, attribute: NSLayoutAttribute.bottom, multiplier: 1.0, constant: value)
                superView.addConstraint(const_bottom!)
            }
            
            if let value = right {
                const_right = NSLayoutConstraint(item: viewConfigure, attribute: NSLayoutAttribute.right, relatedBy: NSLayoutRelation.equal, toItem: superView, attribute: NSLayoutAttribute.right, multiplier: 1.0, constant: value)
                superView.addConstraint(const_right!)
            }
            
            if let value = width {
                const_width = NSLayoutConstraint(item: viewConfigure, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.width, multiplier: 1.0, constant: value)
                viewConfigure.addConstraint(const_width!)
            }
            
            if let value = height {
                const_height = NSLayoutConstraint(item: viewConfigure, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.height, multiplier: 1.0, constant: value)
                viewConfigure.addConstraint(const_height!)
            }
            
            viewConfigure.layoutIfNeeded()
            superView.layoutIfNeeded()
            return (const_top,
                    const_left,
                    const_bottom,
                    const_right,
                    const_width,
                    const_height)
        }
        
        return (nil, nil, nil, nil, nil, nil)
    }
    
    static func configureViewCenterLayout(view : UIView?, containerView : UIView?, width : CGFloat?, height : CGFloat?, centerOffsetX : CGFloat?,centerOffsetY : CGFloat?) -> (width : NSLayoutConstraint?, height : NSLayoutConstraint?,const_center_X_offset : NSLayoutConstraint?, const_center_Y_offset  : NSLayoutConstraint?) {
    
        if let viewConfigure = view,
            let superView = containerView {
            
            superView.addSubview(viewConfigure)
            viewConfigure.translatesAutoresizingMaskIntoConstraints = false
            viewConfigure.removeConstraints(viewConfigure.constraints)
            var const_width   : NSLayoutConstraint?
            var const_height  : NSLayoutConstraint?
            var const_center_Y_offset   : NSLayoutConstraint?
            var const_center_X_offset  : NSLayoutConstraint?
            
            if let value = centerOffsetX {
                const_center_X_offset = NSLayoutConstraint(item: viewConfigure, attribute: NSLayoutAttribute.centerX, relatedBy: NSLayoutRelation.equal, toItem: superView, attribute: NSLayoutAttribute.centerX, multiplier: 1.0, constant: value)
                superView.addConstraint(const_center_X_offset!)
            }
            
            if let value = centerOffsetY {
                const_center_Y_offset = NSLayoutConstraint(item: viewConfigure, attribute: NSLayoutAttribute.centerY, relatedBy: NSLayoutRelation.equal, toItem: superView, attribute: NSLayoutAttribute.centerY, multiplier: 1.0, constant: value)
                superView.addConstraint(const_center_Y_offset!)
            }
            
            if let value = width {
                const_width = NSLayoutConstraint(item: viewConfigure, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.width, multiplier: 1.0, constant: value)
                viewConfigure.addConstraint(const_width!)
            }
            
            if let value = height {
                const_height = NSLayoutConstraint(item: viewConfigure, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.height, multiplier: 1.0, constant: value)
                viewConfigure.addConstraint(const_height!)
            }
            
            
            
            viewConfigure.layoutIfNeeded()
            superView.layoutIfNeeded()
            return (const_width,
                    const_height, const_center_X_offset, const_center_Y_offset)
        }
        
        return (nil, nil, nil, nil)
    }
}
