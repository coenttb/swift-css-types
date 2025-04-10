import Foundation
import CSSTypeTypes

/// Represents the CSS `border-top-style` property, which sets the style of the top border.
///
/// This property sets the line style for the top border of an element.
///
/// Visual Reference:
/// ```
/// Different styles applied to the top border:
/// ┌───────────────────────────┐   ┌- - - - - - - - - - - - - -┐
/// │                           │   │                           │
/// │                           │   │                           │
/// │                           │   │                           │
/// │                           │   │                           │
/// └───────────────────────────┘   └───────────────────────────┘
///  solid                           dashed
///
/// ┌·······················┐   ┌═══════════════════════════┐
/// │                       │   │                           │
/// │                       │   │                           │
/// │                       │   │                           │
/// │                       │   │                           │
/// └───────────────────────┘   └───────────────────────────┘
///  dotted                      double
/// ```
///
/// Example:
/// ```swift
/// // Set the top border style to solid
/// .borderTopStyle(.solid)
///
/// // Set the top border style to dotted
/// .borderTopStyle(.dotted)
///
/// // Set the top border style to double
/// .borderTopStyle(.double)
///
/// // Set the top border style to groove
/// .borderTopStyle(.groove)
/// ```
///
/// - Note: For the border to be visible, you must set this property to a value other than `none` (the default).
///
/// - SeeAlso: [MDN Web Docs on border-top-style](https://developer.mozilla.org/en-US/docs/Web/CSS/border-top-style)
public enum BorderTopStyle: Property {
    public static let property: String = "border-top-style"
    
    /// A specific line style for the top border
    case lineStyle(LineStyle)
    
    /// Global CSS values
    case global(CSSTypeTypes.Global)
    
    /// Creates a border-top-style with a specific line style
    ///
    /// - Parameter style: The line style for the top border
    public init(_ style: LineStyle) {
        self = .lineStyle(style)
    }
}

/// Provides string conversion for CSS output
extension BorderTopStyle: CustomStringConvertible {
    /// Converts the border-top-style to its CSS string representation
    ///
    /// This method generates CSS like:
    /// ```css
    /// border-top-style: solid;
    /// border-top-style: dotted;
    /// border-top-style: dashed;
    /// border-top-style: double;
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

/// Convenience methods for creating BorderTopStyle values
extension BorderTopStyle {
    /// The default border-top-style value (none)
    public static let `default` = BorderTopStyle(.none)
    
    /// Creates a none border-top-style (invisible)
    public static let none = BorderTopStyle(.none)
    
    /// Creates a hidden border-top-style (invisible, high priority in border collapsing)
    public static let hidden = BorderTopStyle(.hidden)
    
    /// Creates a solid border-top-style
    public static let solid = BorderTopStyle(.solid)
    
    /// Creates a dotted border-top-style
    public static let dotted = BorderTopStyle(.dotted)
    
    /// Creates a dashed border-top-style
    public static let dashed = BorderTopStyle(.dashed)
    
    /// Creates a double border-top-style
    public static let double = BorderTopStyle(.double)
    
    /// Creates a groove border-top-style
    public static let groove = BorderTopStyle(.groove)
    
    /// Creates a ridge border-top-style
    public static let ridge = BorderTopStyle(.ridge)
    
    /// Creates a inset border-top-style
    public static let inset = BorderTopStyle(.inset)
    
    /// Creates a outset border-top-style
    public static let outset = BorderTopStyle(.outset)
}
