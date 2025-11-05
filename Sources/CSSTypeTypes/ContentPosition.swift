import Foundation

/// Represents CSS content position values for aligning content within a container.
///
/// The `ContentPosition` data type is used by properties like `justify-content`,
/// `align-content`, and the `place-content` shorthand to position a container's
/// contents as a whole within the available space.
///
/// Example:
/// ```swift
/// .justifyContent(.center)     // Center items horizontally
/// .alignContent(.start)        // Align items to the top
/// ```
///
/// - Note: While content distribution values (`space-between`, etc.) distribute space
///         between items, content position values align the entire group of items
///         within the container.
///
/// - SeeAlso: [MDN Web Docs on content-position values](https://developer.mozilla.org/en-US/docs/Web/CSS/content-position)
public enum ContentPosition: String, Sendable, Hashable, CaseIterable {
    /// Centers the content within the container
    ///
    /// The content is centered along the axis.
    /// ```css
    /// justify-content: center;
    /// ```
    case center

    /// Aligns the content to the start edge of the container
    ///
    /// The content is aligned to the start of the axis (left in LTR, right in RTL).
    /// ```css
    /// justify-content: start;
    /// ```
    case start

    /// Aligns the content to the end edge of the container
    ///
    /// The content is aligned to the end of the axis (right in LTR, left in RTL).
    /// ```css
    /// justify-content: end;
    /// ```
    case end

    /// Aligns the content to the start of a flex container
    ///
    /// In flex layouts, aligns to the main-start or cross-start edge.
    /// Identical to `start` in non-flex layouts.
    /// ```css
    /// justify-content: flex-start;
    /// ```
    case flexStart = "flex-start"

    /// Aligns the content to the end of a flex container
    ///
    /// In flex layouts, aligns to the main-end or cross-end edge.
    /// Identical to `end` in non-flex layouts.
    /// ```css
    /// justify-content: flex-end;
    /// ```
    case flexEnd = "flex-end"

    /// Additional values for horizontal alignment only (justify-content)

    /// Aligns the content to the left edge of the container
    ///
    /// The content is aligned to the left edge regardless of text direction.
    /// Only valid for horizontal alignment (justify-content).
    /// ```css
    /// justify-content: left;
    /// ```
    case left

    /// Aligns the content to the right edge of the container
    ///
    /// The content is aligned to the right edge regardless of text direction.
    /// Only valid for horizontal alignment (justify-content).
    /// ```css
    /// justify-content: right;
    /// ```
    case right
}

/// Provides string conversion for CSS output
extension ContentPosition: CustomStringConvertible {
    /// Converts the content position value to its CSS string representation
    ///
    /// This method returns the raw string value for use in CSS properties.
    public var description: String {
        return rawValue
    }
}
