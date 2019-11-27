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
}
