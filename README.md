# UserDefaultsStorage

Storing and reading properties from UserDefaults. Returns a default value if key is not found. Supports also optional types.

Extend  `UserDefaultsKey` to crea your own type safe keys.

## Publishing changes with Combine

There is an example `UserDefaultsPublished` in Tests, which wraps around `UserDefaultsStorage` and uses Combine to publish changes. 
