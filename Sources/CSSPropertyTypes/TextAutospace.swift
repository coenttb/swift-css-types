import CSSTypeTypes
import Foundation

/// The CSS `text-autospace` property controls inter-script spacing in documents containing different
/// writing systems, such as Latin and CJK.
///
/// This property allows for better control of spacing at script boundaries - for example, between Latin
/// and Chinese text - which improves readability in multilingual documents.
///
/// - Note: This is a non-standard property primarily supported in Microsoft browsers,
///         but can be valuable for international web content.
///
/// Example:
/// ```swift
/// .textAutospace(.none)                       // text-autospace: none
/// .textAutospace(.ideographAlpha)             // text-autospace: ideograph-alpha
/// .textAutospace([.ideographNumeric, .ideographParenthesis])  // text-autospace: ideograph-numeric ideograph-parenthesis
/// ```
///
/// - SeeAlso: [CSS Text Level 3 Working Draft](https://www.w3.org/TR/css-text-3/)
public enum TextAutospace: Property {
  public static let property: String = "text-autospace"

  /// No extra space is inserted at script boundaries.
  case none

  /// A set of text autospace options to apply.
  case options(Set<TextAutospaceOption>)

  /// Global values
  case global(CSSTypeTypes.Global)

  /// Initialize with an array of text autospace options
  public init(_ options: [TextAutospaceOption]) {
    self.init(Set(options))
  }

  /// Initialize with a set of text autospace options
  public init(_ options: Set<TextAutospaceOption>) {
    if options.isEmpty {
      self = .none
    } else {
      self = .options(options)
    }
  }

  /// Initialize with multiple text autospace options
  public init(_ options: TextAutospaceOption...) {
    self.init(options)
  }
}

/// Individual options for text autospace
public enum TextAutospaceOption: String, Sendable, Hashable, CaseIterable {
  /// Insert extra spacing between ideographic (CJK) and non-ideographic text
  case ideographAlpha = "ideograph-alpha"

  /// Insert extra spacing between ideographic text and numeric characters
  case ideographNumeric = "ideograph-numeric"

  /// Insert extra spacing between ideographic text and parentheses or brackets
  case ideographParenthesis = "ideograph-parenthesis"

  /// Insert extra spacing between punctuation and non-ideographic text
  case punctuation = "punctuation"

  /// Insert extra spacing between all writing systems
  case all = "all"
}

/// CSS Output conversion
extension TextAutospace: CustomStringConvertible {
  /// Converts the text-autospace value to its CSS string representation
  public var description: String {
    switch self {
    case .none:
      return "none"

    case .options(let options):
      return options.map { $0.rawValue }.joined(separator: " ")

    case .global(let global):
      return global.description
    }
  }
}

// Convenience initializers for common autospace needs
extension TextAutospace {
  /// Insert spacing between ideographic (CJK) and Latin text
  public static func ideographicLatinSpacing() -> Self {
    .options([.ideographAlpha])
  }

  /// Insert spacing for all ideographic boundaries (with Latin, numbers, and parentheses)
  public static func fullIdeographicSpacing() -> Self {
    .options([.ideographAlpha, .ideographNumeric, .ideographParenthesis])
  }

  /// Maximum spacing between all script boundaries
  public static func maxSpacing() -> Self {
    .options([.all])
  }
}
