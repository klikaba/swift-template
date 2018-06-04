//
//  RealmDAO.swift
//  ios-skeletron
//
//  Created by Elvis Rudonja on 28/01/2018.
//  Copyright © 2018 Klika doo. All rights reserved.
//

import Foundation
import RealmSwift

class RealmDAO<T: Object> {
    let realm: Realm

    init() {
        // swiftlint:disable:next force_try
        realm = try! Realm()
    }

    func loadAll() -> Results<T> {
        return realm.objects(T.self)
    }

    func deleteAll(objects: [T]) {
        try? realm.write {
            realm.delete(objects)
        }
    }

    func insertAll(objects: [T]) {
        try? realm.write {
            realm.add(objects, update: false)
        }
    }

    internal func cleanSave(data: [T]) {
        let objectsToDelete = self.loadAll()
        deleteAll(objects: Array(objectsToDelete))
        insertAll(objects: data)
    }

    // swiftlint:disable:next identifier_name
    func load(forPrimaryKey id: String) -> T? {
        return realm.object(ofType: T.self, forPrimaryKey: id)
    }

    func insert(object: T) {
        try? realm.write {
            realm.add(object, update: false)
        }
    }

    func update(object: T) {
        try? realm.write {
            realm.add(object, update: true)
        }
    }

    func delete(object: T) {
        deleteAll(objects: [object])
    }
}
