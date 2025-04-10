import Foundation
import CSSTypeTypes

/// Represents the CSS `border-inline-start-style` property, which defines the style of the logical
/// inline-start border of an element.
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
///  ▲                                                ▲
/// border-inline-start-style     border-inline-start-style
///        (left)                         (right)
///
/// vertical-rl:                vertical-lr:
/// ┌─────────────────────┐     ┌─────────────────────┐
/// │                     │     │                     │
/// ├─────────────────────┤     ├─────────────────────┤
/// │                     │     │                     │
/// │                     │     │                     │
/// └─────────────────────┘     └─────────────────────┘
///                     ▲        ▲
///   border-inline-start-style   border-inline-start-style
///           (top)                   (bottom)
/// ```
///
/// Example:
/// ```swift
/// // Set the inline-start border style to dotted
/// .borderInlineStartStyle(.dotted)
///
/// // Set the inline-start border style to dashed
/// .borderInlineStartStyle(.dashed)
///
/// // Set the inline-start border style to groove
/// .borderInlineStartStyle(.groove)
/// ```
///
/// - SeeAlso: [MDN Web Docs on border-inline-start-style](https://developer.mozilla.org/en-US/docs/Web/CSS/border-inline-start-style)
public enum BorderInlineStartStyle: Property {
    
    public static let property: String = "border-inline-start-style"
    
    /// A specific line style for the inline-start border
    case lineStyle(LineStyle)
    
    /// Global CSS values
    case global(CSSTypeTypes.Global)
    
    /// Creates a border-inline-start-style with a specific line style
    ///
    /// - Parameter style: The line style for the inline-start border
    public init(_ style: LineStyle) {
        self = .lineStyle(style)
    }
}

/// Provides string conversion for CSS output
extension BorderInlineStartStyle: CustomStringConvertible {
    /// Converts the border-inline-start-style to its CSS string representation
    ///
    /// This method generates CSS like:
    /// ```css
    /// border-inline-start-style: dotted;
    /// border-inline-start-style: dashed;
    /// border-inline-start-style: groove;
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

/// Convenience methods for creating BorderInlineStartStyle values
extension BorderInlineStartStyle {
    /// The default border-inline-start-style value (none)
    public static let `default` = BorderInlineStartStyle(.none)
    
    /// Creates a none (invisible) border-inline-start-style
    public static let none = BorderInlineStartStyle(.none)
    
    /// Creates a hidden (invisible, but with higher priority) border-inline-start-style
    public static let hidden = BorderInlineStartStyle(.hidden)
    
    /// Creates a dotted border-inline-start-style
    public static let dotted = BorderInlineStartStyle(.dotted)
    
    /// Creates a dashed border-inline-start-style
    public static let dashed = BorderInlineStartStyle(.dashed)
    
    /// Creates a solid border-inline-start-style
    public static let solid = BorderInlineStartStyle(.solid)
    
    /// Creates a double border-inline-start-style
    public static let double = BorderInlineStartStyle(.double)
    
    /// Creates a groove border-inline-start-style
    public static let groove = BorderInlineStartStyle(.groove)
    
    /// Creates a ridge border-inline-start-style
    public static let ridge = BorderInlineStartStyle(.ridge)
    
    /// Creates an inset border-inline-start-style
    public static let inset = BorderInlineStartStyle(.inset)
    
    /// Creates an outset border-inline-start-style
    public static let outset = BorderInlineStartStyle(.outset)
}
