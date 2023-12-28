import UIKit
import StudiqCore
import StudiqUI

public class UIBaseNavigationTitleLabel: UILabel {}

open class TitledBaseViewController: BaseViewController {
    
    private var intTitleView: UIBaseNavigationTitleLabel = {
        let view = UIBaseNavigationTitleLabel()
        view.textAlignment = .center
        view.textColor = UIBaseNavigationTitleLabel.appearance().textColor
        view.font = UIBaseNavigationTitleLabel.appearance().defaultFont
        return view
    }()
    
    public var captionFont: UIFont {
        get{
            return self.intTitleView.font
        }
        set{
            self.intTitleView.font = newValue
            self.intTitleView.sizeToFit()
        }
    }
    open var captionText: String = "" {
        didSet{
            self.intTitleView.text = self.captionText
            self.intTitleView.sizeToFit()
        }
    }
    open var titleView: UIView? {
        get {
            return self.intTitleView
        }
        set {
            self.navigationItem.titleView = newValue
        }
    }
    open override func setup() {
        super.setup()
        self.navigationItem.titleView = self.intTitleView
    }
}

