import Foundation

struct User {
    let id: String = UUID().uuidString
    let name: String
    let surname: String
    let createdDate: Date = Date()
    
    static func generateRandom() -> [User] {
        let randomUsers = [
            User(name: "Jennifer", surname: "Connelly"),
            User(name: "Peter", surname: "Pettersen"),
            User(name: "Marina", surname: "Black"),
            User(name: "John", surname: "Levinson")
        ]

        return randomUsers
    }
}
