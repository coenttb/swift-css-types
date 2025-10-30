import CSSTypeTypes
import Foundation

/// The `contain-intrinsic-inline-size` CSS property defines the inline size of an element that a browser can use for
/// layout when the element is subject to size containment.
///
/// Inline size is the size in the dimension parallel to the flow of text within a line. In horizontal writing
/// modes, this is the horizontal dimension (width); in vertical writing modes, it's the vertical dimension.
///
/// - SeeAlso: [MDN Web Docs](https://developer.mozilla.org/en-US/docs/Web/CSS/contain-intrinsic-inline-size)
public enum ContainIntrinsicInlineSize: Property, GlobalConvertible, LengthConvertible {
  public static let property: String = "contain-intrinsic-inline-size"

  /// The element has no intrinsic inline size.
  case none

  /// The element has the specified inline size.
  case length(Length)

  /// When the element is in size containment and skipping its contents, the inline size is remembered
  /// from the actual size of the element when it was last rendered. If there is no remembered value
  /// or it is not skipping contents, the inline size is the specified length.
  case auto(Length)

  /// Auto with none value
  case autoNone

  /// Global values
  case global(CSSTypeTypes.Global)

  public var description: String {
    switch self {
    case .none:
      return "none"
    case .length(let length):
      return length.description
    case .auto(let length):
      return "auto \(length.description)"
    case .autoNone:
      return "auto none"
    case .global(let value):
      return value.description
    }
  }
}
