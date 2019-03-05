//
//  SecondViewController.swift
//  TopTranslator
//
//  Created by Danil on 04.11.17.
//  Copyright © 2017 Danil. All rights reserved.
//

import UIKit
import RealmSwift

class SecondViewController: ZLSwipeableViewController {
    
    var words = [WordAsset]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let realm = try? Realm() else { return }
        let learnWords = realm.objects(WordAsset.self).filter("inLearn == true")
        if learnWords.count > 0 {
            self.words = Array(learnWords)
        }
        
        self.swipeableView.numberOfActiveView = 3
    }    
}
