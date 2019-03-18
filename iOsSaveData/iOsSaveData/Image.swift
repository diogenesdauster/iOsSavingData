//
//  Image.swift
//  iOsSaveData
//
//  Created by Diogenes Dauster on 3/17/19.
//  Copyright © 2019 Diogenes Dauster. All rights reserved.
//
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
    
    func save(directory: FileManager.SearchPathDirectory) throws {
        let kindDirectoryURL = URL(fileURLWithPath:
            kind.rawValue, relativeTo: FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0])
        
        try? FileManager.default.createDirectory(at: kindDirectoryURL,
                                                 withIntermediateDirectories: true)
        try pngData.write(to: kindDirectoryURL
            .appendingPathComponent(name)
            .appendingPathExtension("png"), options: .atomic)
    }
    
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

