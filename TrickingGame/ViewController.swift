import UIKit

class ViewController: UIViewController, TrickingDelegate {
    
    
    
    var brain = TrickingBrain()
    
    @IBOutlet weak var trickingView: BoardView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        trickingView.trickingDelegate = self
        brain.reset()
        trickingView.trickingPlaneShadow = brain.trickingPlane
    }


    func movePiece(fx: Int, fy: Int, tx: Int, ty: Int) {
        brain.movePiece(fx: fx, fy: fy, tx: tx, ty: ty)
        trickingView.trickingPlaneShadow = brain.trickingPlane
        trickingView.setNeedsDisplay()
    }
}


