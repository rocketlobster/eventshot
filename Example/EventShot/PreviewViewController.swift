import UIKit
import EventShot

class PreviewViewController: UIViewController {
    
    var image: UIImage!
    
    @IBOutlet weak var previewImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        previewImageView.image = image
    }
    
}
