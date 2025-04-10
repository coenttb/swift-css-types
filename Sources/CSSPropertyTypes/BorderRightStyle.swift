import Foundation
import CSSTypeTypes

/// Represents the CSS `border-right-style` property, which sets the style of the right border.
///
/// This property sets the line style for the right border of an element.
///
/// Visual Reference:
/// ```
/// Different styles applied to the right border:
/// ┌───────────────────────┬─────┐        ┌───────────────────────┬╍╍╍╍╍┐
/// │                       │     │        │                       ┆     ┆
/// │                       │     │        │                       ┆     ┆
/// │                       │     │        │                       ┆     ┆
/// │                       │     │        │                       ┆     ┆
/// │                       │     │        │                       ┆     ┆
/// └───────────────────────┴─────┘        └───────────────────────┴╍╍╍╍╍┘
///                           solid                                  dashed
///
/// ┌───────────────────────┬·····┐        ┌───────────────────────┬═════┐
/// │                       ┆     ┆        │                       ┃     ┃
/// │                       ┆     ┆        │                       ┃     ┃
/// │                       ┆     ┆        │                       ┃     ┃
/// │                       ┆     ┆        │                       ┃     ┃
/// │                       ┆     ┆        │                       ┃     ┃
/// └───────────────────────┴·····┘        └───────────────────────┴═════┘
///                           dotted                                 double
/// ```
///
/// Example:
/// ```swift
/// // Set the right border style to solid
/// .borderRightStyle(.solid)
///
/// // Set the right border style to dotted
/// .borderRightStyle(.dotted)
///
/// // Set the right border style to double
/// .borderRightStyle(.double)
///
/// // Set the right border style to groove
/// .borderRightStyle(.groove)
/// ```
///
/// - Note: For the border to be visible, you must set this property to a value other than `none` (the default).
///
/// - SeeAlso: [MDN Web Docs on border-right-style](https://developer.mozilla.org/en-US/docs/Web/CSS/border-right-style)
public enum BorderRightStyle: Property {
    
    public static let property: String = "border-right-style"
    
    /// A specific line style for the right border
    case lineStyle(LineStyle)
    
    /// Global CSS values
    case global(CSSTypeTypes.Global)
    
    /// Creates a border-right-style with a specific line style
    ///
    /// - Parameter style: The line style for the right border
    public init(_ style: LineStyle) {
        self = .lineStyle(style)
    }
}

/// Provides string conversion for CSS output
extension BorderRightStyle: CustomStringConvertible {
    /// Converts the border-right-style to its CSS string representation
    ///
    /// This method generates CSS like:
    /// ```css
    /// border-right-style: solid;
    /// border-right-style: dotted;
    /// border-right-style: dashed;
    /// border-right-style: double;
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

/// Convenience methods for creating BorderRightStyle values
extension BorderRightStyle {
    /// The default border-right-style value (none)
    public static let `default` = BorderRightStyle(.none)
    
    /// Creates a none border-right-style (invisible)
    public static let none = BorderRightStyle(.none)
    
    /// Creates a hidden border-right-style (invisible, high priority in border collapsing)
    public static let hidden = BorderRightStyle(.hidden)
    
    /// Creates a solid border-right-style
    public static let solid = BorderRightStyle(.solid)
    
    /// Creates a dotted border-right-style
    public static let dotted = BorderRightStyle(.dotted)
    
    /// Creates a dashed border-right-style
    public static let dashed = BorderRightStyle(.dashed)
    
    /// Creates a double border-right-style
    public static let double = BorderRightStyle(.double)
    
    /// Creates a groove border-right-style
    public static let groove = BorderRightStyle(.groove)
    
    /// Creates a ridge border-right-style
    public static let ridge = BorderRightStyle(.ridge)
    
    /// Creates a inset border-right-style
    public static let inset = BorderRightStyle(.inset)
    
    /// Creates a outset border-right-style
    public static let outset = BorderRightStyle(.outset)
}
