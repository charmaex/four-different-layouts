//
//  ViewController.swift
//  iPadOrientationBasedLayout
//
//  Created by Jan Dammshäuser on 22.02.16.
//  Copyright © 2016 Jan Dammshäuser. All rights reserved.
//

import UIKit

extension UIView {
    
    func toggleHidden() {
        hidden = false == hidden
    }
    
}

class ViewController: UIViewController {

    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var nestedStackView: UIStackView!
    @IBOutlet weak var defaultView: UIView!
    @IBOutlet weak var secondView: UIView!
    @IBOutlet var toggleButtons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        secondView.hidden = true
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        changeSVOrientation()
    }
    
    @IBAction func toggleViews() {
        defaultView.toggleHidden()
        secondView.toggleHidden()
    }

    func changeSVOrientation() {
        if traitCollection.verticalSizeClass == .Regular && traitCollection.horizontalSizeClass == .Regular {
            
            secondView.hidden = false
            
            for button in toggleButtons {
                button.hidden = true
            }
            
            let orientation:UIInterfaceOrientation = UIApplication.sharedApplication().statusBarOrientation;
            if orientation == UIInterfaceOrientation.LandscapeLeft || orientation == UIInterfaceOrientation.LandscapeRight {
                // orientation is landscape
                stackView.axis = .Horizontal
                nestedStackView.axis = .Vertical
            }  else {
                // orientation is portrait
                stackView.axis = .Vertical
                nestedStackView.axis = .Horizontal
            }
        }
    }


}

