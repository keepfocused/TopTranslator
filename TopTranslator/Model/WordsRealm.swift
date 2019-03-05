//
//  WordsRealm.swift
//  TopTranslator
//
//  Created by Danil on 20.08.2018.
//  Copyright © 2018 Danil. All rights reserved.
//

import RealmSwift

class WordData: Object {
    @objc dynamic var identifier: String?
    @objc dynamic var date: String?
    let words = List<Word>()
}

