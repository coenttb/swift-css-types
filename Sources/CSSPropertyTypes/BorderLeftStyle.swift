import CSSTypeTypes
import Foundation

/// Represents the CSS `border-left-style` property, which sets the style of the left border.
///
/// This property sets the line style for the left border of an element.
///
/// Visual Reference:
/// ```
/// Different styles applied to the left border:
/// ┌─────┐        ┌╍╍╍╍╍┐
/// │     │        ┆     ┆
/// │     │        ┆     ┆
/// │     │        ┆     ┆
/// │     │        ┆     ┆
/// └─────┘        └╍╍╍╍╍┘
///  solid          dashed
///
/// ┌·····┐        ┌═════┐
/// ┆     ┆        ┃     ┃
/// ┆     ┆        ┃     ┃
/// ┆     ┆        ┃     ┃
/// ┆     ┆        ┃     ┃
/// └·····┘        └═════┘
///  dotted         double
/// ```
///
/// Example:
/// ```swift
/// // Set the left border style to solid
/// .borderLeftStyle(.solid)
///
/// // Set the left border style to dotted
/// .borderLeftStyle(.dotted)
///
/// // Set the left border style to double
/// .borderLeftStyle(.double)
///
/// // Set the left border style to groove
/// .borderLeftStyle(.groove)
/// ```
///
/// - Note: For the border to be visible, you must set this property to a value other than `none` (the default).
///
/// - SeeAlso: [MDN Web Docs on border-left-style](https://developer.mozilla.org/en-US/docs/Web/CSS/border-left-style)
public enum BorderLeftStyle: Property {

    public static let property: String = "border-left-style"

    /// A specific line style for the left border
    case lineStyle(LineStyle)

    /// Global CSS values
    case global(CSSTypeTypes.Global)

    /// Creates a border-left-style with a specific line style
    ///
    /// - Parameter style: The line style for the left border
    public init(_ style: LineStyle) {
        self = .lineStyle(style)
    }
}

/// Provides string conversion for CSS output
extension BorderLeftStyle: CustomStringConvertible {
    /// Converts the border-left-style to its CSS string representation
    ///
    /// This method generates CSS like:
    /// ```css
    /// border-left-style: solid;
    /// border-left-style: dotted;
    /// border-left-style: dashed;
    /// border-left-style: double;
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

/// Convenience methods for creating BorderLeftStyle values
extension BorderLeftStyle {
    /// The default border-left-style value (none)
    public static let `default` = BorderLeftStyle(.none)

    /// Creates a none border-left-style (invisible)
    public static let none = BorderLeftStyle(.none)

    /// Creates a hidden border-left-style (invisible, high priority in border collapsing)
    public static let hidden = BorderLeftStyle(.hidden)

    /// Creates a solid border-left-style
    public static let solid = BorderLeftStyle(.solid)

    /// Creates a dotted border-left-style
    public static let dotted = BorderLeftStyle(.dotted)

    /// Creates a dashed border-left-style
    public static let dashed = BorderLeftStyle(.dashed)

    /// Creates a double border-left-style
    public static let double = BorderLeftStyle(.double)

    /// Creates a groove border-left-style
    public static let groove = BorderLeftStyle(.groove)

    /// Creates a ridge border-left-style
    public static let ridge = BorderLeftStyle(.ridge)

    /// Creates a inset border-left-style
    public static let inset = BorderLeftStyle(.inset)

    /// Creates a outset border-left-style
    public static let outset = BorderLeftStyle(.outset)
}
