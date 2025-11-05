import Foundation

/// Represents CSS line style values.
///
/// The `LineStyle` type represents keyword values that define the style of a line, or the
/// lack of a line. Line styles are used in border properties and column rules.
///
/// Example:
/// ```swift
/// .borderStyle(.solid)            // border-style: solid
/// .borderTopStyle(.dashed)        // border-top-style: dashed
/// .columnRuleStyle(.double)       // column-rule-style: double
/// ```
///
/// - Note: When using the `hidden` value with table cells and border collapsing, it has
///         the highest priority. If any other conflicting border is set, the hidden border
///         won't be displayed.
///
/// - SeeAlso: [MDN Web Docs on line-style](https://developer.mozilla.org/en-US/docs/Web/CSS/line-style)
public enum LineStyle: String, Sendable, Hashable, CaseIterable {
    /// Displays no line. In border collapsing, has the lowest priority.
    case none

    /// Displays no line. In border collapsing, has the highest priority.
    case hidden

    /// Displays a series of round dots.
    case dotted

    /// Displays a series of short square-ended dashes.
    case dashed

    /// Displays a single, straight, solid line.
    case solid

    /// Displays two straight lines with space between them.
    case double

    /// Displays a border with a carved appearance.
    case groove

    /// Displays a border with an extruded appearance.
    case ridge

    /// Displays a border that makes the element appear embedded.
    case inset

    /// Displays a border that makes the element appear embossed.
    case outset
}

/// Provides string conversion for CSS output
extension LineStyle: CustomStringConvertible {
    /// Converts the line style to its CSS string representation
    public var description: String {
        return rawValue
    }
}

/// Additional line style related functionality
extension LineStyle {
    /// Whether the line style is a 3D effect style
    public var is3D: Bool {
        switch self {
        case .groove, .ridge, .inset, .outset:
            return true
        default:
            return false
        }
    }

    /// Whether the line style is visible
    public var isVisible: Bool {
        switch self {
        case .none, .hidden:
            return false
        default:
            return true
        }
    }

    /// Returns the opposite 3D effect style, if applicable
    public var opposite3D: LineStyle? {
        switch self {
        case .groove: return .ridge
        case .ridge: return .groove
        case .inset: return .outset
        case .outset: return .inset
        default: return nil
        }
    }
}
