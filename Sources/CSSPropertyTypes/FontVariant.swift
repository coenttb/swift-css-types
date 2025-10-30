import CSSTypeTypes
import Foundation

/// The CSS `font-variant` shorthand property allows you to set all the font variants for a font.
///
/// You can also set the normal or small-caps values of font-variant using the font shorthand.
///
/// Example:
/// ```swift
/// .fontVariant(.normal)                                         // font-variant: normal
/// .fontVariant(.none)                                           // font-variant: none
/// .fontVariant(.smallCaps)                                      // font-variant: small-caps
/// .fontVariant(.combination([.commonLigatures, .smallCaps]))    // font-variant: common-ligatures small-caps
/// .fontVariant(.global(.inherit))                               // font-variant: inherit
/// ```
///
/// - SeeAlso: [MDN Web Docs on font-variant](https://developer.mozilla.org/en-US/docs/Web/CSS/font-variant)
public enum FontVariant: Property {

  public static let property: String = "font-variant"

  /// Specifies a normal font face. Each longhand property has an initial value of normal.
  case normal

  /// Sets the value of the font-variant-ligatures as none and the values of the other longhand properties as normal.
  case none

  /// Enables display of small capitals (OpenType feature: smcp).
  case smallCaps

  /// A combination of font-variant values
  case combination([FontVariantOption])

  /// Global values
  case global(CSSTypeTypes.Global)

  public var description: String {
    switch self {
    case .normal:
      return "normal"
    case .none:
      return "none"
    case .smallCaps:
      return "small-caps"
    case .combination(let options):
      return options.map { $0.description }.joined(separator: " ")
    case .global(let value):
      return value.description
    }
  }
}

/// Options for the font-variant property
public enum FontVariantOption: Sendable, Hashable, CustomStringConvertible {
  // Ligature values
  case commonLigatures
  case noCommonLigatures
  case discretionaryLigatures
  case noDiscretionaryLigatures
  case historicalLigatures
  case noHistoricalLigatures
  case contextual
  case noContextual

  // Caps values
  case smallCaps
  case allSmallCaps
  case petiteCaps
  case allPetiteCaps
  case unicase
  case titlingCaps

  // Alternates values
  case historicalForms
  case stylistic(String)  // feature-value-name
  case styleset(String)  // feature-value-name
  case characterVariant(String)  // feature-value-name
  case swash(String)  // feature-value-name
  case ornaments(String)  // feature-value-name
  case annotation(String)  // feature-value-name

  // Numeric values
  case liningNums
  case oldstyleNums
  case proportionalNums
  case tabularNums
  case diagonalFractions
  case stackedFractions
  case ordinal
  case slashedZero

  // East Asian values
  case jis78
  case jis83
  case jis90
  case jis04
  case simplified
  case traditional
  case fullWidth
  case proportionalWidth
  case ruby

  // Position values
  case sub
  case `super`

  // Emoji values
  case text
  case emoji
  case unicode

  public var description: String {
    switch self {
    // Ligatures
    case .commonLigatures: return "common-ligatures"
    case .noCommonLigatures: return "no-common-ligatures"
    case .discretionaryLigatures: return "discretionary-ligatures"
    case .noDiscretionaryLigatures: return "no-discretionary-ligatures"
    case .historicalLigatures: return "historical-ligatures"
    case .noHistoricalLigatures: return "no-historical-ligatures"
    case .contextual: return "contextual"
    case .noContextual: return "no-contextual"

    // Caps
    case .smallCaps: return "small-caps"
    case .allSmallCaps: return "all-small-caps"
    case .petiteCaps: return "petite-caps"
    case .allPetiteCaps: return "all-petite-caps"
    case .unicase: return "unicase"
    case .titlingCaps: return "titling-caps"

    // Alternates
    case .historicalForms: return "historical-forms"
    case .stylistic(let name): return "stylistic(\(name))"
    case .styleset(let name): return "styleset(\(name))"
    case .characterVariant(let name): return "character-variant(\(name))"
    case .swash(let name): return "swash(\(name))"
    case .ornaments(let name): return "ornaments(\(name))"
    case .annotation(let name): return "annotation(\(name))"

    // Numeric
    case .liningNums: return "lining-nums"
    case .oldstyleNums: return "oldstyle-nums"
    case .proportionalNums: return "proportional-nums"
    case .tabularNums: return "tabular-nums"
    case .diagonalFractions: return "diagonal-fractions"
    case .stackedFractions: return "stacked-fractions"
    case .ordinal: return "ordinal"
    case .slashedZero: return "slashed-zero"

    // East Asian
    case .jis78: return "jis78"
    case .jis83: return "jis83"
    case .jis90: return "jis90"
    case .jis04: return "jis04"
    case .simplified: return "simplified"
    case .traditional: return "traditional"
    case .fullWidth: return "full-width"
    case .proportionalWidth: return "proportional-width"
    case .ruby: return "ruby"

    // Position
    case .sub: return "sub"
    case .super: return "super"

    // Emoji
    case .text: return "text"
    case .emoji: return "emoji"
    case .unicode: return "unicode"
    }
  }
}
