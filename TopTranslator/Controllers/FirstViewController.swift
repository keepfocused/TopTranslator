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
        
        let lifecycleWatchDog = WatchDog(logLifecycle: true)
        
        let methodWatchDog = WatchDog(named: "Main watchDOG")
        
        let queue = DispatchQueue.global(qos: .userInitiated)
        
        queue.async {
            wordsManager.getWords(fromBookNamed: "full_peace1")
        }
        
        queue.async {
            wordsManager.getWords(fromBookNamed: "full_peace2")
        }
        
        queue.async {
            wordsManager.getWords(fromBookNamed: "karenina1")
        }
        
        queue.async {
            wordsManager.getWords(fromBookNamed: "karenina2")
        }
        
        queue.async {
            wordsManager.getWords(fromBookNamed: "karenina3")
        }
        
        queue.async {
            wordsManager.getWords(fromBookNamed: "karenina4")
        }
        
        queue.async {
            wordsManager.getWords(fromBookNamed: "war_peace1")
        }
        
        queue.async {
            wordsManager.getWords(fromBookNamed: "war_peace2")
        }
        
        queue.async {
            wordsManager.getWords(fromBookNamed: "war_peace3")
        }
        
        queue.async {
            wordsManager.getWords(fromBookNamed: "war_peace4")
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

