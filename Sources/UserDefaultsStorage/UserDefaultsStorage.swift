import Foundation

/// Storing and reading properties from UserDefaults.
/// Returns a default value if key is not found from UserDefaults.
/// Supports also optional types.
@propertyWrapper public struct UserDefaultsStorage<Value> {
    let key: String
    let defaultValue: Value
    let storage = UserDefaults.standard
    
    public var wrappedValue: Value {
        get {
            let value = storage.value(forKey: key) as? Value
            return value ?? defaultValue
        }
        set {
            if let value = newValue as? OptionalValue, value.isOptional {
                storage.removeObject(forKey: key)
            } else {
                storage.setValue(newValue, forKey: key)
            }
            
        }
    }
}

// Convenience initializer for a case where Value is optional
extension UserDefaultsStorage where Value: ExpressibleByNilLiteral {
    init(key: String) {
        self.init(key: key, defaultValue: nil)
    }
}

/// Value might hold on optional type, but the property wrappers Value is not an Optional.
/// ValueOptional protocol makes it possible to compare newValue against nil.
private protocol OptionalValue {
    var isOptional: Bool { get }
}
/// Let's make optionals to conform to OptionalValue and get the `isOptional` property
extension Optional: OptionalValue {
    var isOptional: Bool { self == nil }
}
