import UIKit

class ViewController: UIViewController {
    
    var brain = TrickingBrain()
    
    @IBOutlet weak var trickingView: BoardView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        brain.reset()
        trickingView.trickingPlaneShadow = brain.trickingPlane
    }


}

