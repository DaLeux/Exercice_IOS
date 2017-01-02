import Foundation
import CoreData

class DataManager: NSObject {
    
    public static let sharedInstance = DataManager()
    
    public var objectContext: NSManagedObjectContext?
    
    private override init(){
        if let modelURL = Bundle.main.url(forResource: "Exercice_IOS", withExtension: "momd"){
            if let model = NSManagedObjectModel(contentsOf: modelURL){
                let persistentStoreCoordinator = NSPersistentStoreCoordinator(managedObjectModel: model)
                _ = try? persistentStoreCoordinator.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: FileManager.documentURL(childpath: "Exercice_IOS.db"), options: nil)
                let context = NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
                context.persistentStoreCoordinator = persistentStoreCoordinator
                self.objectContext = context
            }
            
        }
        
    }
    
}
