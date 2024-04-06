import Cocoa

func shallowCopying() {
    final class Person {
        var name: String
        var country: String
        
        init(name: String, country: String) {
            self.name = name
            self.country = country
        }
    }
    
    let people = [Person(name: "Sebastian", country: "France"), Person(name: "Hugo", country: "France")]
    
    let otherPeople = people
    otherPeople[0].name = "Joe"
    otherPeople[0].country = "UK"
    
    print(people[0].name, people[0].country, ",", people[1].name, people[1].country)
    print(otherPeople[0].name, otherPeople[0].country, ",", otherPeople[1].name, otherPeople[1].country)
}

func deepCopying() {
    final class Person:NSObject, NSCopying {
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
    
    func deepCopy(from array: [Person]) -> [Person] {
        array.map { person in
            ((person as NSObject).copy() as? Person) ?? person
        }
    }
    
    let people = [Person(name: "Sebastian", country: "France"), Person(name: "Hugo", country: "France")]
    
    let otherPeople = deepCopy(from: people)
    otherPeople[0].name = "Joe"
    otherPeople[0].country = "UK"
    
    print(people[0].name, people[0].country, ",", people[1].name, people[1].country)
    print(otherPeople[0].name, otherPeople[0].country, ",", otherPeople[1].name, otherPeople[1].country)
}

deepCopying()
