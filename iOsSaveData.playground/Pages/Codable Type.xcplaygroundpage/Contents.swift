//: [Previous](@previous)

import UIKit

for image in try! [Image](fileName: "images") {
    try! image.save(directory: .documentDirectory)
}


let sticker = Sticker(name: "Diógenes Dauster",birthday: DateComponents(calendar: .current, year: 1991, month: 05, day: 17).date!,
    normalizedPosition: CGPoint(x: 0.3, y: 0.5),
    imageName: "cat")

do {
  let jsonURL = URL(fileURLWithPath: sticker.name, relativeTo: FileManager.documentDirectoryURL.appendingPathComponent(Image.Kind.sticker.rawValue)).appendingPathExtension("json")
    
  let jsonEncoder = JSONEncoder()
    jsonEncoder.outputFormatting = .prettyPrinted
    let jsonData = try jsonEncoder.encode(sticker)
    try jsonData.write(to: jsonURL, options: .atomic)
    
    let jsonDecoder = JSONDecoder()
    let savedJSONData = try Data(contentsOf: jsonURL)
    let jsonSticker = try jsonDecoder.decode(Sticker.self, from: savedJSONData)
    
    jsonSticker == sticker
    
    
} catch { print(error) }


FileManager.documentDirectoryURL


//: [Next](@next)
