import UIKit
import ImageSlideshow

@objcMembers
open class SlideShowActivityIndicator: ActivityIndicatorFactory {
    /// activity indicator style
    open var style: UIActivityIndicatorViewStyle

    /// activity indicator color
    open var color: UIColor?

    /// Create a new ActivityIndicator for UIActivityIndicatorView
    ///
    /// - style: activity indicator style
    /// - color: activity indicator color
    public init(style: UIActivityIndicatorViewStyle = .gray, color: UIColor? = nil) {
        self.style = style
        self.color = color
    }

    /// create ActivityIndicatorView instance
    open func create() -> ActivityIndicatorView {
        #if swift(>=4.2)
        let activityIndicator = UIActivityIndicatorView(style: style)
        #else
        let activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: style)
        #endif
        activityIndicator.color = color
        activityIndicator.hidesWhenStopped = true

        return activityIndicator
    }
}
