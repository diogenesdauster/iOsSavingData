//: [Previous](@previous)

//: # Paths

import Foundation

let mysteryDataURL = URL(fileURLWithPath: "mystery", relativeTo: FileManager.documentDirectoryURL).path

let stringURL = FileManager.documentDirectoryURL
    .appendingPathComponent("string")
    .appendingPathExtension("txt")
stringURL.path




//: [Next](@next)
