import Foundation

struct PersistentBio: Codable {
    var name: String
    var feet: Int
    var inches: Int
    var weight: Int
    var age: Int
}

class UserBio: ObservableObject {
    static let filename = "userBio.json"
    @Published var name: String
    @Published var height: (Int, Int)
    @Published var weight: Int
    @Published var age: Int


    init() {
        self.name = ""
        self.height = (0,0)
        self.weight = 0
        self.age = 0
    }


    init(name: String, age: Int, height: (Int, Int), weight: Int) {
        self.name = name
        self.age = age
        self.height = height
        self.weight = weight
    }

    func update() {
        let bio = PersistentBio(name: self.name, feet: self.height.0, inches: self.height.1, weight: self.weight, age: self.age)
        if let data = try? JSONEncoder().encode(bio) {
            let docDir: URL? = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            if let file = docDir?.appendingPathComponent(Self.filename) {
                try? data.write(to: file)
            }
        }
    }

    func load() {
        let docDir: URL? = try? FileManager.default.url(
            for: .documentDirectory, in: .userDomainMask,
            appropriateFor: nil, create: false )
        if let file = docDir?.appendingPathComponent(UserBio.filename)
        {
            if let data = try? Data(contentsOf: file) {
                if let ddata = try? JSONDecoder().decode(PersistentBio.self, from: data) {
                    self.name = ddata.name
                    self.age = ddata.age
                    self.height = (ddata.feet, ddata.inches)
                    self.weight = ddata.weight
                }
            }
        }
    }
}
