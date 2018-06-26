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
    
    let lifecycleWatchDog = WatchDog(logLifecycle: true)
    
    public func getWords(fromBookNamed bookName:String) -> [Word] {
        
        let methodWatchDog = WatchDog(named: bookName)
        
        let content = extractToString(bookNamedWith: bookName)
        
        let clearText = removeSpecialSymbols(text: content)
        
        let separatedWords = separateToSingleWord(text: clearText)

        let countedSet = NSCountedSet(array: separatedWords)
        
        var words = [Word]()
        
        for (key, value) in countedSet.dictionary {
            
            let name = key as! String
            
            if (name.count > 2) {
                let word = Word.init(withName: name, withCount: value)
                words.append(word)
            }
        }
        
        let sortedWords =  words.sorted(by:{$0.count > $1.count})
        
        let result = sortedWords

        return result
    }
    
    func extractToString(bookNamedWith bookName:String) -> String {
        
        var content:String?
        
        let path = Bundle.main.path(forResource: bookName, ofType: "txt")
        
        do {
            let text = try String.init(contentsOfFile: path!, encoding: .utf8)
            content = text
        }
        catch {
            print("Error read text from file")
        }
        
        return content!
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
    
}

extension NSCountedSet {
    var occurences: [(object: Any, count: Int)] {
        return allObjects.map { ($0, count(for: $0))}
    }
    var dictionary: [AnyHashable: Int] {
        return allObjects.reduce(into: [AnyHashable: Int](), {
            guard let key = $1 as? AnyHashable else { return }
            $0[key] = count(for: key)
        })
    }
}

