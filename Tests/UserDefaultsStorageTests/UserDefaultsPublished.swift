// Copyright © 17.11.2020 Tommi Kivimäki.

import Foundation
import Combine
import UserDefaultsStorage

/// An example wrapper around `UserDefaultsStorage`. Shows how to use Combine
/// and publish the changes in UserDefaults.
final class UserDefaultsPublished: ObservableObject {

    @UserDefaultsStorage(key: "isTest", defaultValue: false)
    var isTest: Bool {
        willSet {
            objectWillChange.send()
        }
        didSet {
            isTestSubject.send(isTest)
        }
    }

    private let isTestSubject = PassthroughSubject<Bool, Never>()
    var isTestPublisher: AnyPublisher<Bool, Never> {
        isTestSubject.eraseToAnyPublisher()
    }


    @UserDefaultsStorage(key: "optionalTest")
    var optionalTest: Int? {
        willSet {
            objectWillChange.send()
        }
        didSet {
            optionalTestSubject.send(optionalTest)
        }
    }

    private let optionalTestSubject = PassthroughSubject<Int?, Never>()
    var optionalTestPublisher: AnyPublisher<Int?, Never> {
        optionalTestSubject.eraseToAnyPublisher()
    }
}

