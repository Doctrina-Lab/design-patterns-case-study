import Cocoa

class LogItem {
    var from: String?
    @NSCopying var data: NSArray?
}

let array = NSMutableArray(array: [1, 2, 3, 4])

let item = LogItem()
item.from = "Alice"
item.data = array

array[1] = 10
print(item.data![1])
