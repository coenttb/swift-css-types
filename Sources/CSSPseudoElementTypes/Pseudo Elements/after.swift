import Foundation

/// Represents the CSS ::after pseudo-element.
///
/// The `After` pseudo-element creates an inline element that is the last child of the selected element.
/// It is commonly used to add cosmetic content to an element with the content property. It is inline by default.
///
/// Example:
/// ```css
/// .exciting-text::after {
///     content: " ← EXCITING!";
///     color: green;
///     font-weight: bold;
/// }
/// ```
///
/// The ::after pseudo-element:
/// - Is an inline box generated as the last child of its originating element
/// - Is commonly used to add cosmetic content via the content property
/// - Cannot be applied to replaced elements such as `<img>`
/// - Requires a content property to be rendered (otherwise behaves as if display: none is set)
/// - When display is set to list-item, can generate a ::marker pseudo-element
/// - Appears above ::before pseudo-element content in the stacking context when both exist
///
/// - Note: Both double-colon (::after) and single-colon (:after) syntax are supported by browsers,
///         but double-colon is preferred as it distinguishes pseudo-elements from pseudo-classes.
///
/// - Important: Using ::after to add content is discouraged for accessibility, as it is not
///              reliably accessible to screen readers.
///
/// - SeeAlso: [MDN Web Docs on ::after](https://developer.mozilla.org/en-US/docs/Web/CSS/::after)
public struct After: CSSPseudoElement {
    @inlinable public static var name: String { "after" }

    public init() {}
}
