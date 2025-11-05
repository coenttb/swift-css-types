import Foundation

/// Represents CSS overflow position values for alignment properties.
///
/// The `OverflowPosition` type defines how an alignment subject that is larger than its
/// alignment container will overflow that container. This is used with various alignment
/// properties like `align-content`, `align-items`, `align-self`, etc.
///
/// Example:
/// ```swift
/// .alignItems(.safe, .center)          // align-items: safe center
/// .justifySelf(.unsafe, .end)          // justify-self: unsafe end
/// ```
///
/// - Note: If omitted in CSS, the default overflow alignment is a blend of safe and unsafe.
///
/// - SeeAlso: [MDN Web Docs on overflow-position](https://developer.mozilla.org/en-US/docs/Web/CSS/overflow-position)
public enum OverflowPosition: String, Sendable, Hashable, CaseIterable {
    /// If the alignment subject overflows the container, it's aligned as if the mode were start.
    ///
    /// This ensures the content is visible by potentially overriding the specified alignment
    /// to prevent overflow that would be invisible or inaccessible.
    case safe

    /// The specified alignment value is honored regardless of overflow.
    ///
    /// This may result in content that extends beyond the viewport's edges
    /// and can't be scrolled to.
    case unsafe
}

/// Provides string conversion for CSS output
extension OverflowPosition: CustomStringConvertible {
    /// Converts the overflow position to its CSS string representation
    public var description: String {
        return rawValue
    }
}
