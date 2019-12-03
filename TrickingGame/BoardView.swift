import UIKit

class BoardView: UIView {
    var trickingPlaneShadow = Set<TrickingPiece>()
    let rectWidth: CGFloat = 104
    let rectHeight: CGFloat = 72.8
    var xx: Int = 123456789
    var yy: Int = 987654321
    
    var trickingDelegate: TrickingDelegate? = nil
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let finger = touches.first!
        let fingerPoint = finger.location(in: self)
        xx = Int(fingerPoint.x / rectWidth)
        yy = Int(fingerPoint.y / rectHeight)
        print("(\(xx), \(yy))")

    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let finger = touches.first!
        let fingerPoint = finger.location(in: self)
        let Xx = Int(fingerPoint.x / rectWidth)
        let Yy = Int(fingerPoint.y / rectHeight)
        trickingDelegate?.movePiece(fx: xx, fy: yy, tx: Xx, ty: Yy)
    }
    
    override func draw(_ rect: CGRect) {
        // Drawing code
        let piece1 = UIBezierPath()
        for j in 0..<10 {
            for i in 0..<7 {
                
                piece1.move(to: CGPoint(x: 0, y: 0 + CGFloat(j) * rectHeight))
                piece1.addLine(to: CGPoint(x: rectWidth + CGFloat(i) * rectWidth, y: 0 + CGFloat(j) * rectHeight))
                piece1.addLine(to: CGPoint(x: rectWidth + CGFloat(i) * rectWidth, y: rectHeight + CGFloat(j) * rectHeight))
                piece1.addLine(to: CGPoint(x: 0, y: rectHeight * (CGFloat(j) + 1)))
                piece1.close()
                
            }
        }
        
        #colorLiteral(red: 0.4929098887, green: 0.4924015411, blue: 0, alpha: 0.4963345462).setFill()
        piece1.fill()
        piece1.stroke()
        
        for piece in trickingPlaneShadow {
            let pieceImage = UIImage(named: "\(piece.imageName)")
            
            pieceImage?.draw(in: CGRect(x: CGFloat(piece.x) * rectWidth, y: CGFloat(piece.y) * rectHeight, width: rectWidth, height: rectHeight))
        }
        
        
    }
    
    
}
