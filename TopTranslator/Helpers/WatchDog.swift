//
//  WatchDog.swift
//  TopTranslator
//
//  Created by Danil on 23.06.2018.
//  Copyright © 2018 Danil. All rights reserved.
//

import Foundation


public final class WatchDog {
    
    // MARK:- Properties
    
    fileprivate let file: String
    fileprivate let label: String
    
    private let created = Date()
    private let logLifecycle: Bool
    
    private var destucted: Date?
    
    // MARK:- Lazy properties
    
    private lazy var name: String = self.getName()
    
    // MARK:- Lifecycle
    
    public convenience init(logLifecycle: Bool = false, in file: String = #file) {
        self.init(named: "", logLifecycle: logLifecycle, in: file)
    }
    
    public init(named label: String, logLifecycle: Bool = false, in file: String = #file) {
        self.logLifecycle = logLifecycle
        self.file = file
        self.label = label
        
        logCreate()
    }
    
    deinit {
        destucted = Date()
        logLifeTime()
        logDesctuction()
    }
    
    // MARK:- Methods
    
    private func logCreate() {
        guard logLifecycle else { return }
        //Log.verbose
        print("WatchDog[\(name)] created at: \(created)")
    }
    
    private func logDesctuction() {
        guard logLifecycle else { return }
        //Log.verbose
        print("WatchDog[\(name)] destructed at: \(destucted!)")
    }
    
    private func logLifeTime() {
        let diff = destucted!.timeIntervalSince(created)
        //Log.verbose
        print("WatchDog[\(name)] lived: \(diff) seconds")
    }
    
}

extension WatchDog {
    
    fileprivate func getName() -> String {
        if file.hasSuffix(".swift") {
            if label.isEmpty {
                return fileNameWithoutSuffix(file)
            }
            return fileNameWithoutSuffix(file) + ": " + label
        }
        return file
    }
    
    private func fileNameWithoutSuffix(_ file: String) -> String {
        let fileName = fileNameOfFile(file)
        
        if !fileName.isEmpty {
            let fileNameParts = fileName.components(separatedBy: ".")
            if let firstPart = fileNameParts.first {
                return firstPart
            }
        }
        return ""
    }
    
    private func fileNameOfFile(_ file: String) -> String {
        let fileParts = file.components(separatedBy: "/")
        if let lastPart = fileParts.last {
            return lastPart
        }
        return ""
    }
    
}
