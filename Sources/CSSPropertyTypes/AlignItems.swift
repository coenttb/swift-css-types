import CSSTypeTypes
import Foundation

/// The CSS align-items property sets the align-self value on all direct children as a group.
///
/// In flexbox, it controls the alignment of items on the cross axis. In grid layout, it controls
/// the alignment of items on the block axis within their grid areas.
///
/// Example:
/// ```swift
/// .alignItems(.stretch)              // align-items: stretch
/// .alignItems(.center)               // align-items: center
/// .alignItems(.start)                // align-items: start
/// .alignItems(.baseline)             // align-items: baseline
/// .alignItems(.safe, .center)        // align-items: safe center
/// ```
///
/// - SeeAlso: [MDN Web Docs on align-items](https://developer.mozilla.org/en-US/docs/Web/CSS/align-items)
public enum AlignItems: Property, SelfPositionConvertible, BaselinePositionConvertible {
    public static let property: String = "align-items"

    /// Default alignment for the layout mode
    case normal

    /// Stretches items to fill the container
    case stretch

    /// Baseline alignment
    case baseline(BaselinePosition)

    /// Positional alignment with optional overflow safety
    case position(OverflowPosition?, SelfPosition)

    /// Aligns items to the center of an anchor element
    case anchorCenter

    /// Global values
    case global(CSSTypeTypes.Global)
}

/// CSS Output conversion
extension AlignItems {
    /// Converts the alignment value to its CSS string representation
    public var description: String {
        switch self {
        case .normal:
            return "normal"

        case .stretch:
            return "stretch"

        case .baseline(let position):
            return position.description

        case .position(let overflow, let position):
            if let overflow = overflow {
                return "\(overflow) \(position)"
            } else {
                return position.description
            }

        case .anchorCenter:
            return "anchor-center"

        case .global(let global):
            return global.description
        }
    }
}

// Convenience properties and initializers
extension AlignItems {
    /// Simple baseline alignment
    public static let baseline = Self.baseline(.baseline)

    /// First baseline alignment
    public static let firstBaseline = Self.baseline(.firstBaseline)

    /// Last baseline alignment
    public static let lastBaseline = Self.baseline(.lastBaseline)

}
