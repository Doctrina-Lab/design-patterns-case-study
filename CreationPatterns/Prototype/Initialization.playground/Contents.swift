import Cocoa

func expensiveInitialization() {
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
}

func avoidExpensiveInitializationByDeepCopying {
    final class Sum: NSObject, NSCopying {
        private var resultsCache: [[Int]]
        var firstValue: Int
        var secondValue: Int
        
        var result: Int {
            firstValue < resultsCache.count && secondValue < resultsCache[firstValue].count
            ? resultsCache[firstValue][secondValue]
            : firstValue + secondValue
        }
        
        init(firstValue: Int, secondValue: Int, cacheSize: Int = 10) {
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
        
        private init(firstValue: Int, secondValue: Int, resultsCache: [[Int]]) {
            self.firstValue = firstValue
            self.secondValue = secondValue
            self.resultsCache = resultsCache
        }
        
        func copy(with zone: NSZone? = nil) -> Any {
            Sum(firstValue: firstValue, secondValue: secondValue, resultsCache: resultsCache)
        }
    }
    
    let prototype = Sum(firstValue: 0, secondValue: 9, cacheSize: 100)
    let calc1 = prototype.result
    let clone = prototype.copy() as! Sum
    clone.firstValue = 3
    clone.secondValue = 8
    let calc2 = clone.result
    
    print("Calc1: \(calc1)")
    print("Calc2: \(calc2)")
}
