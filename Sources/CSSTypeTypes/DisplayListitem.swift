import Foundation

/// Represents CSS display values for list items.
///
/// The `DisplayListitem` data type is used to make elements behave like list items,
/// generating a marker (like a bullet point) as specified by the list-style properties.
/// This can be combined with different box types.
///
/// Example:
/// ```swift
/// .display(.listItem)                     // Basic list item
/// .display(.block, .flow, .listItem)      // Modern syntax list item
/// ```
///
/// - Note: List item display causes the element to generate a `::marker` pseudo-element and
///         can be used with `list-style-type` and `list-style-position` to customize the list appearance.
///
/// - SeeAlso: [MDN Web Docs on display-listitem values](https://developer.mozilla.org/en-US/docs/Web/CSS/display-listitem)
public enum DisplayListitem: String, Sendable, Hashable {
    /// Basic list item
    ///
    /// Makes the element behave like a list item with a marker.
    /// In browsers supporting the two-value syntax, this defaults to `block flow list-item`.
    /// ```css
    /// display: list-item;
    /// ```
    case listItem = "list-item"

    /// Block-level list item with flow layout
    ///
    /// A modern syntax combination that creates a block-level list item with flow layout.
    /// ```css
    /// display: block flow list-item;
    /// ```
    case blockFlowListItem = "block flow list-item"

    /// Block-level list item with flow-root layout
    ///
    /// A modern syntax combination that creates a block-level list item with a new formatting context.
    /// ```css
    /// display: block flow-root list-item;
    /// ```
    case blockFlowRootListItem = "block flow-root list-item"

    /// Inline-level list item with flow layout
    ///
    /// A modern syntax combination that creates an inline-level list item with flow layout.
    /// ```css
    /// display: inline flow list-item;
    /// ```
    case inlineFlowListItem = "inline flow list-item"

    /// Inline-level list item with flow-root layout
    ///
    /// A modern syntax combination that creates an inline-level list item with a new formatting context.
    /// ```css
    /// display: inline flow-root list-item;
    /// ```
    case inlineFlowRootListItem = "inline flow-root list-item"
}

/// Provides string conversion for CSS output
extension DisplayListitem: CustomStringConvertible {
    /// Converts the display listitem value to its CSS string representation
    ///
    /// This method returns the raw string value for use in CSS properties.
    public var description: String {
        return rawValue
    }
}

/// Provides convenience methods for creating combined display listitem values
/// using the modern multi-keyword syntax.
public struct DisplayListitemFactory {
    /// Creates a list item with specified outer and inner display types
    ///
    /// - Parameters:
    ///   - outer: The outer display type (`block` or `inline`)
    ///   - inner: The inner display type (`flow` or `flow-root`)
    /// - Returns: A DisplayListitem value with the combined display values
    public static func create(outer: DisplayOutside, inner: DisplayInside) -> DisplayListitem {
        switch (outer, inner) {
        case (.block, .flow):
            return .blockFlowListItem
        case (.block, .flowRoot):
            return .blockFlowRootListItem
        case (.inline, .flow):
            return .inlineFlowListItem
        case (.inline, .flowRoot):
            return .inlineFlowRootListItem
        default:
            // The CSS spec only allows flow or flow-root for listitem,
            // but we'll return a custom string for extensibility
            return .listItem
        }
    }
}
