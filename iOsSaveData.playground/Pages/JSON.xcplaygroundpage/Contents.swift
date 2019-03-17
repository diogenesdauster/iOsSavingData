//: [Previous](@previous)

import UIKit

struct Image: Decodable {
    enum Kind: String, Decodable {
        case scene
        case sticker
    }
    
    enum DecodingError: Error {
        case missingFile
    }
    
    let name: String
    let kind: Kind
    let pngData: Data
    
}

extension Array where Element == Image {
    init(filename: String) throws {
        guard let url = Bundle.main.url(forResource: filename, withExtension: "json") else {
            throw Image.DecodingError.missingFile
        }
        let decoder = JSONDecoder()
        let data = try Data(contentsOf: url)
        self = try decoder.decode([Image].self, from: data)
    }
}


let images = try [Image](filename: "images")
images.map{ UIImage(data: $0.pngData) }

//: [Next](@next)
