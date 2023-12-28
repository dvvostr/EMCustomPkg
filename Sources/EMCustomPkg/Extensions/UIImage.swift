import UIKit
import StudiqCore
import StudiqUI

public extension UIImage {
    struct Preset {
        public static var chevron_back: UIImage? {
            return UIImage(named: "icons/chevron/back", in: .module, compatibleWith: nil)?.withRenderingMode(.alwaysTemplate)
        }
        public static var chevron_right: UIImage? {
            return UIImage(named: "icons/chevron/right", in: .module, compatibleWith: nil)?.withRenderingMode(.alwaysTemplate)
        }
        public static var chevron_up: UIImage? {
            return UIImage(named: "icons/chevron/up", in: .module, compatibleWith: nil)?.withRenderingMode(.alwaysTemplate)
        }
        public static var chevron_down: UIImage? {
            return UIImage(named: "icons/chevron/down", in: .module, compatibleWith: nil)?.withRenderingMode(.alwaysTemplate)
        }
        public static var close_square: UIImage? {
            return UIImage(named: "icons/close/square", in: .module, compatibleWith: nil)?.withRenderingMode(.alwaysTemplate)
        }
        public static var emoji_happy: UIImage? {
            return UIImage(named: "icons/emoji/happy", in: .module, compatibleWith: nil)?.withRenderingMode(.alwaysTemplate)
        }
        public static var star: UIImage? {
            return UIImage(named: "icons/star", in: .module, compatibleWith: nil)
        }
        public static var tick_square: UIImage? {
            return UIImage(named: "icons/tick/square", in: .module, compatibleWith: nil)?.withRenderingMode(.alwaysTemplate)
        }
        public static var plus: UIImage? {
            return UIImage(named: "icons/control/plus", in: .module, compatibleWith: nil)?.withRenderingMode(.alwaysTemplate)
        }
    }
}
