//
//  WordsManager.swift
//  TopTranslator
//
//  Created by Danil on 13.06.2018.
//  Copyright © 2018 Danil. All rights reserved.
//

import Foundation

class WordsManager {
    
    static let shared = WordsManager()
    
    public func getText() -> String? {
        
        var content:String?
        
        let path = Bundle.main.path(forResource: "quotes", ofType: "txt")
        
        do {
            let text = try String.init(contentsOfFile: path!, encoding: .utf8)
            content = text
        }
        catch {
            print("Error read text from file")
        }
        
        let clearText = removeSpecialSymbols(text: content!)
        
        let separatedWords = separateToSingleWord(text: clearText)
        
        print(separatedWords)
        
        
        
        return content
    }
    
    func removeSpecialSymbols (text:String) -> String {
        let allowedChars : Set<Character> =
            Set("abcdefghijklmnopqrstuvwxyz ABCDEFGHIJKLKMNOPQRSTUVWXYZ")
        return String(text.filter({allowedChars.contains($0)}))
    }
    
    func separateToSingleWord (text:String) -> [String] {
        let capitalized = text.capitalized
        let result = capitalized.components(separatedBy: " ")
        return result
    }
    
    
    func findDuplicates (text:String) {
        let x = [1, 1, 2, 3, 4, 5, 5]
        let duplicates = Array(Set(x.filter({ i in x.filter({ $0 == i }).count > 1})))
    }
    
    //func removeDuplicates
    
    
}

