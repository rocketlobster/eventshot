import UIKit
import Foundation

public class EventShot {
    
    public init() {
    }
    
    public func record(_ text: String) {
        let im = image(text)
        UIImageWriteToSavedPhotosAlbum(im, nil, nil, nil)
    }
    
    public func record(_ textLines: [String]) {
        let text = textLines.joined(separator: "\n")
        record(text)
    }
    
    public func image(_ text: String) -> UIImage {
        return draw { (context) in
            addScreenshot(in: context)
            let boxHeight = context.height/2/4
            drawRectangle(in: context, height: boxHeight)
            drawText(in: context, text: text, inHeight: boxHeight)
        }
    }
    
    private func draw(_ action: (CGContext) -> Void) -> UIImage {
        let mainScreen = UIScreen.main
        UIGraphicsBeginImageContextWithOptions(mainScreen.applicationFrame.size, false, mainScreen.scale)
        guard let context = UIGraphicsGetCurrentContext() else { fatalError("no context") }
        action(context)
        guard let screenshotImage = UIGraphicsGetImageFromCurrentImageContext() else { fatalError("missing current context") }
        UIGraphicsEndImageContext()
        return screenshotImage
    }
    
    private func addScreenshot(in context: CGContext) {
        let layer = UIApplication.shared.keyWindow!.layer
        layer.render(in: context)
    }
    
    private func drawRectangle(in context: CGContext, height: Int) {
        let backgroundColor = UIColor(white: 1, alpha: 0.7)
        context.setFillColor(backgroundColor.cgColor)
        let totalWidth = context.width / 2
        let totalHeight = context.height / 2
        let rectHeight = totalHeight / 4
        let rectangle = CGRect(x: 0, y: 0, width: totalWidth, height: rectHeight)
        context.addRect(rectangle)
        context.drawPath(using: .fill)
    }
    
    func drawText(in context: CGContext, text: String, inHeight: Int) {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        
        let attributes: [NSAttributedString.Key : Any] = [
            .paragraphStyle: paragraphStyle,
            .font: UIFont.systemFont(ofSize: 25.0),
            .foregroundColor: UIColor.black
        ]
        let textSize = text.size(withAttributes: attributes)

        let attributedString = NSAttributedString(string: text, attributes: attributes)
        let stringRect = CGRect(x: (CGFloat(context.width)/2 - textSize.width)/2, y: (CGFloat(inHeight) - textSize.height)/2, width: textSize.width, height: textSize.height)
        attributedString.draw(in: stringRect)
    }
    
}

