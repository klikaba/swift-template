import Foundation
import RealmSwift

class RealmDAO<T: Object> {
    private let realm: Realm

    init() {
        let configuration = Realm.Configuration(
            deleteRealmIfMigrationNeeded: true
        )
        realm = try! Realm(configuration: configuration)
    }

    func writeTransaction(closure: () -> Void) {
        try? realm.write {
            closure()
        }
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
            realm.add(objects, update: .error)
        }
    }

    func cleanSave(data: [T]) {
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
            realm.add(object, update: .error)
        }
    }

    func update(object: T) {
        try? realm.write {
            realm.add(object, update: .modified)
        }
    }

    func update(objects: [T]) {
        try? realm.write {
            realm.add(objects, update: .modified)
        }
    }

    func delete(object: T) {
        deleteAll(objects: [object])
    }
}
