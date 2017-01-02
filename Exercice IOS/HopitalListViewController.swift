import UIKit

class HopitalListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        self.retrieveHospitals()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return HospitalManager.sharedInstance.hospitalList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "hospitalCell", for: indexPath) as! HospitalTableViewCell
        cell.hospitalName.text = HospitalManager.sharedInstance.hospitalList[indexPath.row].name
        cell.hospitalAddress.text = HospitalManager.sharedInstance.hospitalList[indexPath.row].address
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addHospital" {
            let viewController = segue.destination as! AddHospitalViewController
        }
    }
    
    func retrieveHospitals() -> Void {
        HospitalManager.sharedInstance.readHospitals { (result:Bool) in
            if result {
                tableView.reloadData()
            } else {
                // error
            }
        }
    }

}
