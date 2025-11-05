import Foundation

/// Represents CSS legacy display values for backward compatibility.
///
/// The `DisplayLegacy` data type contains single-keyword values from CSS 2 that represent
/// a combination of outer and inner display types. In modern CSS, these values can be
/// replaced with two-keyword syntax.
///
/// Example:
/// ```swift
/// .display(.inlineBlock)   // Legacy: display: inline-block
/// .display(.inlineFlex)    // Legacy: display: inline-flex
/// ```
///
/// - Note: These are legacy values but still widely supported. In CSS Display Module Level 3,
///         they are equivalent to a combination of the outer and inner display types like
///         `inline flow-root` or `inline flex`.
///
/// - SeeAlso: [MDN Web Docs on display-legacy values](https://developer.mozilla.org/en-US/docs/Web/CSS/display-legacy)
public enum DisplayLegacy: String, Sendable, Hashable {
    /// Inline-level block container
    ///
    /// The element generates a block box that flows with surrounding content as if it were a
    /// single inline box. Equivalent to `inline flow-root` in modern syntax.
    /// ```css
    /// display: inline-block;
    /// ```
    case inlineBlock = "inline-block"

    /// Inline-level table
    ///
    /// The element behaves like an HTML `<table>` but as an inline box rather than a block-level box.
    /// Equivalent to `inline table` in modern syntax.
    /// ```css
    /// display: inline-table;
    /// ```
    case inlineTable = "inline-table"

    /// Inline-level flex container
    ///
    /// The element behaves like an inline element and lays out its content according to the
    /// flexbox model. Equivalent to `inline flex` in modern syntax.
    /// ```css
    /// display: inline-flex;
    /// ```
    case inlineFlex = "inline-flex"

    /// Inline-level grid container
    ///
    /// The element behaves like an inline element and lays out its content according to the
    /// grid model. Equivalent to `inline grid` in modern syntax.
    /// ```css
    /// display: inline-grid;
    /// ```
    case inlineGrid = "inline-grid"
}

/// Provides string conversion for CSS output
extension DisplayLegacy: CustomStringConvertible {
    /// Converts the display legacy value to its CSS string representation
    ///
    /// This method returns the raw string value for use in CSS properties.
    public var description: String {
        return rawValue
    }
}
