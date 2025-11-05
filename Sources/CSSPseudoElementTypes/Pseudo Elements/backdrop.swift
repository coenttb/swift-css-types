import Foundation

/// Represents the CSS ::backdrop pseudo-element.
///
/// The `Backdrop` pseudo-element is a box the size of the viewport, which is rendered
/// immediately beneath any element being presented in the top layer.
///
/// Example:
/// ```css
/// dialog::backdrop {
///     background: rgba(255, 0, 0, 0.25);
///     backdrop-filter: blur(5px);
/// }
/// ```
///
/// The ::backdrop pseudo-element appears in the following instances:
/// - Elements in fullscreen mode using the Fullscreen API (`Element.requestFullscreen()`)
/// - `<dialog>` elements shown in the top layer via `HTMLDialogElement.showModal()`
/// - Popover elements shown in the top layer via `HTMLElement.showPopover()`
///
/// Key characteristics:
/// - Each element in the top layer has its own ::backdrop pseudo-element
/// - Elements are stacked in LIFO (last-in/first out) order in the top layer
/// - Neither inherits from nor is inherited by any other elements
/// - No restrictions on what properties can be applied to this pseudo-element
/// - Used to obscure, style, or hide everything below a top layer element
///
/// - SeeAlso: [MDN Web Docs on ::backdrop](https://developer.mozilla.org/en-US/docs/Web/CSS/::backdrop)
public struct Backdrop: CSSPseudoElement {
    @inlinable public static var name: String { "backdrop" }

    public init() {}
}
