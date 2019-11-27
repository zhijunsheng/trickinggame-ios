import UIKit

class BoardView: UIView {
    var trickingPlaneShadow = Set<TrickingPiece>()
    let rectWidth: CGFloat = 104
    let rectHeight: CGFloat = 72.8
    
    override func draw(_ rect: CGRect) {
        // Drawing code
        for j in 0..<10 {
            for i in 0..<7 {
                    let piece1 = UIBezierPath()
                    piece1.move(to: CGPoint(x: 0, y: 0 + CGFloat(j) * rectHeight))
                    piece1.addLine(to: CGPoint(x: rectWidth + CGFloat(i) * rectWidth, y: 0 + CGFloat(j) * rectHeight))
                    piece1.addLine(to: CGPoint(x: rectWidth + CGFloat(i) * rectWidth, y: rectHeight + CGFloat(j) * rectHeight))
                    piece1.addLine(to: CGPoint(x: 0, y: rectHeight * (CGFloat(j) + 1)))
                    piece1.close()
                    piece1.stroke()
            }
        }
        
        for piece in trickingPlaneShadow {
            let pieceImage = UIImage(named: "\(piece.imageName)")
            
            pieceImage?.draw(in: CGRect(x: CGFloat(piece.x) * rectWidth, y: CGFloat(piece.y) * rectHeight, width: rectWidth, height: rectHeight))
        }
        
        
    }
    
    
}
