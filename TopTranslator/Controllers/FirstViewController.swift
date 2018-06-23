//
//  FirstViewController.swift
//  TopTranslator
//
//  Created by Danil on 04.11.17.
//  Copyright © 2017 Danil. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let wordsManager = WordsManager.shared
        wordsManager.getWords(fromText: "full_peace")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

