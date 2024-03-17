import Cocoa

final class Sum {
    private var resultsCache: [[Int]]
    private let firstValue: Int
    private let secondValue: Int
    
    var result: Int {
        firstValue < resultsCache.count && secondValue < resultsCache[firstValue].count
            ? resultsCache[firstValue][secondValue]
            : firstValue + secondValue
    }
    
    init(firstValue: Int, secondValue: Int, cacheSize: Int) {
        self.resultsCache = [[Int]](
            repeating: [Int](
                repeating: 0,
                count: cacheSize),
            count: cacheSize)
        for i in 0..<10 {
            for j in 0..<10 {
                resultsCache[i][j] = i + j
            }
        }
        self.firstValue = firstValue
        self.secondValue = secondValue
    }
}

let calc1 = Sum(firstValue: 0, secondValue: 9, cacheSize: 100).result
let calc2 = Sum(firstValue: 3, secondValue: 8, cacheSize: 20).result

print("Calc1: \(calc1)")
print("Calc2: \(calc2)")
