import CSSTypeTypes
import Foundation

/// The CSS place-self shorthand property allows you to align an individual item in both
/// the block and inline directions at once (i.e. the align-self and justify-self properties).
///
/// This property applies to block-level boxes, absolutely-positioned boxes, and grid items.
/// If the second value is not present, the first value is also used for it.
///
/// Example:
/// ```swift
/// .placeSelf(.auto, .center)          // place-self: auto center
/// .placeSelf(.stretch, .center)       // place-self: stretch center
/// .placeSelf(.center, .start)         // place-self: center start
/// .placeSelf(.end)                    // place-self: end end
/// ```
///
/// - SeeAlso: [MDN Web Docs on place-self](https://developer.mozilla.org/en-US/docs/Web/CSS/place-self)
public enum PlaceSelf: Property, SelfPositionConvertible {
  public static func position(
    _ value: CSSTypeTypes.OverflowPosition?,
    _ value1: CSSTypeTypes.SelfPosition
  ) -> PlaceSelf {
    .single(.position(value, value1))
  }

  public static let property: String = "place-self"
  /// Combines both align-self and justify-self values
  case combined(AlignSelf, JustifySelf)

  /// When only one value is specified, it applies to both properties
  case single(AlignSelf)

  /// Global values
  case global(CSSTypeTypes.Global)
}

/// CSS Output conversion
extension PlaceSelf: CustomStringConvertible {
  /// Converts the place-self value to its CSS string representation
  public var description: String {
    switch self {
    case .combined(let alignSelf, let justifySelf):
      return "\(alignSelf) \(justifySelf)"

    case .single(let alignSelf):
      return alignSelf.description

    case .global(let global):
      return global.description
    }
  }
}

// Convenience initializers
extension PlaceSelf {
  /// Creates a PlaceSelf with the same value for both align-self and justify-self
  public static func auto() -> Self {
    return .single(.auto)
  }

  /// Creates a PlaceSelf with the same value for both align-self and justify-self
  public static func normal() -> Self {
    return .single(.normal)
  }

  /// Creates a PlaceSelf with the same value for both align-self and justify-self
  public static func stretch() -> Self {
    return .single(.stretch)
  }

  /// Creates a PlaceSelf with the same value for both align-self and justify-self
  public static func baseline() -> Self {
    return .single(.baseline)
  }

  /// Creates a PlaceSelf with the same value for both align-self and justify-self
  public static func firstBaseline() -> Self {
    return .single(.firstBaseline)
  }

  /// Creates a PlaceSelf with the same value for both align-self and justify-self
  public static func lastBaseline() -> Self {
    return .single(.lastBaseline)
  }

  /// Creates a PlaceSelf with the same value for both align-self and justify-self
  public static func anchorCenter() -> Self {
    return .single(.anchorCenter)
  }
}
