//
// ScrollPadding.swift

import CSSTypeTypes

/// The `scroll-padding` CSS property is a shorthand property that sets scroll padding on all sides of an element at once,
/// much like the padding property does for padding on an element. The scroll-padding properties define offsets for the
/// optimal viewing region of the scrollport: the region used as the target region for placing things in view of the user.
///
/// This allows the author to exclude regions of the scrollport that are obscured by other content (such as fixed-positioned
/// toolbars or sidebars), or to put more breathing room between a targeted element and the edges of the scrollport.
///
/// ```css
/// scroll-padding: auto;
/// scroll-padding: 10px;
/// scroll-padding: 1em 2em 3em 4em;
/// scroll-padding: 10%;
/// ```
public enum ScrollPadding: Property, LengthPercentageConvertible, CustomStringConvertible {
    public static let property: String = "scroll-padding"

    /// Keyword values
    case auto

    /// A single value for all four sides
    case all(LengthPercentage)

    /// Two values: top/bottom and right/left
    case vertical_horizontal(LengthPercentage, LengthPercentage)

    /// Three values: top, right/left, bottom
    case top_horizontal_bottom(LengthPercentage, LengthPercentage, LengthPercentage)

    /// Four values: top, right, bottom, left
    case top_right_bottom_left(LengthPercentage, LengthPercentage, LengthPercentage, LengthPercentage)

    /// Global CSS value
    case global(CSSTypeTypes.Global)

    public var description: String {
        switch self {
        case .auto:
            return "auto"
        case .all(let value):
            return value.description
        case .vertical_horizontal(let vertical, let horizontal):
            return "\(vertical.description) \(horizontal.description)"
        case .top_horizontal_bottom(let top, let horizontal, let bottom):
            return "\(top.description) \(horizontal.description) \(bottom.description)"
        case .top_right_bottom_left(let top, let right, let bottom, let left):
            return "\(top.description) \(right.description) \(bottom.description) \(left.description)"
        case .global(let global):
            return global.description
        }
    }

    public static func lengthPercentage(_ value: LengthPercentage) -> ScrollPadding {
        .all(value)
    }

    /// Creates a ScrollPadding with vertical and horizontal percentage values
    public static func percent(vertical: Percentage, horizontal: Percentage) -> Self {
        .vertical_horizontal(.percentage(vertical), .percentage(horizontal))
    }

    /// Creates a ScrollPadding with top, horizontal, and bottom percentage values
    public static func percent(top: Percentage, horizontal: Percentage, bottom: Percentage) -> Self {
        .top_horizontal_bottom(.percentage(top), .percentage(horizontal), .percentage(bottom))
    }

    /// Creates a ScrollPadding with top, right, bottom, and left percentage values
    public static func percent(top: Percentage, right: Percentage, bottom: Percentage, left: Percentage) -> Self {
        .top_right_bottom_left(.percentage(top), .percentage(right), .percentage(bottom), .percentage(left))
    }
}
