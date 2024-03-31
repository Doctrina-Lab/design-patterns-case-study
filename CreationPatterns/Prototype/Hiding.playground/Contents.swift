import Cocoa

func buggy() {
    class Message {
        var to: String
        var subject: String
        
        init(to: String, subject: String) {
            self.to = to
            self.subject = subject
        }
    }
    
    final class MessageLogger {
        private var messages = [Message]()
        
        func logMessage(_ message: Message) {
            messages.append(message)
        }
        
        func processMessages(handler: (Message) -> Void) {
            messages.forEach(handler)
        }
    }
    
    let messageLogger = MessageLogger()
    
    let message = Message(to: "Joe", subject: "Hello")
    messageLogger.logMessage(message)
    
    message.to = "Bob"
    message.subject = "Ready for dinner?"
    messageLogger.logMessage(message)
    
    messageLogger.processMessages {
        print("Message to: \($0.to), subject: \($0.subject)")
    }
}

func notReallySolvingProblem() {
    class Message {
        var to: String
        var subject: String
        
        init(to: String, subject: String) {
            self.to = to
            self.subject = subject
        }
    }

    final class MessageLogger {
        private var messages = [Message]()
        
        func logMessage(_ message: Message) {
            messages.append(Message(to: message.to, subject: message.subject))
        }
        
        func processMessages(handler: (Message) -> Void) {
            messages.forEach(handler)
        }
    }
    
    let messageLogger = MessageLogger()
    
    let message = Message(to: "Joe", subject: "Hello")
    messageLogger.logMessage(message)
    
    message.to = "Bob"
    message.subject = "Ready for dinner?"
    messageLogger.logMessage(message)
    
    messageLogger.processMessages {
        print("Message to: \($0.to), subject: \($0.subject)")
    }
}

func anotherProblem() {
    class Message {
        var to: String
        var subject: String
        
        init(to: String, subject: String) {
            self.to = to
            self.subject = subject
        }
    }
    
    final class DetailedMessage: Message {
        var from: String
        
        init(from: String, to: String, subject: String) {
            self.from = from
            super.init(to: to, subject: subject)
        }
    }
    
    final class MessageLogger {
        private var messages = [Message]()
        
        func logMessage(_ message: Message) {
            messages.append(Message(to: message.to, subject: message.subject))
        }
        
        func processMessages(handler: (Message) -> Void) {
            messages.forEach(handler)
        }
    }
    
    let messageLogger = MessageLogger()
    
    let message = Message(to: "Joe", subject: "Hello")
    messageLogger.logMessage(message)
    
    message.to = "Bob"
    message.subject = "Ready for dinner?"
    messageLogger.logMessage(message)
    
    messageLogger.logMessage(DetailedMessage(from: "Joe", to: "Alice", subject: "Hi!"))
    
    messageLogger.processMessages { message in
        if let detailedMessage = message as? DetailedMessage {
            print("Message from: \(detailedMessage.from),to: \(detailedMessage.to), subject: \(detailedMessage.subject)")
        } else {
            print("Message to: \(message.to), subject: \(message.subject)")
        }
    }
}

func notReallySolvingAnotherProblem() {
    class Message {
        var to: String
        var subject: String
        
        init(to: String, subject: String) {
            self.to = to
            self.subject = subject
        }
    }
    
    final class DetailedMessage: Message {
        var from: String
        
        init(from: String, to: String, subject: String) {
            self.from = from
            super.init(to: to, subject: subject)
        }
    }
    
    final class MessageLogger {
        private var messages = [Message]()
        
        func logMessage(_ message: Message) {
            if let detailedMessage = message as? DetailedMessage {
                messages.append(DetailedMessage(from: detailedMessage.from, to: detailedMessage.to, subject: detailedMessage.subject))
            } else {
                messages.append(Message(to: message.to, subject: message.subject))
            }
        }
        
        func processMessages(handler: (Message) -> Void) {
            messages.forEach(handler)
        }
    }
    
    let messageLogger = MessageLogger()
    
    let message = Message(to: "Joe", subject: "Hello")
    messageLogger.logMessage(message)
    
    message.to = "Bob"
    message.subject = "Ready for dinner?"
    messageLogger.logMessage(message)
    
    messageLogger.logMessage(DetailedMessage(from: "Joe", to: "Alice", subject: "Hi!"))
    
    messageLogger.processMessages { message in
        if let detailedMessage = message as? DetailedMessage {
            print("Message from: \(detailedMessage.from),to: \(detailedMessage.to), subject: \(detailedMessage.subject)")
        } else {
            print("Message to: \(message.to), subject: \(message.subject)")
        }
    }
}

func applyingPrototypePattern() {
    class Message: NSObject, NSCopying {
        var to: String
        var subject: String
        
        init(to: String, subject: String) {
            self.to = to
            self.subject = subject
        }
        
        func copy(with zone: NSZone? = nil) -> Any {
            Message(to: to, subject: subject)
        }
    }
    
    final class DetailedMessage: Message {
        var from: String
        
        init(from: String, to: String, subject: String) {
            self.from = from
            super.init(to: to, subject: subject)
        }
        
        override func copy(with zone: NSZone? = nil) -> Any {
            DetailedMessage(from: from, to: to, subject: subject)
        }
    }
    
    final class MessageLogger {
        private var messages = [Message]()
        
        func logMessage(_ message: Message) {
            guard let message = message.copy() as? Message else { return }
            messages.append(message)
        }
        
        func processMessages(handler: (Message) -> Void) {
            messages.forEach(handler)
        }
    }
    
    let messageLogger = MessageLogger()
    
    let message = Message(to: "Joe", subject: "Hello")
    messageLogger.logMessage(message)
    
    message.to = "Bob"
    message.subject = "Ready for dinner?"
    messageLogger.logMessage(message)
    
    messageLogger.logMessage(DetailedMessage(from: "Joe", to: "Alice", subject: "Hi!"))
    
    messageLogger.processMessages { message in
        if let detailedMessage = message as? DetailedMessage {
            print("Message from: \(detailedMessage.from),to: \(detailedMessage.to), subject: \(detailedMessage.subject)")
        } else {
            print("Message to: \(message.to), subject: \(message.subject)")
        }
    }
}
