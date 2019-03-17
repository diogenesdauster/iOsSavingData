import Foundation

let mysteryDataURL = URL(fileURLWithPath: "mystery", relativeTo: FileManager.documentDirectoryURL)

let stringURL = FileManager.documentDirectoryURL
.appendingPathComponent("string")
.appendingPathExtension("txt")


let challengeString = "One Piece"
let challengeStringURL = URL(fileURLWithPath: challengeString, relativeTo: FileManager.documentDirectoryURL).appendingPathExtension("txt")

challengeStringURL.lastPathComponent





