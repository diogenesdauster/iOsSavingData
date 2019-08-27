//: [Previous](@previous)

//: # Codable Types

import Foundation
import UIKit

FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)

for image in try! [Image](fileName: "images") {
    try! image.save(directory: .documentDirectory)
}

let sticker = Sticker(name: "the cat", birthday: DateComponents(calendar: .current, year: 2000, month: 01, day: 01).date!, normalizedPosition: CGPoint(x: 0.3, y: 0.5), imageName: "cat")


do {
    let jsonURL = URL(fileURLWithPath: sticker.name, relativeTo: FileManager.documentDirectoryURL.appendingPathComponent(Image.Kind.sticker.rawValue)).appendingPathExtension("json")
    
    let jsonEncoder = JSONEncoder()
    jsonEncoder.outputFormatting = .prettyPrinted
    let jsonData = try jsonEncoder.encode(sticker)
    try jsonData.write(to: jsonURL)
    
    let jsonDecoder = JSONDecoder()
    let savedJSONData = try Data(contentsOf: jsonURL)
    let jsonSticker =  try jsonDecoder.decode(Sticker.self, from: savedJSONData)
    
    jsonSticker == sticker
    
    
} catch {
    print(error)
}





//: [Next](@next)
