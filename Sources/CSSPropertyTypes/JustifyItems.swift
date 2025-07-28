import CSSTypeTypes
import Foundation

/// The CSS justify-items property defines the default justify-self for all direct children as a group.
///
/// In grid layouts, it aligns items within their grid areas on the inline axis. In block-level layouts,
/// it aligns items inside their containing block on the inline axis. For absolutely-positioned elements,
/// it aligns items on the inline axis, accounting for offset values. This property is ignored in flexbox layouts
/// and table cell layouts.
///
/// Example:
/// ```swift
/// .justifyItems(.normal)               // justify-items: normal
/// .justifyItems(.stretch)              // justify-items: stretch
/// .justifyItems(.center)               // justify-items: center
/// .justifyItems(.left)                 // justify-items: left
/// .justifyItems(.legacy(.center))      // justify-items: legacy center
/// ```
///
/// - SeeAlso: [MDN Web Docs on justify-items](https://developer.mozilla.org/en-US/docs/Web/CSS/justify-items)
public enum JustifyItems: Property, SelfPositionConvertible, BaselinePositionConvertible {
    public static let property: String = "justify-items"

    /// Default alignment for the layout mode
    case normal

    /// Stretches items to fill the container
    case stretch

    /// Baseline alignment
    case baseline(BaselinePosition)

    /// Positional alignment with optional overflow safety
    case position(OverflowPosition?, SelfPosition)

    /// Left alignment
    case left

    /// Right alignment
    case right

    /// Legacy alignment with optional position
    case legacy(LegacyPosition?)

    /// Aligns items to the center of an anchor element
    case anchorCenter

    /// Global values
    case global(CSSTypeTypes.Global)
}

/// Legacy position for justify-items
public enum LegacyPosition: String, Sendable, Hashable {
    case left
    case right
    case center
}

/// CSS Output conversion
extension JustifyItems: CustomStringConvertible {
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

        case .left:
            return "left"

        case .right:
            return "right"

        case .legacy(let position):
            if let position = position {
                return "legacy \(position)"
            } else {
                return "legacy"
            }

        case .anchorCenter:
            return "anchor-center"

        case .global(let global):
            return global.description
        }
    }
}

// Convenience initializers
extension JustifyItems {
    /// Creates a legacy center alignment
    public static func legacyCenter() -> Self {
        return .legacy(.center)
    }

    /// Creates a legacy left alignment
    public static func legacyLeft() -> Self {
        return .legacy(.left)
    }

    /// Creates a legacy right alignment
    public static func legacyRight() -> Self {
        return .legacy(.right)
    }
}
