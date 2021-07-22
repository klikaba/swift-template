import Foundation

class KeyChainHelper {
    // Save data in keychain in form of key value pair
    @discardableResult class func save(key: String, data: Data) -> OSStatus {
        let query = [ kSecClass as String: kSecClassGenericPassword as String,
                      kSecAttrAccount as String: key,
                      kSecValueData as String: data ] as [String: Any]

        SecItemDelete(query as CFDictionary)

        return SecItemAdd(query as CFDictionary, nil)
    }

    class func removeData(forKey key: String) {
        let query = [ kSecClass as String: kSecClassGenericPassword as String,
                      kSecAttrAccount as String: key]
        SecItemDelete(query as CFDictionary)
    }

    // Get data from keychain using key
    class func load(key: String) -> Data? {
        let query = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key,
            kSecReturnData as String: kCFBooleanTrue as Any,
            kSecMatchLimit as String: kSecMatchLimitOne
        ] as [String: Any]

        var dataTypeRef: AnyObject?

        let status: OSStatus = SecItemCopyMatching(query as CFDictionary, &dataTypeRef)

        if status == noErr {
            return dataTypeRef as? Data ?? nil
        } else {
            return nil
        }
    }
}
