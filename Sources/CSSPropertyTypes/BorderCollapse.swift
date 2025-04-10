import Foundation
import CSSTypeTypes

/// Represents the CSS `border-collapse` property, which determines whether table borders
/// are collapsed or separated.
///
/// This property specifies whether adjacent table cell borders are collapsed into a
/// single border or detached as in standard HTML. This property applies to table
/// and inline-table elements.
///
/// Visual Reference:
/// ```
/// Separate borders:               Collapsed borders:
/// ┌───────┬───────┬───────┐       ┌───────┬───────┬───────┐
/// │       │       │       │       │       │       │       │
/// │  A    │  B    │  C    │       │  A    │  B    │  C    │
/// │       │       │       │       │       │       │       │
/// ├───────┼───────┼───────┤       ├───────┼───────┼───────┤
/// │       │       │       │       │       │       │       │
/// │  D    │  E    │  F    │       │  D    │  E    │  F    │
/// │       │       │       │       │       │       │       │
/// └───────┴───────┴───────┘       └───────┴───────┴───────┘
///  border-collapse: separate       border-collapse: collapse
/// ```
///
/// Example:
/// ```swift
/// // Set table borders to be collapsed
/// .borderCollapse(.collapse)
///
/// // Set table borders to be separated (default)
/// .borderCollapse(.separate)
/// ```
///
/// - Note: When `border-collapse` is set to `collapse`, the `border-spacing` property has no effect.
///         Also, when cells are collapsed, the `border-style` value of `inset` behaves like `ridge`,
///         and `outset` behaves like `groove`.
///
/// - SeeAlso: [MDN Web Docs on border-collapse](https://developer.mozilla.org/en-US/docs/Web/CSS/border-collapse)
public enum BorderCollapse: Property {
    public static let property: String = "border-collapse"
    
    /// Cells share borders (collapsed borders)
    case collapse
    
    /// Cells have distinct borders (separated borders)
    case separate
    
    /// Global CSS values
    case global(CSSTypeTypes.Global)
}

/// Provides string conversion for CSS output
extension BorderCollapse: CustomStringConvertible {
    /// Converts the border-collapse to its CSS string representation
    ///
    /// This method generates CSS like:
    /// ```css
    /// border-collapse: collapse;
    /// border-collapse: separate;
    /// ```
    public var description: String {
        switch self {
        case .collapse:
            return "collapse"
        case .separate:
            return "separate"
        case .global(let global):
            return global.description
        }
    }
}

/// Convenience values for BorderCollapse
extension BorderCollapse {
    /// The default value for border-collapse (separate)
    public static let `default` = BorderCollapse.separate
}
