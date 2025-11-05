import Foundation

/// Represents the CSS ::details-content pseudo-element.
///
/// The `DetailsContent` pseudo-element represents the expandable/collapsible contents
/// of a `<details>` element. It allows styling of the content area that is shown or
/// hidden when the details element is toggled.
///
/// Example:
/// ```css
/// details::details-content {
///     background-color: #a29bfe;
/// }
///
/// details[open]::details-content {
///     opacity: 1;
///     transition: opacity 600ms;
/// }
/// ```
///
/// The ::details-content pseudo-element:
/// - Represents the expandable/collapsible content of `<details>` elements
/// - Only applies to `<details>` elements
/// - Can be styled differently when the details is open vs closed
/// - Useful for creating smooth transitions and animations
/// - Allows styling the content area independently from the summary
/// - Supports all standard CSS properties
///
/// Common use cases:
/// - Adding background colors or borders to the content area
/// - Creating smooth fade-in/fade-out transitions
/// - Styling the expanded content differently from collapsed state
/// - Adding padding or margins to the content area
///
/// - Note: Browser support is limited to browsers that support this pseudo-element
///
/// - SeeAlso: [MDN Web Docs on ::details-content](https://developer.mozilla.org/en-US/docs/Web/CSS/::details-content)
public struct DetailsContent: CSSPseudoElement {
    @inlinable public static var name: String { "details-content" }

    public init() {}
}
