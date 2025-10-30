import CSSTypeTypes
import Foundation

/// Represents the CSS `inline-size` property, which defines the size of an element in the inline dimension.
///
/// This property sets the size of an element in the inline dimension, which corresponds to either
/// the width or height, depending on the writing mode. For horizontal writing modes (like common
/// English text), inline-size controls the width. For vertical writing modes, it controls the height.
///
/// Visual Reference:
/// ```
/// horizontal-tb writing mode:
/// ┌─────────────────────────┐
/// │                         │
/// │                         │
/// │       inline-size       │
/// │       (width)           │
/// │                         │
/// └─────────────────────────┘
///
/// vertical-rl writing mode:
/// ┌───────────┐
/// │           │
/// │           │
/// │  inline-  │
/// │  size     │
/// │  (height) │
/// │           │
/// │           │
/// └───────────┘
/// ```
///
/// Example:
/// ```swift
/// // Set a fixed inline size
/// .inlineSize(.px(300))
///
/// // Set a percentage inline size
/// .inlineSize(.percentage(75))
///
/// // Set inline size to auto (default)
/// .inlineSize(.auto)
///
/// // Set inline size to min-content
/// .inlineSize(.minContent)
///
/// // Set inline size to max-content
/// .inlineSize(.maxContent)
///
/// // Set inline size to fit-content
/// .inlineSize(.fitContent)
/// ```
///
/// - Note: This is a logical property that adapts to the writing mode of the document,
///         providing more flexible layouts across different writing systems.
///
/// - SeeAlso: [MDN Web Docs on inline-size](https://developer.mozilla.org/en-US/docs/Web/CSS/inline-size)
public enum InlineSize: Property, LengthPercentageConvertible {
  public static let property: String = "inline-size"

  /// Automatic sizing based on content
  case auto

  /// Fixed length or percentage value
  case lengthPercentage(LengthPercentage)

  /// Size that fits the intrinsic minimum width of the content
  case minContent

  /// Size that fits the intrinsic preferred width of the content
  case maxContent

  /// Size that uses the available space, but never less than min-content and never more than max-content
  case fitContent

  /// Size that uses the available space up to the specified value, but never less than min-content
  case fitContentLength(LengthPercentage)

  /// Global CSS values
  case global(CSSTypeTypes.Global)

  public var description: String {
    switch self {
    case .auto:
      return "auto"
    case .lengthPercentage(let length):
      return length.description
    case .minContent:
      return "min-content"
    case .maxContent:
      return "max-content"
    case .fitContent:
      return "fit-content"
    case .fitContentLength(let length):
      return "fit-content(\(length))"
    case .global(let global):
      return global.description
    }
  }
}
