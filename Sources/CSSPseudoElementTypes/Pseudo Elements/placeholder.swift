import Foundation

/// Represents the CSS ::placeholder pseudo-element.
///
/// The `Placeholder` pseudo-element represents the placeholder text in an `<input>`
/// or `<textarea>` element. It allows you to style the placeholder text independently
/// of the input element.
///
/// Example:
/// ```css
/// input::placeholder {
///     color: #999;
///     opacity: 1;
///     font-style: italic;
/// }
/// ```
///
/// The ::placeholder pseudo-element:
/// - Only applies to `<input>` and `<textarea>` elements
/// - Represents the placeholder text shown when the field is empty
/// - Supports only a subset of CSS properties
/// - Is automatically shown/hidden based on the input's value
/// - Has different default opacity across browsers
///
/// Supported properties include:
/// - Color properties
/// - Font properties
/// - Background properties (limited)
/// - Text decoration properties
/// - Opacity and visibility
///
/// - SeeAlso: [MDN Web Docs on ::placeholder](https://developer.mozilla.org/en-US/docs/Web/CSS/::placeholder)
public struct Placeholder: CSSPseudoElement {
    @inlinable public static var name: String { "placeholder" }

    public init() {}
}
