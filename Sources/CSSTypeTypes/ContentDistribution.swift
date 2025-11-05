import Foundation

/// Represents CSS content distribution values for aligning items within a container.
///
/// The `ContentDistribution` data type is used by properties like `justify-content`,
/// `align-content`, and the `place-content` shorthand to distribute space among items
/// in flex containers, grid containers, and other layout models.
///
/// Example:
/// ```swift
/// .justifyContent(.spaceBetween)  // Distribute items with equal space between
/// .alignContent(.spaceAround)     // Distribute items with equal space around
/// ```
///
/// - Note: Content distribution values determine how extra space is distributed
///         when the total size of all items is less than the container size.
///
/// - SeeAlso: [MDN Web Docs on content-distribution values](https://developer.mozilla.org/en-US/docs/Web/CSS/content-distribution)
public enum ContentDistribution: String, Sendable, Hashable, CaseIterable {
    /// Distributes items evenly with no space at the edges
    ///
    /// Places the first item at the start, the last item at the end, and distributes
    /// remaining items with equal space between them.
    /// ```css
    /// justify-content: space-between;
    /// ```
    case spaceBetween = "space-between"

    /// Distributes items evenly with half-size spaces at the edges
    ///
    /// Places equal space between items, with half-size spaces at the start and end.
    /// ```css
    /// justify-content: space-around;
    /// ```
    case spaceAround = "space-around"

    /// Distributes items with equal space between, before, and after items
    ///
    /// Places equal space between all items and at both edges.
    /// ```css
    /// justify-content: space-evenly;
    /// ```
    case spaceEvenly = "space-evenly"

    /// Stretches items to fill the container
    ///
    /// If items are smaller than the container, they are stretched to fill the available space
    /// (respecting max-width/max-height constraints).
    /// ```css
    /// justify-content: stretch;
    /// ```
    case stretch
}

/// Provides string conversion for CSS output
extension ContentDistribution: CustomStringConvertible {
    /// Converts the content distribution value to its CSS string representation
    ///
    /// This method returns the raw string value for use in CSS properties.
    public var description: String {
        return rawValue
    }
}
