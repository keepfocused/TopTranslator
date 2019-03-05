//
//  Discover.swift
//  
//
//  Created by Danil on 01.09.2018.
//


import RealmSwift

class Discover: Object  {
    var allScannedWords = List<WordAsset>()
    var scanSessionsData = List<ScanData>()
    var preScannedSets = List<ScanData>()
    var excludeList = List<WordAsset>()
    @objc dynamic var currentScanData: ScanData?
}
