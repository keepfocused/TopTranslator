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
    
    public func getWords(fromBookNamed bookName:String) -> ScanData {
        
        let methodWatchDog = WatchDog(named: bookName)
        let content = extractToString(bookNamedWith: bookName)
        let textWithotCodeSnippets = removeCodeTextInBrackets(text: content)
        let clearText = removeSpecialSymbols(text: textWithotCodeSnippets)
        let separatedWords = separateToSingleWord(text: clearText)
        let countedSet = NSCountedSet(array: separatedWords)
        var words = [WordAsset]()
        
        for (key, value) in countedSet.dictionary {
            
            let name = key as! String
            
            if (name.count > 2) {
                let word = WordAsset()
                word.word = name
                word.foundedInTextCount = value
                words.append(word)
            }
        }
        
        let sortedWords =  words.sorted(by:{$0.foundedInTextCount > $1.foundedInTextCount})
        
        var wordsData = ScanData()
        wordsData.words.append(objectsIn: sortedWords)
        wordsData.identifier = ProcessInfo.processInfo.globallyUniqueString
        wordsData.wordsHash = sortedWords.hashValue
        

        return wordsData
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
    
    func removeCodeTextInBrackets(text: String) -> String {
        return text.replacingOccurrences(of: "\\s?\\{[\\w\\s]*\\}", with: "", options: .regularExpression)
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
    
    func currentDate() -> String {
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"
        let result = formatter.string(from: date)
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

