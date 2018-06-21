//
//  Word.swift
//  TopTranslator
//
//  Created by Danil on 21.06.2018.
//  Copyright © 2018 Danil. All rights reserved.
//

import Foundation

struct Word {
    var name:String
    var count:Int
    var unknown:Bool?
    
    init(withName name:String, withCount count:Int) {
        self.name = name
        self.count = count
    }
}
