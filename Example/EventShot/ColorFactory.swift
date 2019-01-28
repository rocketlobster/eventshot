import Foundation
import UIKit

class ColorFactory {

    func random() -> UIColor {
        return UIColor(
            red: randomChannel(),
            green: randomChannel(),
            blue: randomChannel(),
            alpha: 1
        )
    }
    
    private func randomChannel() -> CGFloat {
        let int = Int.random(in: 0 ..< 255)
        return CGFloat(integerLiteral: int) / 255
    }
    
}
