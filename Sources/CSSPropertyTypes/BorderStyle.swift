import CSSTypeTypes
import Foundation

/// Represents the CSS `border-style` shorthand property, which sets the line style for all sides of an element's border.
///
/// This property is a shorthand that sets the style for all four sides of an element's border.
/// You can specify from one to four styles to apply to different sides.
///
/// Visual Reference:
/// ```
/// One style for all sides:         Different styles for each side:
/// ┌───────────────────────┐        ┌╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍┐
/// │                       │        │                       │
/// │                       │        │                       │
/// │                       │        │                       │
/// │                       │        │                       │
/// │                       │        │                       │
/// │                       │        │                       │
/// └───────────────────────┘        └·······················┘
///  border-style: solid             border-style: dashed solid dotted
///
/// Different border styles:
/// ┌───────────────────────┐  ┌- - - - - - - - - - - - - -┐  ┌·······················┐
/// │                       │  │                           │  │                       │
/// │                       │  │                           │  │                       │
/// │        solid          │  │         dashed           │  │        dotted         │
/// │                       │  │                           │  │                       │
/// └───────────────────────┘  └- - - - - - - - - - - - - -┘  └·······················┘
///
/// ┌═══════════════════════┐  ┌─────────────────────────┐  ┌╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍┐
/// │                       │  ╱                         ╲  ╲                       ╱
/// │                       │  ╱                         ╲  ╲                       ╱
/// │        double         │  ╱          groove         ╲  ╲         ridge        ╱
/// │                       │  ╱                         ╲  ╲                       ╱
/// └═══════════════════════┘  └─────────────────────────┘  └╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍┘
/// ```
///
/// Example:
/// ```swift
/// // Same style for all four borders
/// .borderStyle(.solid)
///
/// // Different styles for top/bottom and left/right
/// .borderStyle(.dotted, .dashed)
///
/// // Different styles for top, sides, and bottom
/// .borderStyle(.solid, .dashed, .dotted)
///
/// // Different style for each side
/// .borderStyle(.solid, .dotted, .dashed, .double)
/// ```
///
/// - Note: This is a shorthand for setting the individual border style properties:
///         `border-top-style`, `border-right-style`, `border-bottom-style`, and `border-left-style`.
///
/// - SeeAlso: [MDN Web Docs on border-style](https://developer.mozilla.org/en-US/docs/Web/CSS/border-style)
public enum BorderStyle: Property {

    public static let property: String = "border-style"

    /// Same style for all four sides
    case all(LineStyle)

    /// Different styles for vertical (top/bottom) and horizontal (left/right) sides
    case vertical_horizontal(LineStyle, LineStyle)

    /// Different styles for top, horizontal (left/right), and bottom sides
    case top_horizontal_bottom(LineStyle, LineStyle, LineStyle)

    /// Different styles for each side in clockwise order: top, right, bottom, left
    case top_right_bottom_left(LineStyle, LineStyle, LineStyle, LineStyle)

    /// Global CSS values
    case global(CSSTypeTypes.Global)

    /// Creates a border style with the same value for all sides
    ///
    /// - Parameter style: The style for all sides
    public init(_ style: LineStyle) {
        self = .all(style)
    }

    /// Creates a border style with two values (vertical and horizontal)
    ///
    /// - Parameters:
    ///   - vertical: The style for top and bottom borders
    ///   - horizontal: The style for left and right borders
    public init(_ vertical: LineStyle, _ horizontal: LineStyle) {
        self = .vertical_horizontal(vertical, horizontal)
    }

    /// Creates a border style with three values (top, horizontal, bottom)
    ///
    /// - Parameters:
    ///   - top: The style for the top border
    ///   - horizontal: The style for left and right borders
    ///   - bottom: The style for the bottom border
    public init(_ top: LineStyle, _ horizontal: LineStyle, _ bottom: LineStyle) {
        self = .top_horizontal_bottom(top, horizontal, bottom)
    }

    /// Creates a border style with four values (one for each side)
    ///
    /// - Parameters:
    ///   - top: The style for the top border
    ///   - right: The style for the right border
    ///   - bottom: The style for the bottom border
    ///   - left: The style for the left border
    public init(_ top: LineStyle, _ right: LineStyle, _ bottom: LineStyle, _ left: LineStyle) {
        self = .top_right_bottom_left(top, right, bottom, left)
    }
}

/// Provides string conversion for CSS output
extension BorderStyle: CustomStringConvertible {
    /// Converts the border-style to its CSS string representation
    ///
    /// This method generates CSS like:
    /// ```css
    /// border-style: solid;
    /// border-style: dotted dashed;
    /// border-style: solid dashed dotted;
    /// border-style: solid dotted dashed double;
    /// ```
    public var description: String {
        switch self {
        case .all(let style):
            return style.description
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
}

/// Convenience methods for creating border style values
extension BorderStyle {
    /// The default border style (none)
    public static let `default` = BorderStyle(.none)

    /// Creates a none border style (invisible)
    public static let none = BorderStyle(.none)

    /// Creates a hidden border style (invisible, high priority in border collapsing)
    public static let hidden = BorderStyle(.hidden)

    /// Creates a solid border style
    public static let solid = BorderStyle(.solid)

    /// Creates a dotted border style
    public static let dotted = BorderStyle(.dotted)

    /// Creates a dashed border style
    public static let dashed = BorderStyle(.dashed)

    /// Creates a double border style
    public static let double = BorderStyle(.double)

    /// Creates a groove border style
    public static let groove = BorderStyle(.groove)

    /// Creates a ridge border style
    public static let ridge = BorderStyle(.ridge)

    /// Creates an inset border style
    public static let inset = BorderStyle(.inset)

    /// Creates an outset border style
    public static let outset = BorderStyle(.outset)
}
