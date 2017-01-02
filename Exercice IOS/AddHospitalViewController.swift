import UIKit


class AddHospitalViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func saveHospital(_ sender: Any) {
        HospitalManager.sharedInstance.createHospital(name: nameTextField.text!, address: addressTextField.text!)
        
        self.dismiss(animated: true, completion: nil)
    }
}
