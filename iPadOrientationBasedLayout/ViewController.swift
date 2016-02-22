//
//  ViewController.swift
//  iPadOrientationBasedLayout
//
//  Created by Jan Dammshäuser on 22.02.16.
//  Copyright © 2016 Jan Dammshäuser. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var nestedStackView: UIStackView!
    @IBOutlet weak var iPadOnlyView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        changeSVOrientation()
    }

    func changeSVOrientation() {
        if traitCollection.verticalSizeClass == .Regular && traitCollection.horizontalSizeClass == .Regular {
            
            iPadOnlyView.hidden = false
            
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

