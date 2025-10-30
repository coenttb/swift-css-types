import CSSTypeTypes
import Foundation

/// The CSS `touch-action` property sets how an element's region can be manipulated by a touchscreen user
/// (for example, by zooming features built into the browser).
///
/// By default, panning (scrolling) and pinching gestures are handled exclusively by the browser. This property
/// allows you to specify which touch gestures should be handled by the browser versus your application.
///
/// - Note: When a gesture is started, the browser intersects the touch-action values of the touched element
///         and its ancestors, up to the one that implements the gesture.
///
/// - Warning: A declaration of `touch-action: none` may inhibit operating a browser's zooming capabilities,
///            which creates accessibility issues for people with low vision conditions.
///
/// Example:
/// ```swift
/// .touchAction(.auto)                 // touch-action: auto
/// .touchAction(.none)                 // touch-action: none
/// .touchAction(.manipulation)         // touch-action: manipulation
/// .touchAction([.panX, .pinchZoom])   // touch-action: pan-x pinch-zoom
/// .touchAction([.panLeft, .panDown])  // touch-action: pan-left pan-down
/// ```
///
/// - SeeAlso: [MDN Web Docs on touch-action](https://developer.mozilla.org/en-US/docs/Web/CSS/touch-action)
public enum TouchAction: Sendable, Hashable, Property {
  public static let property: String = "touch-action"
  /// Enable browser handling of all panning and zooming gestures
  case auto

  /// Disable browser handling of all panning and zooming gestures
  case none

  /// Enable panning and pinch zoom gestures, but disable additional non-standard gestures
  /// such as double-tap to zoom. Equivalent to `[.panX, .panY, .pinchZoom]`
  case manipulation

  /// Combination of specific touch action values
  case combined(Set<TouchActionValue>)

  /// Global values
  case global(CSSTypeTypes.Global)
}

/// Individual touch action values that can be combined
public enum TouchActionValue: String, Sendable, Hashable {
  /// Enable single-finger horizontal panning gestures
  case panX = "pan-x"

  /// Enable single-finger gestures that begin by scrolling to the left
  case panLeft = "pan-left"

  /// Enable single-finger gestures that begin by scrolling to the right
  case panRight = "pan-right"

  /// Enable single-finger vertical panning gestures
  case panY = "pan-y"

  /// Enable single-finger gestures that begin by scrolling upward
  case panUp = "pan-up"

  /// Enable single-finger gestures that begin by scrolling downward
  case panDown = "pan-down"

  /// Enable multi-finger panning and zooming of the page
  case pinchZoom = "pinch-zoom"
}

/// CSS Output conversion
extension TouchAction: CustomStringConvertible {
  /// Converts the touch-action value to its CSS string representation
  public var description: String {
    switch self {
    case .auto:
      return "auto"

    case .none:
      return "none"

    case .manipulation:
      return "manipulation"

    case .combined(let values):
      if values.isEmpty {
        return "auto"
      }
      return values.map { $0.rawValue }.sorted().joined(separator: " ")

    case .global(let global):
      return global.description
    }
  }
}

// Convenience initializers
extension TouchAction {
  /// Create a touch action with a set of specific touch action values
  public static func combined(_ values: TouchActionValue...) -> Self {
    return .combined(Set(values))
  }
}
