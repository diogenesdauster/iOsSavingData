//: [Previous](@previous)

import UIKit

for image in try! [Image](fileName: "images") {
    try! image.save(directory: .documentDirectory)
}


let sticker = Sticker(name: "Diógenes Dauster",birthday: DateComponents(calendar: .current, year: 1991, month: 05, day: 17).date!,
    normalizedPosition: CGPoint(x: 0.3, y: 0.5),
    imageName: "cat")

let anotherSticker = Sticker(name: "Ana Beatriz", birthday: DateComponents(calendar: .current, year: 1992, month: 12, day: 23).date!,
                             normalizedPosition: CGPoint(x: 0.3, y: 0.5),
                             imageName: "dog")
do {
//  let jsonURL = URL(fileURLWithPath: sticker.name, relativeTo: FileManager.documentDirectoryURL.appendingPathComponent(Image.Kind.sticker.rawValue)).appendingPathExtension("json")
  let jsonURL = URL(fileURLWithPath: "stickers", relativeTo: FileManager.documentDirectoryURL.appendingPathComponent(Image.Kind.sticker.rawValue)).appendingPathExtension("json")

    
  let jsonEncoder = JSONEncoder()
    jsonEncoder.outputFormatting = .prettyPrinted
    let jsonData = try jsonEncoder.encode([sticker,anotherSticker])
    try jsonData.write(to: jsonURL, options: .atomic)
    
    let jsonDecoder = JSONDecoder()
    let savedJSONData = try Data(contentsOf: jsonURL)
    let jsonStickers = try jsonDecoder.decode([Sticker].self, from: savedJSONData)
    
    jsonStickers
    
    
} catch { print(error) }


FileManager.documentDirectoryURL


//: [Next](@next)
