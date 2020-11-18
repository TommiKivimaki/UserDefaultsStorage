// Copyright © 18.11.2020 Tommi Kivimäki.

import Foundation


/// Type safe key for UserDefaults
/// Extend this key to create your own keys
///
///     extension UserDefaultsKey {
///         static let myKey = "myKey"
///     }
public struct UserDefaultsKey: RawRepresentable {
    public let rawValue: String

    public init?(rawValue: String) {
        self.rawValue = rawValue
    }
}

extension UserDefaultsKey: ExpressibleByStringLiteral {
    public init(stringLiteral value: StringLiteralType) {
        self.rawValue = value
    }
}
