import Foundation
import CSSTypeTypes

/// Represents the CSS `border-bottom-style` property, which sets the style of the bottom border.
///
/// This property sets the line style for the bottom border of an element.
///
/// Visual Reference:
/// ```
/// Different styles applied to the bottom border:
/// ┌───────────────────────────┐   ┌───────────────────────────┐
/// │                           │   │                           │
/// │                           │   │                           │
/// │                           │   │                           │
/// │                           │   │                           │
/// └───────────────────────────┘   └- - - - - - - - - - - - - -┘
///  solid                           dashed
///
/// ┌───────────────────────────┐   ┌───────────────────────────┐
/// │                           │   │                           │
/// │                           │   │                           │
/// │                           │   │                           │
/// │                           │   │                           │
/// └∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙┘   └═══════════════════════════┘
///  dotted                          double
/// ```
///
/// Example:
/// ```swift
/// // Set the bottom border style to solid
/// .borderBottomStyle(.solid)
///
/// // Set the bottom border style to dotted
/// .borderBottomStyle(.dotted)
///
/// // Set the bottom border style to double
/// .borderBottomStyle(.double)
///
/// // Set the bottom border style to groove
/// .borderBottomStyle(.groove)
/// ```
///
/// - Note: For the border to be visible, you must set this property to a value other than `none` (the default).
///
/// - SeeAlso: [MDN Web Docs on border-bottom-style](https://developer.mozilla.org/en-US/docs/Web/CSS/border-bottom-style)
public enum BorderBottomStyle: Property {
    
    public static let property: String = "border-bottom-style"
    
    /// A specific line style for the bottom border
    case lineStyle(LineStyle)
    
    /// Global CSS values
    case global(CSSTypeTypes.Global)
    
    /// Creates a border-bottom-style with a specific line style
    ///
    /// - Parameter style: The line style for the bottom border
    public init(_ style: LineStyle) {
        self = .lineStyle(style)
    }
}

/// Provides string conversion for CSS output
extension BorderBottomStyle: CustomStringConvertible {
    /// Converts the border-bottom-style to its CSS string representation
    ///
    /// This method generates CSS like:
    /// ```css
    /// border-bottom-style: solid;
    /// border-bottom-style: dotted;
    /// border-bottom-style: dashed;
    /// border-bottom-style: double;
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

/// Convenience methods for creating BorderBottomStyle values
extension BorderBottomStyle {
    /// The default border-bottom-style value (none)
    public static let `default` = BorderBottomStyle(.none)
    
    /// Creates a none border-bottom-style (invisible)
    public static let none = BorderBottomStyle(.none)
    
    /// Creates a hidden border-bottom-style (invisible, high priority in border collapsing)
    public static let hidden = BorderBottomStyle(.hidden)
    
    /// Creates a solid border-bottom-style
    public static let solid = BorderBottomStyle(.solid)
    
    /// Creates a dotted border-bottom-style
    public static let dotted = BorderBottomStyle(.dotted)
    
    /// Creates a dashed border-bottom-style
    public static let dashed = BorderBottomStyle(.dashed)
    
    /// Creates a double border-bottom-style
    public static let double = BorderBottomStyle(.double)
    
    /// Creates a groove border-bottom-style
    public static let groove = BorderBottomStyle(.groove)
    
    /// Creates a ridge border-bottom-style
    public static let ridge = BorderBottomStyle(.ridge)
    
    /// Creates a inset border-bottom-style
    public static let inset = BorderBottomStyle(.inset)
    
    /// Creates a outset border-bottom-style
    public static let outset = BorderBottomStyle(.outset)
}
