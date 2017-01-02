import Foundation
import CoreData

extension FileManager {
    
    public static func documentURL() -> URL? {
        return documentURL(childpath: nil)
    }
    
    public static func documentURL(childpath: String?) -> URL? {
        if let docURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            if let path = childpath {
                return docURL.appendingPathComponent(path)
            }
            return docURL
        }
        return nil
    }
}
