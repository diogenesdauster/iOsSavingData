//: [Previous](@previous)

//: # Hierarchies

import UIKit
import Foundation

FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)

for image in try! [Image](fileName: "images") {
    try! image.save(directory: .documentDirectory)
}

let sticker = Sticker(name: "the cat", birthday: DateComponents(calendar: .current, year: 2000, month: 01, day: 01).date!, normalizedPosition: CGPoint(x: 0.3, y: 0.5), imageName: "cat")

let stickerTwo = Sticker(name: "Valrala", birthday: DateComponents(calendar: .current, year: 2000, month: 01, day: 01).date!, normalizedPosition: CGPoint(x: 0.3, y: 0.5), imageName: "castle")

let stickers = [sticker, stickerTwo]

let scene = Scene(width: 900, hasReverseGravity: true, backgroundName: "Space", stickers: stickers)
scene.view

do {
    let jsonURL = URL(fileURLWithPath: "scene", relativeTo: FileManager.documentDirectoryURL.appendingPathComponent(Image.Kind.scene.rawValue)).appendingPathExtension("json")
    
    let jsonEncoder = JSONEncoder()
    jsonEncoder.outputFormatting = .prettyPrinted
    let jsonData = try jsonEncoder.encode(scene)
    try jsonData.write(to: jsonURL, options: .atomic)
    
    let jsonDecoder = JSONDecoder()
    let savedData = try Data(contentsOf: jsonURL)
    let loadScene = try jsonDecoder.decode(Scene.self, from: savedData)
    
    loadScene == scene
    
    
} catch {
    print(error)
}

//: [Next](@next)
