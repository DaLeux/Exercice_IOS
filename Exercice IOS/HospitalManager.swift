import Foundation
import CoreData

class HospitalManager {
    
    public static let sharedInstance = HospitalManager()
    
    public var hospitalList: [Hospital] = []
    
    public func createHospital(name:String, address:String){
        if let context = DataManager.sharedInstance.objectContext {
            let hospital = Hospital(context: context)
            hospital.name = name
            hospital.address = address
            do {
                try context.save()
            } catch let error as NSError {
                print("FAILURE : \(error)")
            }
        }
    }
    
    public func readHospitals(handler: (_ result:Bool) -> Void) {
        if let context = DataManager.sharedInstance.objectContext {
            let request:NSFetchRequest<Hospital> = Hospital.fetchRequest()
            if let hospitals = try? context.fetch(request) {
                self.hospitalList = hospitals
                handler(true)
            }
            handler(false)
        }
    }
    
}
