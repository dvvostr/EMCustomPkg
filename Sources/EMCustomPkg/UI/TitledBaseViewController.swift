import UIKit
import StudiqCore
import StudiqUI

public class UIBaseNavigationTitleLabel: UILabel {}

open class TitledBaseViewController: BaseViewController {
    
    private var intTitleView: UIBaseNavigationTitleLabel = {
        let view = UIBaseNavigationTitleLabel()
        view.textAlignment = .center
        view.textColor = CustomControl.Defaults.Color.text
        view.font = CustomControl.Defaults.titleFont
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
        navigationItem.hidesBackButton = true
        if self.navigationController?.viewControllers.first != self {
            let backButton = UIButton(frame: .zero)
            backButton.setImage(UIImage.Preset.chevron_back?.withRenderingMode(.alwaysTemplate), for: UIControl.State.normal)
            backButton.addTarget(self, action: #selector(handleButtonBackClick(sender: )), for: .touchUpInside)
            navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: backButton)
        }
    }
    @objc private func handleButtonBackClick(sender: Any?) {
        var isContinue = true
        navigationDidBack(&isContinue)
        if isContinue {
            navigationController?.popViewController(animated: true)
        }
    }
}

