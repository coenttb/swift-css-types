import CSSTypeTypes
import Foundation

/// Represents the CSS `border-block-start-style` property, which sets the style of the logical block-start border.
///
/// This logical property sets the style for the block-start border of an element. The actual physical
/// border it affects depends on the element's writing mode, directionality, and text orientation.
/// For example, in horizontal top-to-bottom writing mode, `border-block-start-style` sets the style
/// of the top border.
///
/// Visual Reference:
/// ```
/// horizontal-tb writing mode:
/// ┌- - - - - - - - - - - - - -┐   ← border-block-start-style: dashed (top)
/// │                           │
/// │                           │
/// │                           │
/// │                           │
/// └───────────────────────────┘
///
/// vertical-rl writing mode:
/// ┌───────────────────────────┐
/// │                           │
/// │                           │
/// │                           │ ↑
/// │                           │ border-block-start-style: dashed (right)
/// └───────────────────────────┘
/// ```
///
/// Example:
/// ```swift
/// // Set the block-start border style to solid
/// .borderBlockStartStyle(.solid)
///
/// // Set the block-start border style to dotted
/// .borderBlockStartStyle(.dotted)
///
/// // Set the block-start border style to double
/// .borderBlockStartStyle(.double)
///
/// // Set the block-start border style to groove
/// .borderBlockStartStyle(.groove)
/// ```
///
/// - Note: This logical property adapts to the writing mode of the document,
///         making layout more flexible for different writing systems.
///
/// - SeeAlso: [MDN Web Docs on border-block-start-style](https://developer.mozilla.org/en-US/docs/Web/CSS/border-block-start-style)
public enum BorderBlockStartStyle: Property {

    public static let property: String = "border-block-start-style"

    /// A specific line style for the block-start border
    case lineStyle(LineStyle)

    /// Global CSS values
    case global(CSSTypeTypes.Global)

    /// Creates a border-block-start-style with a specific line style
    ///
    /// - Parameter style: The line style for the block-start border
    public init(_ style: LineStyle) {
        self = .lineStyle(style)
    }
}

/// Provides string conversion for CSS output
extension BorderBlockStartStyle: CustomStringConvertible {
    /// Converts the border-block-start-style to its CSS string representation
    ///
    /// This method generates CSS like:
    /// ```css
    /// border-block-start-style: solid;
    /// border-block-start-style: dotted;
    /// border-block-start-style: dashed;
    /// border-block-start-style: double;
    /// ```
    public var description: String {
        switch self {
        case .lineStyle(let lineStyle):
            return lineStyle.description
        case .global(let global):
            return global.description
        }
    }
}

/// Convenience methods for creating BorderBlockStartStyle values
extension BorderBlockStartStyle {
    /// The default border-block-start-style value (none)
    public static let `default` = BorderBlockStartStyle(.none)

    /// Creates a none border-block-start-style (invisible)
    public static let none = BorderBlockStartStyle(.none)

    /// Creates a hidden border-block-start-style (invisible, high priority in border collapsing)
    public static let hidden = BorderBlockStartStyle(.hidden)

    /// Creates a solid border-block-start-style
    public static let solid = BorderBlockStartStyle(.solid)

    /// Creates a dotted border-block-start-style
    public static let dotted = BorderBlockStartStyle(.dotted)

    /// Creates a dashed border-block-start-style
    public static let dashed = BorderBlockStartStyle(.dashed)

    /// Creates a double border-block-start-style
    public static let double = BorderBlockStartStyle(.double)

    /// Creates a groove border-block-start-style
    public static let groove = BorderBlockStartStyle(.groove)

    /// Creates a ridge border-block-start-style
    public static let ridge = BorderBlockStartStyle(.ridge)

    /// Creates a inset border-block-start-style
    public static let inset = BorderBlockStartStyle(.inset)

    /// Creates a outset border-block-start-style
    public static let outset = BorderBlockStartStyle(.outset)
}
