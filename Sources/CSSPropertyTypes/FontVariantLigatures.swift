import CSSTypeTypes
import Foundation

/// The CSS `font-variant-ligatures` property controls which ligatures and contextual forms
/// are used in the textual content of the elements it applies to.
///
/// This is important for proper text rendering across various languages and writing systems,
/// as different scripts use different types of ligatures and contextual forms for improved
/// typography and readability.
///
/// Example:
/// ```swift
/// .fontVariantLigatures(.normal)                      // font-variant-ligatures: normal
/// .fontVariantLigatures(.none)                        // font-variant-ligatures: none
/// .fontVariantLigatures([.commonLigatures])           // font-variant-ligatures: common-ligatures
/// .fontVariantLigatures([.noCommonLigatures])         // font-variant-ligatures: no-common-ligatures
/// .fontVariantLigatures([.contextual,                 // font-variant-ligatures: contextual
///                         .historicalLigatures])       //                       historical-ligatures
/// ```
///
/// - SeeAlso: [MDN Web Docs on font-variant-ligatures](https://developer.mozilla.org/en-US/docs/Web/CSS/font-variant-ligatures)
public enum FontVariantLigatures: Property {

  public static let property: String = "font-variant-ligatures"

  /// Activates the usual ligatures and contextual forms needed for correct rendering.
  /// The ligatures and forms activated depend on the font, language, and script.
  case normal

  /// Specifies that all ligatures and contextual forms are disabled, even common ones.
  case none

  /// A set of specific ligature and contextual form options to apply.
  case options(Set<LigatureOption>)

  /// Global values
  case global(CSSTypeTypes.Global)

  /// Initialize with a set of ligature options
  public init(_ options: Set<LigatureOption>) {
    if options.isEmpty {
      self = .normal
    } else {
      self = .options(options)
    }
  }

  /// Initialize with an array of ligature options
  public init(_ options: [LigatureOption]) {
    self.init(Set(options))
  }

  /// Initialize with multiple ligature options
  public init(_ options: LigatureOption...) {
    self.init(options)
  }
}

/// Represents the possible ligature options
public enum LigatureOption: String, Sendable, Hashable, CaseIterable {
  // Common ligatures
  /// Activates common ligatures (like 'fi', 'ffi', 'th')
  case commonLigatures = "common-ligatures"

  /// Deactivates common ligatures
  case noCommonLigatures = "no-common-ligatures"

  // Discretionary ligatures
  /// Activates discretionary ligatures (stylistic ligatures specific to the font)
  case discretionaryLigatures = "discretionary-ligatures"

  /// Deactivates discretionary ligatures
  case noDiscretionaryLigatures = "no-discretionary-ligatures"

  // Historical ligatures
  /// Activates historical ligatures (used in old books, like the German 'tz' displayed as 'ꜩ')
  case historicalLigatures = "historical-ligatures"

  /// Deactivates historical ligatures
  case noHistoricalLigatures = "no-historical-ligatures"

  // Contextual alternates
  /// Activates contextual alternates (letters that adapt to surrounding letters)
  case contextual = "contextual"

  /// Deactivates contextual alternates
  case noContextual = "no-contextual"
}

/// CSS Output conversion
extension FontVariantLigatures: CustomStringConvertible {
  /// Converts the font-variant-ligatures value to its CSS string representation
  public var description: String {
    switch self {
    case .normal:
      return "normal"

    case .none:
      return "none"

    case .options(let options):
      return options.map { $0.rawValue }.joined(separator: " ")

    case .global(let global):
      return global.description
    }
  }
}

// Convenience properties for common ligature combinations
extension FontVariantLigatures {
  /// Enable all types of ligatures for rich typography
  public static var all: FontVariantLigatures {
    .options([.commonLigatures, .discretionaryLigatures, .historicalLigatures, .contextual])
  }

  /// Disable all types of ligatures
  public static var disableAll: FontVariantLigatures {
    .options([.noCommonLigatures, .noDiscretionaryLigatures, .noHistoricalLigatures, .noContextual])
  }

  /// Standard ligatures with contextual forms (good for most Latin text)
  public static var standard: FontVariantLigatures {
    .options([.commonLigatures, .contextual])
  }

  /// Historical text setting with all historical features
  public static var historical: FontVariantLigatures {
    .options([.commonLigatures, .discretionaryLigatures, .historicalLigatures, .contextual])
  }
}
