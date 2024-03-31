import Cocoa

func startingExample() {
    class Person: NSObject, NSCopying {
        var name: String
        var country: String
        
        init(name: String, country: String) {
            self.name = name
            self.country = country
        }
        
        func copy(with zone: NSZone? = nil) -> Any {
            Person(name: name, country: country)
        }
    }
    
    let data = NSMutableArray(objects: 10, "iOS", Person(name: "Joe", country: "USA"))
    let copiedData = data
    
    data[0] = 20
    data[1] = "macOS"
    (data[2] as? Person)?.name = "Alice"
    
    print("Identity:", data === copiedData)
    print("0:", copiedData[0], "1:", copiedData[1], "2:", (copiedData[2] as! Person).name)
}

func shallowCopying() {
    class Person: NSObject, NSCopying {
        var name: String
        var country: String
        
        init(name: String, country: String) {
            self.name = name
            self.country = country
        }
        
        func copy(with zone: NSZone? = nil) -> Any {
            Person(name: name, country: country)
        }
    }
    
    let data = NSMutableArray(objects: 10, "iOS", Person(name: "Joe", country: "USA"))
    let copiedData = data.mutableCopy() as! NSArray
    
    data[0] = 20
    data[1] = "macOS"
    (data[2] as? Person)?.name = "Alice"
    
    print("Identity:", data === copiedData)
    print("0:", copiedData[0], "1:", copiedData[1], "2:", (copiedData[2] as! Person).name)
}

func creatingDeepCopyOfCocoaArray() {
    class Person: NSObject, NSCopying {
        var name: String
        var country: String
        
        init(name: String, country: String) {
            self.name = name
            self.country = country
        }
        
        func copy(with zone: NSZone? = nil) -> Any {
            Person(name: name, country: country)
        }
    }
    
    let data = NSMutableArray(objects: 10, "iOS", Person(name: "Joe", country: "USA"))
    let copiedData = NSMutableArray(array: data as! [Any], copyItems: true)
    
    data[0] = 20
    data[1] = "macOS"
    (data[2] as? Person)?.name = "Alice"
    
    print("Identity:", data === copiedData)
    print("0:", copiedData[0], "1:", copiedData[1], "2:", (copiedData[2] as! Person).name)
}
