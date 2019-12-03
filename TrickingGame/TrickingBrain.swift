import Foundation

struct TrickingBrain {
    var trickingPlane = Set<TrickingPiece>()
    

    mutating func reset() {
        trickingPlane.insert(TrickingPiece(x: 0, y: 0, isGold: true, rank: .rl, imageName: "rl-gold"))
        trickingPlane.insert(TrickingPiece(x: 2, y: 0, isGold: true, rank: .bk, imageName: "bk-gold"))
        trickingPlane.insert(TrickingPiece(x: 4, y: 0, isGold: true, rank: .rr, imageName: "rr-gold"))
        trickingPlane.insert(TrickingPiece(x: 6, y: 0, isGold: true, rank: .ud, imageName: "ud-gold"))
        
        trickingPlane.insert(TrickingPiece(x: 0, y: 9, isGold: false, rank: .rl, imageName: "rl-silver"))
        trickingPlane.insert(TrickingPiece(x: 2, y: 9, isGold: false, rank: .bk, imageName: "bk-silver"))
        trickingPlane.insert(TrickingPiece(x: 4, y: 9, isGold: false, rank: .rr, imageName: "rr-silver"))
        trickingPlane.insert(TrickingPiece(x: 6, y: 9, isGold: false, rank: .ud, imageName: "ud-silver"))
    }
    
    /*
     1. move
     “rl” : It can go to its right and left line in random.
     “bk” : It can go like Chess’s bishop and Chinese Chess’s king.
     “rr” : It can go like two Chess’s rook move, but it has to be a right angle.
     “ud” : It can go to its up and down line in random.

     */
    
    mutating func movePiece(fx: Int, fy: Int, tx: Int, ty: Int) {
        guard let movingPiece = pieceAt(x: fx, y: fy) else {
            return
        }
        
        if let targetPiece = pieceAt(x: tx, y: ty) {
            trickingPlane.remove(targetPiece)
        }
        
        trickingPlane.remove(movingPiece)
        trickingPlane.insert(TrickingPiece(x: tx, y: ty, isGold: movingPiece.isGold, rank: movingPiece.rank, imageName: movingPiece.imageName))
    }
    
    func pieceAt(x: Int, y: Int) -> TrickingPiece? {
        for piece in trickingPlane {
            if piece.x == x && piece.y == y {
                return piece
            } else {
                continue
            }
        }
        
        return nil
    }
}
