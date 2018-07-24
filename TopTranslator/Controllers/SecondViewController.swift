//
//  SecondViewController.swift
//  TopTranslator
//
//  Created by Danil on 04.11.17.
//  Copyright © 2017 Danil. All rights reserved.
//

import UIKit
import ZLSwipeableViewSwift


class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var swipeableView = ZLSwipeableView(frame: CGRect(x: 0, y: 0, width: 300, height: 500))
        view.addSubview(swipeableView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

