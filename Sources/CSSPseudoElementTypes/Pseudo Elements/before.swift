import Foundation

/// Represents the CSS ::before pseudo-element.
///
/// The `Before` pseudo-element creates an inline element that is the first child of the selected element.
/// It is commonly used to add cosmetic content to an element with the content property. It is inline by default.
///
/// Example:
/// ```css
/// q::before {
///     content: "«";
///     color: blue;
/// }
/// ```
///
/// The ::before pseudo-element:
/// - Is an inline box generated as the first child of its originating element
/// - Is commonly used to add cosmetic content via the content property
/// - Cannot be applied to replaced elements such as `<img>`
/// - Requires a content property to be rendered (otherwise behaves as if display: none is set)
/// - When display is set to list-item, can generate a ::marker pseudo-element
/// - Appears below ::after pseudo-element content in the stacking context when both exist
///
/// - Note: Both double-colon (::before) and single-colon (:before) syntax are supported by browsers,
///         but double-colon is preferred as it distinguishes pseudo-elements from pseudo-classes.
///
/// - Important: Using ::before to add content is discouraged for accessibility, as it is not
///              reliably accessible to screen readers.
///
/// - SeeAlso: [MDN Web Docs on ::before](https://developer.mozilla.org/en-US/docs/Web/CSS/::before)
public struct Before: CSSPseudoElement {
    @inlinable public static var name: String { "before" }

    public init() {}
}
