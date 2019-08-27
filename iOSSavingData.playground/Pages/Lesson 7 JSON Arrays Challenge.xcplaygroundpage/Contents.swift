//: [Previous](@previous)
/*:
 # Challenge
 
1.  Make at least one more Sticker.
2.  Combine all stickers in an array.
3.  Save that array to the stickers folder.
4.  Load it back from the stickers folder, and make sure what you've load matches the original array

 */
import UIKit
import Foundation

FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)

for image in try! [Image](fileName: "images") {
    try! image.save(directory: .documentDirectory)
}

let sticker = Sticker(name: "the cat", birthday: DateComponents(calendar: .current, year: 2000, month: 01, day: 01).date!, normalizedPosition: CGPoint(x: 0.3, y: 0.5), imageName: "cat")

let stickerTwo = Sticker(name: "Valrala", birthday: DateComponents(calendar: .current, year: 2000, month: 01, day: 01).date!, normalizedPosition: CGPoint(x: 0.3, y: 0.5), imageName: "castle")

let stickers = [sticker, stickerTwo]

do {

    let jsonStrickersURL = URL(fileURLWithPath: "stickers", relativeTo: FileManager.documentDirectoryURL.appendingPathComponent(Image.Kind.sticker.rawValue)).appendingPathExtension("json")

    let jsonStickersEncoder = JSONEncoder()
    jsonStickersEncoder.outputFormatting = .prettyPrinted
    let jsonDataFromStickers = try jsonStickersEncoder.encode(stickers)
    try jsonDataFromStickers.write(to: jsonStrickersURL, options: .atomic)


    let jsonStickersDecoder = JSONDecoder()
    let savedDataFromStickers = try Data(contentsOf: jsonStrickersURL)
    let loadedStickers = try jsonStickersDecoder.decode([Sticker].self, from: savedDataFromStickers)


    loadedStickers == stickers
    
    loadedStickers == stickers
    loadedStickers.map { $0.image }
    
    
} catch {
    print(error)
}

//: [Next](@next)
