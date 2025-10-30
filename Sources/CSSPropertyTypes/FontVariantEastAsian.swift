import CSSTypeTypes
import Foundation

/// The CSS `font-variant-east-asian` property controls the use of alternate glyphs for
/// East Asian scripts, like Japanese and Chinese.
///
/// This property allows controlling:
/// - Usage of special glyphs for ruby (small annotative characters)
/// - Selection of specific glyph variants from different standards (JIS, Simplified, Traditional)
/// - Character width styles (proportional or full-width)
///
/// Example:
/// ```swift
/// .fontVariantEastAsian(.normal)                      // font-variant-east-asian: normal
/// .fontVariantEastAsian(.ruby)                        // font-variant-east-asian: ruby
/// .fontVariantEastAsian(.jis78)                       // font-variant-east-asian: jis78
/// .fontVariantEastAsian([.ruby, .fullWidth])          // font-variant-east-asian: ruby full-width
/// .fontVariantEastAsian([.traditional, .ruby])        // font-variant-east-asian: traditional ruby
/// ```
///
/// - SeeAlso: [MDN Web Docs on font-variant-east-asian](https://developer.mozilla.org/en-US/docs/Web/CSS/font-variant-east-asian)
public enum FontVariantEastAsian: Property {

  public static let property: String = "font-variant-east-asian"

  /// Normal (default) rendering, deactivating the use of alternate glyphs
  case normal

  /// A single East Asian font variant option
  case single(EastAsianVariantValue)

  /// A combination of East Asian font variant options
  case combined(Set<EastAsianVariantValue>)

  /// Global values
  case global(CSSTypeTypes.Global)

  /// Initialize with a set of East Asian variant values
  public init(_ values: Set<EastAsianVariantValue>) {
    if values.isEmpty {
      self = .normal
    } else if values.count == 1, let value = values.first {
      self = .single(value)
    } else {
      self = .combined(values)
    }
  }

  /// Initialize with an array of East Asian variant values
  public init(_ values: [EastAsianVariantValue]) {
    self.init(Set(values))
  }

  /// Initialize with multiple East Asian variant values
  public init(_ values: EastAsianVariantValue...) {
    self.init(values)
  }
}

/// Represents the possible values for font-variant-east-asian
public enum EastAsianVariantValue: String, Sendable, Hashable, CaseIterable {
  // Ruby
  /// Forces the use of special glyphs for ruby characters, which are usually
  /// slightly bolder to improve contrast
  case ruby

  // East Asian Variant Values
  /// Uses glyphs defined in JIS X 0208:1978 standard
  case jis78

  /// Uses glyphs defined in JIS X 0208:1983 standard
  case jis83

  /// Uses glyphs defined in JIS X 0208:1990 standard
  case jis90

  /// Uses glyphs defined in JIS X 0213:2004 standard
  case jis04

  /// Uses simplified Chinese glyphs
  case simplified

  /// Uses traditional Chinese glyphs
  case traditional

  // East Asian Width Values
  /// Activates the set of East Asian characters which are all of the same,
  /// roughly square, width metric
  case fullWidth = "full-width"

  /// Activates the set of East Asian characters which vary in width
  case proportionalWidth = "proportional-width"
}

/// CSS Output conversion
extension FontVariantEastAsian: CustomStringConvertible {
  /// Converts the font-variant-east-asian value to its CSS string representation
  public var description: String {
    switch self {
    case .normal:
      return "normal"

    case .single(let value):
      return value.rawValue

    case .combined(let values):
      return values.map { $0.rawValue }.joined(separator: " ")

    case .global(let global):
      return global.description
    }
  }
}

// Convenience properties for common East Asian font variant combinations
extension FontVariantEastAsian {
  /// Ruby with traditional Chinese glyphs
  public static var rubyTraditional: FontVariantEastAsian {
    .combined([.ruby, .traditional])
  }

  /// Ruby with simplified Chinese glyphs
  public static var rubySimplified: FontVariantEastAsian {
    .combined([.ruby, .simplified])
  }

  /// Full-width with JIS90 glyphs
  public static var fullWidthJis90: FontVariantEastAsian {
    .combined([.fullWidth, .jis90])
  }

  /// Ruby with full-width and JIS04 glyphs
  public static var rubyFullWidthJis04: FontVariantEastAsian {
    .combined([.ruby, .fullWidth, .jis04])
  }
}
