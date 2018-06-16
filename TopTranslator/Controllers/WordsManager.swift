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
        
        let test = removeSpecialCharsFromString(text: content!)
        
        print(test)
        
        return content
    }
    /*
    func prepareText (text:String) -> String {
        
        let splitByLines = text.components(separatedBy: "\n")
        
        let set = CharacterSet.decimalDigits
        
        for line in splitByLines {
            
            while   line.contains(".") ||
                    line.contains("\"") ||
                    line.contains(",") ||
                    line.contains("/") ||
                    line.contains(<#T##element: Character##Character#>)
        }
        
    }
 */
    
    private func removeSpecialCharsFromString(text: String) -> String {
        let allowedChars : Set<Character> =
            Set("abcdefghijklmnopqrstuvwxyz ABCDEFGHIJKLKMNOPQRSTUVWXYZ1234567890+-*=(),.:!_".characters)
        return String(text.filter({allowedChars.contains($0)}))//.filter //{allowedChars.contains($0) })
    }
    
    
    func calculateRepeats (text:String) {
    }
    
    
}
