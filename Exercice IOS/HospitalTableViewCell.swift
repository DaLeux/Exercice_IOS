import UIKit

class HospitalTableViewCell: UITableViewCell {

    @IBOutlet weak var hospitalName: UILabel!
    @IBOutlet weak var hospitalAddress: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
