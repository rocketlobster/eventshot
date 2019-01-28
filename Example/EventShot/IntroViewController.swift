import UIKit
import EventShot

class IntroViewController: UIViewController {
    
    @IBOutlet weak var timeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = .medium
        timeLabel.text = String(dateFormatter.string(from: Date() as Date))
        self.view.backgroundColor = ColorFactory().random()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let image = EventShot().image("Did Appear\n Youpi")
        EventShot().record("Did save to the photoroll")
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let previewVC = storyboard.instantiateViewController(withIdentifier: "Preview") as! PreviewViewController
        previewVC.image = image
        present(previewVC, animated: true)
    }

}
