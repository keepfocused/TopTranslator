//
//  SharedPhotosData.swift
//  Degoo-iOS
//
//  Created by Agustín Prats Hernandez on 23/06/2017.
//  Copyright © 2017 Degoo Backup AB. All rights reserved.
//

import RealmSwift

class SentPhotosData: Object {
    @objc dynamic var uploadId = ""
    @objc dynamic var title: String?
    @objc dynamic var sender: String?
    @objc dynamic var creationDate: Date?
    @objc dynamic var expirationDate: Date?
    @objc dynamic var thumbnailUrl: String?
    let count = RealmOptional<Int32>()
    let ownerId = RealmOptional<Int64>()
    let photos = List<SentPhoto>()
    
    convenience init(other: SentPhotosData) {
        self.init()
        self.uploadId = other.uploadId
        self.title = other.title
        self.sender = other.sender
        self.creationDate = other.creationDate
        self.expirationDate = other.expirationDate
        self.thumbnailUrl = other.thumbnailUrl
        self.count.value = other.count.value
        self.ownerId.value = other.ownerId.value
        other.photos.forEach { self.photos.append(SentPhoto(other: $0)) }
    }
}

extension SentPhotosData {
    var isExpired: Bool {
        get {
            guard let expirationDate = self.expirationDate else { return false }
            let now = Date()
            let result = now.compare(expirationDate)
            return result == .orderedDescending || result == .orderedSame
        }
    }
}
