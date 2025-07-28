import Foundation

/// Represents the CSS ::checkmark pseudo-element.
///
/// The `Checkmark` pseudo-element targets the checkmark placed inside the currently-selected
/// `<option>` element of a customizable select element. It provides a visual indication of
/// which option is selected.
///
/// Example:
/// ```css
/// option::checkmark {
///     order: 1;
///     margin-left: auto;
///     content: "☑️";
/// }
/// ```
///
/// The ::checkmark pseudo-element:
/// - Targets checkmarks in customizable select elements
/// - Only available when the select has `appearance: base-select`
/// - Appears before any ::before pseudo-element content
/// - Can be customized using the `content` property
/// - Useful for hiding, replacing, or repositioning checkmarks
/// - Is not included in the accessibility tree
///
/// Requirements:
/// - The originating element must have a picker
/// - Must have `appearance: base-select` set
/// - Works with customizable select elements
///
/// - Warning: This is experimental technology with limited browser support
///
/// - Note: Generated content is not announced by assistive technologies
///
/// - SeeAlso: [MDN Web Docs on ::checkmark](https://developer.mozilla.org/en-US/docs/Web/CSS/::checkmark)
public struct Checkmark: CSSPseudoElement {
    @inlinable public static var name: String { "checkmark" }

    public init() {}
}
