import Foundation
import CSSTypeTypes

/// Represents the CSS `border-inline-end-style` property, which defines the style of the logical
/// inline-end border of an element.
///
/// This logical property maps to a physical border style depending on the element's writing mode,
/// directionality, and text orientation. It corresponds to one of `border-top-style`, `border-right-style`,
/// `border-bottom-style`, or `border-left-style` properties.
///
/// Visual Reference:
/// ```
/// horizontal-tb + ltr:          horizontal-tb + rtl:
/// ┌─────────────────────┐       ┌─────────────────────┐
/// │                     │       │                     │
/// │                     │       │                     │
/// │                     │       │                     │
/// │                     │       │                     │
/// └─────────────────────┘       └─────────────────────┘
///                    ▲         ▲
///  border-inline-end-style    border-inline-end-style
///         (right)                    (left)
///
/// vertical-rl:                vertical-lr:
/// ┌─────────────────────┐     ┌─────────────────────┐
/// │                     │     │                     │
/// ├─────────────────────┤     ├─────────────────────┤
/// │                     │     │                     │
/// │                     │     │                     │
/// └─────────────────────┘     └─────────────────────┘
///  ▲                                               ▲
/// border-inline-end-style              border-inline-end-style
///     (bottom)                              (top)
/// ```
///
/// Example:
/// ```swift
/// // Set the inline-end border style to dotted
/// .borderInlineEndStyle(.dotted)
///
/// // Set the inline-end border style to dashed
/// .borderInlineEndStyle(.dashed)
///
/// // Set the inline-end border style to groove
/// .borderInlineEndStyle(.groove)
/// ```
///
/// - SeeAlso: [MDN Web Docs on border-inline-end-style](https://developer.mozilla.org/en-US/docs/Web/CSS/border-inline-end-style)
public enum BorderInlineEndStyle: Property {
    
    public static let property: String = "border-inline-end-style"
    
    /// A specific line style for the inline-end border
    case lineStyle(LineStyle)
    
    /// Global CSS values
    case global(CSSTypeTypes.Global)
    
    /// Creates a border-inline-end-style with a specific line style
    ///
    /// - Parameter style: The line style for the inline-end border
    public init(_ style: LineStyle) {
        self = .lineStyle(style)
    }
}

/// Provides string conversion for CSS output
extension BorderInlineEndStyle: CustomStringConvertible {
    /// Converts the border-inline-end-style to its CSS string representation
    ///
    /// This method generates CSS like:
    /// ```css
    /// border-inline-end-style: dotted;
    /// border-inline-end-style: dashed;
    /// border-inline-end-style: groove;
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

/// Convenience methods for creating BorderInlineEndStyle values
extension BorderInlineEndStyle {
    /// The default border-inline-end-style value (none)
    public static let `default` = BorderInlineEndStyle(.none)
    
    /// Creates a none (invisible) border-inline-end-style
    public static let none = BorderInlineEndStyle(.none)
    
    /// Creates a hidden (invisible, but with higher priority) border-inline-end-style
    public static let hidden = BorderInlineEndStyle(.hidden)
    
    /// Creates a dotted border-inline-end-style
    public static let dotted = BorderInlineEndStyle(.dotted)
    
    /// Creates a dashed border-inline-end-style
    public static let dashed = BorderInlineEndStyle(.dashed)
    
    /// Creates a solid border-inline-end-style
    public static let solid = BorderInlineEndStyle(.solid)
    
    /// Creates a double border-inline-end-style
    public static let double = BorderInlineEndStyle(.double)
    
    /// Creates a groove border-inline-end-style
    public static let groove = BorderInlineEndStyle(.groove)
    
    /// Creates a ridge border-inline-end-style
    public static let ridge = BorderInlineEndStyle(.ridge)
    
    /// Creates an inset border-inline-end-style
    public static let inset = BorderInlineEndStyle(.inset)
    
    /// Creates an outset border-inline-end-style
    public static let outset = BorderInlineEndStyle(.outset)
}
