import Foundation

/// Represents a CSS relative size value.
///
/// The `RelativeSize` type describes size keywords that define a size relative to
/// the computed size of the parent element. This data type is used in the `font` shorthand
/// and `font-size` properties.
///
/// Example:
/// ```swift
/// .fontSize(.smaller)  // font-size: smaller
/// .fontSize(.larger)   // font-size: larger
/// ```
///
/// - Note: When the inherited size is defined using an absolute size keyword, the relative
///         size value equates to the adjacent size in the absolute size table. Otherwise,
///         the relative increase or decrease in size is typically between 120% and 150%.
///
/// - SeeAlso: [MDN Web Docs on relative-size](https://developer.mozilla.org/en-US/docs/Web/CSS/relative-size)
public enum RelativeSize: String, Sendable, Hashable, CaseIterable {
    /// A relative size one size smaller than the inherited size
    case smaller

    /// A relative size one size larger than the inherited size
    case larger
}

/// Provides string conversion for CSS output
extension RelativeSize: CustomStringConvertible {
    /// Converts the relative size to its CSS string representation
    public var description: String {
        rawValue
    }
}
