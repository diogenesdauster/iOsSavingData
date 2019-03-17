import Foundation

let mysteryDataURL = URL(fileURLWithPath: "mystery", relativeTo: FileManager.documentDirectoryURL)

let stringURL = FileManager.documentDirectoryURL
.appendingPathComponent("string")
.appendingPathExtension("txt")

stringURL.path



