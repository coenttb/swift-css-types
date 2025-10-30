import CSSTypeTypes
import Foundation

/// The CSS `text-spacing` property is a shorthand property that controls spacing behavior in East Asian text.
///
/// This property combines multiple text-spacing sub-properties that control leading trim,
/// trailing trim, and spacing between adjacent characters of different writing systems
/// in East Asian typography.
///
/// - Note: This is an experimental property primarily designed for East Asian text typography.
///
/// Example:
/// ```swift
/// .textSpacing(.normal)                      // text-spacing: normal
/// .textSpacing(.auto)                         // text-spacing: auto
/// .textSpacing(.trimStart)                    // text-spacing: trim-start
/// .textSpacing([.trimStart, .spaceFirst])     // text-spacing: trim-start space-first
/// ```
///
/// - SeeAlso: [CSS Text Level 4 specification](https://www.w3.org/TR/css-text-4/#text-spacing-property)
public enum TextSpacing: Property {
  public static let property: String = "text-spacing"

  /// Default spacing behavior.
  case normal

  /// The browser automatically applies appropriate spacing based on the content.
  case auto

  /// A customized set of spacing options.
  case custom(Set<TextSpacingOption>)

  /// Global values
  case global(CSSTypeTypes.Global)

  /// Initialize with an array of text spacing options
  public init(_ options: [TextSpacingOption]) {
    self.init(Set(options))
  }

  /// Initialize with a set of text spacing options
  public init(_ options: Set<TextSpacingOption>) {
    if options.isEmpty {
      self = .normal
    } else {
      self = .custom(options)
    }
  }

  /// Initialize with multiple text spacing options
  public init(_ options: TextSpacingOption...) {
    self.init(options)
  }
}

/// Individual options for text spacing
public enum TextSpacingOption: String, Sendable, Hashable, CaseIterable {
  /// Trims the leading spaces at the start of the line.
  case trimStart = "trim-start"

  /// Trims the trailing spaces at the end of the line.
  case trimEnd = "trim-end"

  /// Trims both leading and trailing spaces.
  case trimAll = "trim-all"

  /// Adds spacing for the first line similar to paragraph indentation.
  case spaceFirst = "space-first"

  /// Adds full-width spacing for all ideographic characters.
  case spaceAll = "space-all"
}

/// CSS Output conversion
extension TextSpacing: CustomStringConvertible {
  /// Converts the text-spacing value to its CSS string representation
  public var description: String {
    switch self {
    case .normal:
      return "normal"

    case .auto:
      return "auto"

    case .custom(let options):
      return options.map { $0.rawValue }.joined(separator: " ")

    case .global(let global):
      return global.description
    }
  }
}

// Convenience initializers for common text spacing needs
extension TextSpacing {
  /// Default Japanese-style text spacing with all spaces preserved
  public static var japanese: TextSpacing {
    .custom([.spaceAll])
  }

  /// Chinese-style text spacing which trims leading spaces
  public static var chinese: TextSpacing {
    .custom([.trimStart, .spaceAll])
  }

  /// Modern Japanese-style text spacing with only first line spacing
  public static var modernJapanese: TextSpacing {
    .custom([.trimStart, .spaceFirst])
  }
}
