import UIKit
import StudiqCore
import StudiqUI
import ImageSlideshow

extension CustomControl.Defaults.Control {
    public struct SlideShow {
        public struct Color {
            public static var activePageIndicator: UIColor = UIColor.clear
            public static var inactivePageIndicator: UIColor = UIColor.clear
        }
    }
}

@IBDesignable @objc open class EMImageSlideShow: ImageSlideshow {
    private var intPageControl: UIPageControl = {
        let view = UIPageControl()
        view.pageIndicatorTintColor = CustomControl.Defaults.Control.SlideShow.Color.inactivePageIndicator
        view.currentPageIndicatorTintColor = CustomControl.Defaults.Control.SlideShow.Color.activePageIndicator
        if let view = view.subviews.first {
            view.backgroundColor = CustomControl.Defaults.Color.background.withAlphaComponent(0.80)
            view.layer.cornerRadius = 5.0
        }
        if #available(iOS 14.0, *) {
            view.backgroundStyle = .prominent
        } else {
            // Fallback on earlier versions
        }
        return view
    } ()
    private var intIndicatorControl: CustomSliderIndicatorControl = {
        let view = CustomSliderIndicatorControl()
        view.buttonSpacing = 5
        view.backgroundColor = CustomControl.Defaults.Color.background
        view.controlRoundValue = 5
        view.inset = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
        return view
    }()
    // MARK: - Life cycle
    override public init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }

    convenience init() {
        self.init(frame: CGRect.zero)
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialize()
    }
    
    fileprivate func initialize() {
        self.layer.cornerRadius = 15.0
        self.slideshowInterval = 5.0
        self.contentScaleMode = UIViewContentMode.scaleToFill
        self.pageIndicatorPosition = PageIndicatorPosition(vertical: .bottom)
        self.pageIndicator = intPageControl
        self.activityIndicator = DefaultActivityIndicator()
//        self.pageIndicator?.view.setHeight(17)
// for new version
//        self.addSubview(self.intIndicatorControl)
//        self.intIndicatorControl.anchorCenterXToSuperview()
//        self.intIndicatorControl.anchor(bottom: self.bottomAnchor, bottomConstant: 16.0, heightConstant: 17.0)
//        self.currentPageChanged = { [weak self] (value: Int) in
//            self?.currentPageChanged(value)
//        }
// end for
    }
    
    open override func layoutPageControl() {
        super.layoutPageControl()
    }
    
    
    open override func setImageInputs(_ inputs: [InputSource]) {
        super.setImageInputs(inputs)
        self.intIndicatorControl.setSegmentedWith(items: inputs.count)
    }
    open func setImageList(_ images: [UIImage?]) {
        var inputs: [InputSource] = []
        images.forEach({ item in
            if let item = item {
                inputs.append(ImageSource(image: item))
            }
        })
        self.setImageInputs(inputs)
    }
    fileprivate func currentPageChanged(_ value: Int){
        self.intIndicatorControl.setSelectedSegmentIndex(index: value, animated: true)
    }
}
