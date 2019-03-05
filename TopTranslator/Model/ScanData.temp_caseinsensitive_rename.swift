//
//  WordsRealm.swift
//  TopTranslator
//
//  Created by Danil on 20.08.2018.
//  Copyright © 2018 Danil. All rights reserved.
//

import RealmSwift

class scanData: Object {
    @objc dynamic var identifier: String
    @objc dynamic var date: String
    var words = List<Word>()
    @objc dynamic var count: Int
    @objc dynamic var known: Int
    @objc dynamic var inLearn: Int
    @objc dynamic var unshowedBefore: Bool
}

