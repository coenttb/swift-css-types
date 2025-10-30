import CSSTypeTypes
import Foundation

/// Represents the CSS `mask-repeat` property, which sets how mask images are repeated.
///
/// This property controls whether and how mask images repeat along the horizontal and vertical axes.
/// Images can be set to repeat fully, not repeat at all, or use special repeat modes like space or round.
///
/// Visual Reference:
/// ```
/// ┌───────────────────────────┐  ┌───────────────────────────┐
/// │ ■   ■   ■   ■   ■   ■   ■ │  │ ■                         │
/// │                           │  │                           │
/// │                           │  │                           │
/// │      repeat-x             │  │      no-repeat            │
/// │                           │  │                           │
/// └───────────────────────────┘  └───────────────────────────┘
///
/// ┌───────────────────────────┐  ┌───────────────────────────┐
/// │ ■   ■   ■   ■   ■   ■   ■ │  │ ■       ■       ■       ■ │
/// │ ■   ■   ■   ■   ■   ■   ■ │  │                           │
/// │ ■   ■   ■   ■   ■   ■   ■ │  │                           │
/// │      repeat               │  │      space                │
/// │ ■   ■   ■   ■   ■   ■   ■ │  │                           │
/// └───────────────────────────┘  └───────────────────────────┘
/// ```
///
/// Example:
/// ```swift
/// // Repeat in both directions (default)
/// .maskRepeat(.repeat)
///
/// // Don't repeat the mask image
/// .maskRepeat(.noRepeat)
///
/// // Repeat only horizontally
/// .maskRepeat(.repeatX)
///
/// // Repeat only vertically
/// .maskRepeat(.repeatY)
///
/// // Space images evenly without clipping
/// .maskRepeat(.space)
///
/// // Stretch and repeat to fill the area
/// .maskRepeat(.round)
///
/// // Different repeat behaviors for X and Y
/// .maskRepeat(.repeatX, .space)
///
/// // Multiple repeat values for multiple masks
/// .maskRepeat([.repeat, .noRepeat])
/// ```
///
/// - Note: The default is to repeat in both directions. When two values are specified,
///         the first applies to the horizontal direction and the second to the vertical.
///
/// - SeeAlso: [MDN Web Docs on mask-repeat](https://developer.mozilla.org/en-US/docs/Web/CSS/mask-repeat)
public enum MaskRepeat: Property {
  public static let property: String = "mask-repeat"

  /// A single repetition style (shorthand for both directions)
  case single(RepeatStyle)

  /// Different repetition styles for horizontal and vertical directions
  case twoValue(RepeatStyle, RepeatStyle)

  /// Multiple repetition values for multiple masks
  case multiple([MaskRepeat])

  /// Global CSS values
  case global(CSSTypeTypes.Global)

  /// Repetition style values
  public enum RepeatStyle: String, Sendable, Hashable {
    /// Repeat the image in both directions (default)
    case `repeat` = "repeat"

    /// Don't repeat the image
    case noRepeat = "no-repeat"

    /// Repeat only horizontally (shorthand for repeat no-repeat)
    case repeatX = "repeat-x"

    /// Repeat only vertically (shorthand for no-repeat repeat)
    case repeatY = "repeat-y"

    /// Space images evenly without clipping
    case space = "space"

    /// Stretch and repeat to fill the area
    case round = "round"
  }

  /// Creates a mask repeat with a single style for both directions
  ///
  /// - Parameter style: The repeat style
  public init(_ style: RepeatStyle) {
    self = .single(style)
  }

  /// Creates a mask repeat with different styles for horizontal and vertical
  ///
  /// - Parameters:
  ///   - horizontal: The horizontal repeat style
  ///   - vertical: The vertical repeat style
  public init(_ horizontal: RepeatStyle, _ vertical: RepeatStyle) {
    self = .twoValue(horizontal, vertical)
  }

  /// Creates a mask repeat with multiple values for multiple masks
  ///
  /// - Parameter repeats: The repeat values for each mask
  public init(_ repeats: [MaskRepeat]) {
    if repeats.count == 1 {
      self = repeats[0]
    } else {
      self = .multiple(repeats)
    }
  }
}

/// Provides string conversion for CSS output
extension MaskRepeat: CustomStringConvertible {
  /// Converts the mask-repeat value to its CSS string representation
  ///
  /// This method generates CSS like:
  /// ```css
  /// mask-repeat: repeat;
  /// mask-repeat: no-repeat;
  /// mask-repeat: repeat-x;
  /// mask-repeat: repeat-y;
  /// mask-repeat: space;
  /// mask-repeat: round;
  /// mask-repeat: repeat space;
  /// mask-repeat: repeat, no-repeat;
  /// ```
  public var description: String {
    switch self {
    case .single(let style):
      return style.rawValue

    case .twoValue(let horizontal, let vertical):
      // Special cases for the shorthand values
      if horizontal == .repeat && vertical == .noRepeat {
        return RepeatStyle.repeatX.rawValue
      } else if horizontal == .noRepeat && vertical == .repeat {
        return RepeatStyle.repeatY.rawValue
      } else {
        return "\(horizontal.rawValue) \(vertical.rawValue)"
      }

    case .multiple(let repeats):
      return repeats.map { $0.description }.joined(separator: ", ")

    case .global(let global):
      return global.description
    }
  }
}

/// Default value and convenience methods
extension MaskRepeat {
  /// The default value for mask-repeat (`repeat`)
  public static let `default` = MaskRepeat(.repeat)

  /// Repeat in both directions
  public static let `repeat` = MaskRepeat(.repeat)

  /// Don't repeat the image
  public static let noRepeat = MaskRepeat(.noRepeat)

  /// Repeat only horizontally
  public static let repeatX = MaskRepeat(.repeatX)

  /// Repeat only vertically
  public static let repeatY = MaskRepeat(.repeatY)

  /// Space images evenly without clipping
  public static let space = MaskRepeat(.space)

  /// Stretch and repeat to fill the area
  public static let round = MaskRepeat(.round)

  /// Creates a mask repeat with multiple values
  ///
  /// - Parameter repeats: The repeat values for each mask
  /// - Returns: A mask repeat with multiple values
  public static func values(_ repeats: [MaskRepeat]) -> MaskRepeat {
    MaskRepeat(repeats)
  }

  /// Creates a mask repeat with multiple values
  ///
  /// - Parameter repeats: The repeat values for each mask
  /// - Returns: A mask repeat with multiple values
  public static func values(_ repeats: MaskRepeat...) -> MaskRepeat {
    values(repeats)
  }
}
