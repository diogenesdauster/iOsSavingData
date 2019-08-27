import Foundation

//: # Document Directory URL


FileManager.documentDirectoryURL

try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)

//: [Next](@next)
