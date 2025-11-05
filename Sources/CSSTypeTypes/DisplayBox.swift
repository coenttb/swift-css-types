import Foundation

/// Represents CSS display box keywords that define whether an element generates boxes.
///
/// The `DisplayBox` data type contains values that control whether an element
/// generates display boxes at all. These are fundamental values that can be
/// used with the `display` property.
///
/// Example:
/// ```swift
/// .display(.none)       // Hide element completely
/// .display(.contents)   // Hide element but show its children
/// ```
///
/// - Note: These values affect whether the element creates a box in the layout.
///         The `none` value removes the element completely from rendering, while
///         `contents` makes the element itself invisible but keeps its children.
///
/// - SeeAlso: [MDN Web Docs on display-box values](https://developer.mozilla.org/en-US/docs/Web/CSS/display-box)
public enum DisplayBox: String, Sendable, Hashable {
    /// Hides the element as if it doesn't exist in the document
    ///
    /// The element and all its descendants are removed from the rendering and layout.
    /// Use `visibility: hidden` instead if you want to preserve the element's space.
    /// ```css
    /// display: none;
    /// ```
    case none

    /// Makes the element's box disappear, but keeps its children
    ///
    /// The element itself doesn't generate a box, but its children are rendered
    /// as if they were children of the element's parent.
    /// ```css
    /// display: contents;
    /// ```
    /// - Warning: Due to browser implementation bugs, this may have accessibility issues
    ///            by removing the element from the accessibility tree.
    case contents
}

/// Provides string conversion for CSS output
extension DisplayBox: CustomStringConvertible {
    /// Converts the display box value to its CSS string representation
    ///
    /// This method returns the raw string value for use in CSS properties.
    public var description: String {
        return rawValue
    }
}
