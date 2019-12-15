import UIKit
class BoardView: UIView {
    var side : CGFloat = 91
    var lSide : CGFloat = 728
    
    override func draw(_ rect: CGRect) {
        
        
        
        for j in 0..<4 {
            for i in 0..<4 {
                drawGrid(col: i * 2, row: j * 2)
                drawGrid(col: 1 + i * 2, row: 1 + j * 2)
            }
        }
        drawLines()
        
        let piece = UIImage(named: "king-r")
        piece?.draw(in: CGRect(x: side * 3, y: side * 7, width: side, height: side))
    }
    func drawGrid(col: Int, row: Int) {
        let gird = UIBezierPath(rect: CGRect(x: CGFloat(col) * side, y: CGFloat(row) * side, width: side, height: side))
        #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).setFill()
        gird.fill()
    }
    func drawLines() {
        let lh = UIBezierPath()
        for i in 1..<8 {
            lh.move(to: CGPoint(x: 0, y: side * CGFloat(i)))
            lh.addLine(to: CGPoint(x: lSide, y: side * CGFloat(i)))
        }
        let lv = UIBezierPath()
        for j in 1..<8 {
            lv.move(to: CGPoint(x: side * CGFloat(j), y: 0))
            lv.addLine(to: CGPoint(x: side * CGFloat(j), y: lSide))
        }
        lh.stroke()
        lv.stroke()
    }
}
