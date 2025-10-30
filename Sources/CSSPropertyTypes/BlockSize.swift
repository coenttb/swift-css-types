import CSSTypeTypes
import Foundation

/// Represents the CSS `block-size` property, which defines the size of an element in the block dimension.
///
/// This property sets the size of an element in the block dimension, which corresponds to either
/// the width or height, depending on the writing mode. For horizontal writing modes (like common
/// English text), block-size controls the height. For vertical writing modes, it controls the width.
///
/// Visual Reference:
/// ```
/// horizontal-tb writing mode:
/// ┌─────────────────────────┐
/// │                         │
/// │                         │
/// │       block-size        │
/// │       (height)          │
/// │                         │
/// └─────────────────────────┘
///
/// vertical-rl writing mode:
/// ┌───────────┐
/// │           │
/// │           │
/// │  block-   │
/// │  size     │
/// │  (width)  │
/// │           │
/// │           │
/// └───────────┘
/// ```
///
/// Example:
/// ```swift
/// // Set a fixed block size
/// .blockSize(.px(300))
///
/// // Set a percentage block size
/// .blockSize(.percentage(75))
///
/// // Set block size to auto (default)
/// .blockSize(.auto)
///
/// // Set block size to min-content
/// .blockSize(.minContent)
///
/// // Set block size to max-content
/// .blockSize(.maxContent)
///
/// // Set block size to fit-content
/// .blockSize(.fitContent)
/// ```
///
/// - Note: This is a logical property that adapts to the writing mode of the document,
///         providing more flexible layouts across different writing systems.
///
/// - SeeAlso: [MDN Web Docs on block-size](https://developer.mozilla.org/en-US/docs/Web/CSS/block-size)
public enum BlockSize: Property {
  public static let property: String = "block-size"

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
}

/// Provides string conversion for CSS output
extension BlockSize: CustomStringConvertible {
  /// Converts the block-size value to its CSS string representation
  ///
  /// This method generates CSS like:
  /// ```css
  /// block-size: auto;
  /// block-size: 300px;
  /// block-size: 75%;
  /// block-size: min-content;
  /// block-size: max-content;
  /// block-size: fit-content;
  /// block-size: fit-content(300px);
  /// ```
  public var description: String {
    switch self {
    case .auto:
      return "auto"
    case .lengthPercentage(let lengthPercentage):
      return lengthPercentage.description
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

/// Default value and convenience methods
extension BlockSize {

  /// Creates a block-size with a fit-content constrained by a pixel value
  ///
  /// - Parameter px: The maximum pixel value
  /// - Returns: A block-size with fit-content constrained by the specified pixel value
  public static func fitContentPx(_ px: Double) -> BlockSize {
    .fitContentLength(.px(px))
  }

  /// Creates a block-size with a fit-content constrained by a percentage value
  ///
  /// - Parameter percent: The maximum percentage value (0-100)
  /// - Returns: A block-size with fit-content constrained by the specified percentage value
  public static func fitContentPercent(_ percentage: Percentage) -> BlockSize {
    .fitContentLength(.percentage(percentage))
  }
}
