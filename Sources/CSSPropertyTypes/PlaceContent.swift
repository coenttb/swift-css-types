import CSSTypeTypes
import Foundation

/// The CSS place-content shorthand property allows you to align content along both the block
/// and inline directions at once (i.e. the align-content and justify-content properties).
///
/// This property applies to layout systems such as Grid or Flexbox. For multi-line flex containers,
/// it controls how lines are positioned within the container. In grid layout, it controls the alignment
/// of the grid within the grid container when the grid is smaller than its container.
///
/// Example:
/// ```swift
/// .placeContent(.center)                      // place-content: center
/// .placeContent(.spaceBetween(), .center)     // place-content: space-between center
/// .placeContent(.end(), .left)                // place-content: end left
/// .placeContent(.flexStart(), .spaceAround)) // place-content: flex-start space-around
/// ```
///
/// - SeeAlso: [MDN Web Docs on place-content](https://developer.mozilla.org/en-US/docs/Web/CSS/place-content)
public enum PlaceContent: Property, BaselinePositionConvertible {
  public static let property: String = "place-content"

  /// Combines both align-content and justify-content values
  case combined(AlignContent, JustifyContent)

  /// When only one value is specified, it applies to both properties
  case single(AlignContent)

  /// Global values
  case global(CSSTypeTypes.Global)
}

/// CSS Output conversion
extension PlaceContent: CustomStringConvertible {
  /// Converts the place-content value to its CSS string representation
  public var description: String {
    switch self {
    case .combined(let alignContent, let justifyContent):
      return "\(alignContent) \(justifyContent)"

    case .single(let alignContent):
      return alignContent.description

    case .global(let global):
      return global.description
    }
  }
}

extension PlaceContent {
  public static func baseline(_ value: CSSTypeTypes.BaselinePosition) -> PlaceContent {
    .single(.baseline(value))
  }
}

// Convenience initializers
extension PlaceContent {
  /// Creates a PlaceContent with the same value for both align-content and justify-content
  public static var normal: Self {
    return .single(.normal)
  }

  /// Creates a PlaceContent with the same value for both align-content and justify-content
  public static var stretch: Self {
    return .single(.stretch)
  }

  /// Creates a PlaceContent with the same value for both align-content and justify-content
  public static var spaceBetween: Self {
    return .single(.spaceBetween)
  }

  /// Creates a PlaceContent with the same value for both align-content and justify-content
  public static var spaceAround: Self {
    return .single(.spaceAround)
  }

  /// Creates a PlaceContent with the same value for both align-content and justify-content
  public static var spaceEvenly: Self {
    return .single(.spaceEvenly)
  }

  /// Creates a PlaceContent with the same value for both align-content and justify-content
  public static var center: Self {
    return .single(.center)
  }

  /// Creates a PlaceContent with the same value for both align-content and justify-content
  public static var start: Self {
    return .single(.start)
  }

  /// Creates a PlaceContent with the same value for both align-content and justify-content
  public static var end: Self {
    return .single(.end)
  }

  /// Creates a PlaceContent with the same value for both align-content and justify-content
  public static var flexStart: Self {
    return .single(.flexStart)
  }

  /// Creates a PlaceContent with the same value for both align-content and justify-content
  public static var flexEnd: Self {
    return .single(.flexEnd)
  }

  /// Creates a PlaceContent with the same value for both align-content and justify-content
  public static func safe(_ position: ContentPosition) -> Self {
    return .single(.safe(position))
  }

  /// Creates a PlaceContent with the same value for both align-content and justify-content
  public static func unsafe(_ position: ContentPosition) -> Self {
    return .single(.unsafe(position))
  }

}
