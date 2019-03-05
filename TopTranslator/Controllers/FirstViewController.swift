//
//  FirstViewController.swift
//  TopTranslator
//
//  Created by Danil on 04.11.17.
//  Copyright © 2017 Danil. All rights reserved.
//

import UIKit
import Realm
import RealmSwift

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let wordsManager = WordsManager.shared

/*
        let lifecycleWatchDog = WatchDog(logLifecycle: true)
        let methodWatchDog = WatchDog(named: "Main watchDOG")
 */
        
        
        
        let queue = DispatchQueue.global(qos: .userInitiated)
        
        /*
        queue.async {
            let wordsData = wordsManager.getWords(fromBookNamed: "book")
            //Realm.Configuration.defaultConfiguration.deleteRealmIfMigrationNeeded = true
            guard let realm = try? Realm() else { return }
            try? realm.write {
                wordsData.words.hashValue
                realm.add(wordsData, update: true)
            }
        }
 */
 
 
 
        
    }
}

