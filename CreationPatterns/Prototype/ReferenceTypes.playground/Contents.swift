import Cocoa

class Location: NSObject {
    var name: String
    var address: String
    
    init(name: String, address: String) {
        self.name = name
        self.address = address
    }
}

extension Location: NSCopying {
    func copy(with zone: NSZone? = nil) -> Any {
        Location(name: name, address: address)
    }
}

class Appointment: NSObject {
    var name: String
    var day: String
    var place: Location
    
    init(name: String, day: String, place: Location) {
        self.name = name
        self.day = day
        self.place = place
    }
    
    func printDetails(label: String) {
        print("\(label) with \(name) on \(day) at \(place.name), \(place.address)")
    }
}

extension Appointment: NSCopying {
    func copy(with zone: NSZone? = nil) -> Any {
        Appointment(name: name, day: day, place: place.copy() as! Location)
    }
}

var beerMeeting = Appointment(name: "Bob", day: "Mon", place: Location(name: "Joe's Bar", address: "123 Main St"))

var workMeeting = beerMeeting.copy() as! Appointment
workMeeting.name = "Alice"
workMeeting.day = "Fri"
workMeeting.place.name = "Conference Rm 2"
workMeeting.place.address = "Compay HQ"

beerMeeting.printDetails(label: "Social")
workMeeting.printDetails(label: "Work")
