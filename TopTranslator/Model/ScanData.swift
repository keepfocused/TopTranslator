//
//  WordsRealm.swift
//  TopTranslator
//
//  Created by Danil on 20.08.2018.
//  Copyright © 2018 Danil. All rights reserved.
//

import RealmSwift

class ScanData: Object {
    @objc dynamic var identifier: String = ""
    @objc dynamic var date: Date = Date.init()
    var words = List<WordAsset>()
    @objc dynamic var count: Int = 0
    @objc dynamic var known: Int = 0
    @objc dynamic var inLearn: Int = 0
    @objc dynamic var unshowedBefore: Bool = true
    @objc dynamic var wordsHash = 0
    
    override static func primaryKey() -> String? {
        return "wordsHash"
    }
}

