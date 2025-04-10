import Foundation
import CSSTypeTypes

/// Specifies how overflowed content that is not displayed should be signaled to the user.
///
/// The text-overflow property specifies how overflowed content that is not displayed should be signaled to users.
/// It can be clipped, display an ellipsis ('…'), or display a custom string.
///
/// For the text-overflow property to have an effect, the element must have overflow set to hidden or scroll and
/// white-space set to nowrap or another value that prevents text wrapping.
///
/// [Learn more at MDN](https://developer.mozilla.org/en-US/docs/Web/CSS/text-overflow)
///
/// # CSS Values
/// ```css
/// text-overflow: clip;
/// text-overflow: ellipsis;
/// text-overflow: "...";
/// ```
public enum TextOverflow: Property {
    public static let property: String = "text-overflow"
    
    /// Default value. Text is clipped and not accessible.
    case clip
    
    /// Render an ellipsis ('…') to represent the clipped text.
    case ellipsis
    
    /// Render the given string to represent the clipped text.
    /// Only some browsers support this feature.
    case string(CSSString)
    
    /// Global CSS values
    case global(CSSTypeTypes.Global)
}

extension TextOverflow: CustomStringConvertible {
    public var description: String {
        switch self {
        case .clip:
            return "clip"
        case .ellipsis:
            return "ellipsis"
        case .string(let value):
            return value.description
        case .global(let global):
            return global.description
        }
    }
}
