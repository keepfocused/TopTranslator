//
//  Word.swift
//  TopTranslator
//
//  Created by Danil on 21.06.2018.
//  Copyright © 2018 Danil. All rights reserved.
//

import RealmSwift

class WordAsset: Object {
    @objc dynamic var word:String = ""
    @objc dynamic var foundedInTextCount:Int = 0
    @objc dynamic var firstTimeDicoveredDate: Date = Date.init()
    @objc dynamic var userNotifed:Bool = false
    @objc dynamic var showRepeats:Int = 0
    @objc dynamic var recognizedTimes:Int = 0
    @objc dynamic var unrecognizedTimes:Int = 0
    @objc dynamic var inLearn:Bool = false
    var tranlations = List<Tranlation>()
    
    override static func primaryKey() -> String? {
        return "word"
    }
}

class Tranlation: Object {
    @objc dynamic var language = ""
    @objc dynamic var translation = ""
}
