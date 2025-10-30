import CSSTypeTypes
import Foundation

/// The CSS `ime-mode` property controls the state of the Input Method Editor (IME)
/// for text inputs, which is important for entering text in many East Asian languages.
///
/// IMEs convert keyboard input into Chinese, Japanese, Korean, or other characters.
/// This property can control whether the IME is enabled, disabled, or in a particular state.
///
/// - Note: This property is deprecated and may not be supported in all browsers.
///         Consider using other input-related attributes on form elements instead.
///
/// Example:
/// ```swift
/// .imeMode(.auto)      // ime-mode: auto
/// .imeMode(.normal)    // ime-mode: normal
/// .imeMode(.active)    // ime-mode: active
/// .imeMode(.inactive)  // ime-mode: inactive
/// .imeMode(.disabled)  // ime-mode: disabled
/// ```
///
/// - SeeAlso: [MDN Web Docs on ime-mode](https://developer.mozilla.org/en-US/docs/Web/CSS/ime-mode)
public enum ImeMode: Property {

  public static let property: String = "ime-mode"

  /// No IME state is specified. The IME state should be allowed to vary as normal.
  case auto

  /// The IME state should be normal; this value explicitly enables the IME.
  case normal

  /// The IME is initially active for this text field.
  /// Depending on OS/browser, a language input indicator is shown.
  case active

  /// The IME is initially inactive for this text field.
  /// Depending on OS/browser, no language input indicator is shown.
  case inactive

  /// The IME is disabled (turned off) for this text field.
  /// Users can't use IME to enter text for this field.
  case disabled

  /// Global value
  case global(CSSTypeTypes.Global)

  public var description: String {
    switch self {
    case .auto:
      return "auto"
    case .normal:
      return "normal"
    case .active:
      return "active"
    case .inactive:
      return "inactive"
    case .disabled:
      return "disabled"
    case .global(let global):
      return global.description
    }
  }
}
