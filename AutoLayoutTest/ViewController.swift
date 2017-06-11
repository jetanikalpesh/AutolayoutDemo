//
//  ViewController.swift
//  AutoLayoutTest
//
//  Created by jetani kalpesh on 11/06/17.
//  Copyright © 2017 sigmacoder. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

 
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        /*
         let button : UIButton = UIButton.init(type: UIButtonType.custom)
         button.setTitle("Hello World", for: UIControlState.normal)
         button.setTitleColor(UIColor.black, for: UIControlState.normal)
         button.backgroundColor = UIColor.blue
         
         
         self.view.addSubview(button)
         
         button.translatesAutoresizingMaskIntoConstraints = false
         
         let topConstrant = NSLayoutConstraint.init(item: button, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: self.view, attribute: NSLayoutAttribute.top, multiplier: 1.0, constant: 100)
         
         let leftConstraint = NSLayoutConstraint.init(item: button, attribute: NSLayoutAttribute.left, relatedBy: NSLayoutRelation.equal, toItem: self.view, attribute: NSLayoutAttribute.left, multiplier: 1.0, constant: 50)
         let widthConstraint = NSLayoutConstraint.init(item: button, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.width, multiplier: 1.0, constant: 150)
         
         let heightConstraint = NSLayoutConstraint.init(item: button, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.height, multiplier: 1.0, constant: 70)
         
         self.view.addConstraint(topConstrant)
         self.view.addConstraint(leftConstraint)
         button.addConstraint(widthConstraint)
         button.addConstraint(heightConstraint)
         
         */
        
        let button2 : UIButton = UIButton.init(type: UIButtonType.custom)
        button2.setTitle("Hello World", for: UIControlState.normal)
        button2.setTitleColor(UIColor.black, for: UIControlState.normal)
        button2.backgroundColor = UIColor.blue
        
        self.view.addSubview(button2)
        
        _ = UIView.configureViewLayout(view: button2, containerView: self.view, top: 100, left: nil, bottom: nil, right: -100, width: 150, height: 50)
        //self.view.addConstraints([constraints.top!, constraints.left!, constraints.width!, constraints.height!])
        /*
        
        button2.translatesAutoresizingMaskIntoConstraints = false
        
        let topConstrant2 = NSLayoutConstraint.init(item: button2, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: self.view, attribute: NSLayoutAttribute.top, multiplier: 1.0, constant: 100)
        
        
        let rightConstraint2 = NSLayoutConstraint.init(item: button2, attribute: NSLayoutAttribute.left, relatedBy: NSLayoutRelation.equal, toItem: self.view, attribute: NSLayoutAttribute.left, multiplier: 1.0, constant: -100)
        
        //let horizontalConstraint2 = NSLayoutConstraint.init(item: button2, attribute: NSLayoutAttribute.left, relatedBy: NSLayoutRelation.equal, toItem: button, attribute: NSLayoutAttribute.right, multiplier: 1.0, constant: 50)
        
        let widthConstraint = NSLayoutConstraint.init(item: button2, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.width, multiplier: 1.0, constant: 150)
        
        let heightConstraint = NSLayoutConstraint.init(item: button2, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.height, multiplier: 1.0, constant: 70)
        
        
        self.view.addConstraint(topConstrant2)
        self.view.addConstraint(rightConstraint2)
        button2.addConstraint(widthConstraint)
        button2.addConstraint(heightConstraint)

        button2.layoutIfNeeded()
         self.view.layoutIfNeeded()
*/
        //self.view.addConstraint(horizontalConstraint2)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

