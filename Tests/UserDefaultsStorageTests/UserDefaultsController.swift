// Copyright © 17.11.2020 Tommi Kivimäki.

import Foundation
import Combine
import UserDefaultsStorage

/// An example wrapper around `UserDefaultsStorage` shows how to use Combine
/// and subscribe to changes in UserDefaults.
final class UserDefaultsController: ObservableObject {

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


    @UserDefaultsStorage(key: "optionalTest", defaultValue: 1)
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

