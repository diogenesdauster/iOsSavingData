import UIKit

public  struct Image: Decodable {
    public enum Kind: String, Decodable {
        case scene
        case sticker
    }
    
    enum DecodingError: Error {
        case missingFile
    }
    
    let name: String
    let kind: Kind
    let pngData: Data

    static func getPNGFromDocumentDirectory(kind: Kind, name: String) -> UIImage? {
        return UIImage(contentsOfFile:
            FileManager.documentDirectoryURL
                .appendingPathComponent(kind.rawValue)
                .appendingPathComponent(name)
                .appendingPathExtension("png")
                .path)
    }

}

//MARK: public
public extension Image {
    
    
    
    func save(directory: FileManager.SearchPathDirectory) throws {
        let kindDirectoryURL = URL(
            fileURLWithPath: kind.rawValue,
            relativeTo: FileManager.default.urls(for: directory, in: .userDomainMask)[0]
        )
        
        try? FileManager.default.createDirectory(at: kindDirectoryURL, withIntermediateDirectories: true)
        
        try pngData.write(
            to: kindDirectoryURL.appendingPathComponent(name).appendingPathExtension("png"),
            options: .atomic
        )
    }
}

//MARK:-
public extension Array where Element == Image {
    init(fileName: String) throws {
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "json") else {
            throw Image.DecodingError.missingFile
        }
        
        let data = try Data(contentsOf: url)
        let decoder = JSONDecoder()
        self = try decoder.decode([Image].self, from: data)
    }
}
