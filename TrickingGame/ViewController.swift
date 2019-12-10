import UIKit
import AVFoundation

class ViewController: UIViewController, TrickingDelegate {
    
    
    
    var brain = TrickingBrain()
    var timeHelper = 120
    var endedSound: AVAudioPlayer!
    
    
    @IBOutlet weak var trickingView: BoardView!
    @IBOutlet weak var timerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let soundPath = Bundle.main.path(forResource: "open_game", ofType: "wav")
        let url = URL(fileURLWithPath: soundPath!)
        endedSound = try? AVAudioPlayer(contentsOf: url)
        trickingView.trickingDelegate = self
        brain.reset()
        trickingView.trickingPlaneShadow = brain.trickingPlane
        
    }
    
    /**
     closure: a function without a name
     */

    @IBAction func beginTimer(_ sender: Any) {
        timerLabel.text = "02:00"
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            self.abcd(timer: timer)
        }
    }
    
    /**
     line 28
     */
    func abcd(timer: Timer) {
        print("next second")
        self.timeHelper -= 1
        let s = self.timeHelper % 60
        let min = Int(self.timeHelper / 60)
        self.timerLabel.text = "0\(min):\(s)"
        
        if self.timeHelper == 0 {
            timer.invalidate()
            self.endedSound.play()
            self.trickingView.isUserInteractionEnabled = false
            self.timeHelper = 120
            timerLabel.text = "02:00"

        }
    }
    
    func movePiece(fx: Int, fy: Int, tx: Int, ty: Int) {
        brain.movePiece(fx: fx, fy: fy, tx: tx, ty: ty)
        trickingView.trickingPlaneShadow = brain.trickingPlane
        trickingView.setNeedsDisplay()
    }
}


