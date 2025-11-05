import Foundation

/// Represents CSS display inside values that determine the layout of an element's contents.
///
/// The `DisplayInside` data type specifies the element's inner display type, which defines
/// the formatting context used to lay out its contents. These values can be used alone
/// or combined with an outer display type in the `display` property.
///
/// Example:
/// ```swift
/// .display(.flex)           // Flex container (block-level)
/// .display(.grid)           // Grid container (block-level)
/// .display(.flowRoot)       // Block formatting context
/// ```
///
/// - Note: When used alone, browsers that support the two-value syntax will
///         implicitly set the outer display type to `block` for values like
///         `flex` and `grid`.
///
/// - SeeAlso: [MDN Web Docs on display-inside values](https://developer.mozilla.org/en-US/docs/Web/CSS/display-inside)
public enum DisplayInside: String, Sendable, Hashable {
    /// Standard block and inline layout
    ///
    /// The element uses flow layout, also known as block-and-inline layout.
    /// This is the default layout mode for most elements.
    /// ```css
    /// display: flow;
    /// ```
    case flow

    /// Creates a block formatting context
    ///
    /// The element generates a block box that establishes a new block formatting context,
    /// containing things like floats and preventing margin collapsing.
    /// ```css
    /// display: flow-root;
    /// ```
    case flowRoot = "flow-root"

    /// Table layout
    ///
    /// The element behaves like an HTML `<table>` element, creating a block-level box
    /// with a specific layout model for rows, columns, and cells.
    /// ```css
    /// display: table;
    /// ```
    case table

    /// Flex layout
    ///
    /// The element behaves as a block-level flex container, using the flexbox layout model
    /// to arrange its children in a flexible, responsive way.
    /// ```css
    /// display: flex;
    /// ```
    case flex

    /// Grid layout
    ///
    /// The element behaves as a block-level grid container, using the grid layout model
    /// to arrange its children in rows and columns.
    /// ```css
    /// display: grid;
    /// ```
    case grid

    /// Ruby layout
    ///
    /// The element behaves like an inline element and lays out its content according to
    /// the ruby formatting model, commonly used for East Asian typography annotations.
    /// ```css
    /// display: ruby;
    /// ```
    case ruby
}

/// Provides string conversion for CSS output
extension DisplayInside: CustomStringConvertible {
    /// Converts the display inside value to its CSS string representation
    ///
    /// This method returns the raw string value for use in CSS properties.
    public var description: String {
        return rawValue
    }
}
