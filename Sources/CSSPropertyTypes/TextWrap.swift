import CSSTypeTypes
import Foundation

/// The CSS `text-wrap` shorthand property controls how text inside an element is wrapped.
/// The different values provide:
///
/// - Typographic improvements, for example more balanced line lengths across broken headings
/// - A way to turn text wrapping off completely.
///
/// This property is a shorthand for the following CSS properties:
/// - `text-wrap-mode`
/// - `text-wrap-style`
///
/// Example:
/// ```swift
/// .textWrap(.wrap)     // text-wrap: wrap
/// .textWrap(.nowrap)   // text-wrap: nowrap
/// .textWrap(.balance)  // text-wrap: balance
/// .textWrap(.pretty)   // text-wrap: pretty
/// .textWrap(.stable)   // text-wrap: stable
/// ```
///
/// - SeeAlso: [MDN Web Docs on text-wrap](https://developer.mozilla.org/en-US/docs/Web/CSS/text-wrap)
public enum TextWrap: Property {
  public static let property: String = "text-wrap"

  /// Text is wrapped across lines at appropriate characters (for example spaces, in languages like
  /// English that use space separators) to minimize overflow. This is the default value.
  /// Equivalent to `text-wrap-mode: wrap; text-wrap-style: auto;`
  case wrap

  /// Text does not wrap across lines. It will overflow its containing element rather than breaking onto a new line.
  /// Equivalent to `text-wrap-mode: nowrap`
  case nowrap

  /// Text is wrapped in a way that best balances the number of characters on each line, enhancing layout quality and legibility.
  /// Because counting characters and balancing them across multiple lines is computationally expensive, this value is only
  /// supported for blocks of text spanning a limited number of lines (six or less for Chromium and ten or less for Firefox).
  /// Equivalent to `text-wrap-mode: wrap; text-wrap-style: balance;`
  case balance

  /// Results in the same behavior as wrap, except that the user agent will use a slower algorithm that favors better
  /// layout over speed. This is intended for body copy where good typography is favored over performance
  /// (for example, when the number of orphans should be kept to a minimum).
  /// Equivalent to `text-wrap-mode: wrap; text-wrap-style: pretty;`
  case pretty

  /// Results in the same behavior as wrap, except that when the user is editing the content, the lines that come
  /// before the lines they are editing remain static rather than the whole block of text re-wrapping.
  /// Equivalent to `text-wrap-mode: wrap; text-wrap-style: stable;`
  case stable

  /// Global values
  case global(CSSTypeTypes.Global)
}

/// CSS Output conversion
extension TextWrap: CustomStringConvertible {
  /// Converts the text-wrap value to its CSS string representation
  public var description: String {
    switch self {
    case .wrap:
      return "wrap"

    case .nowrap:
      return "nowrap"

    case .balance:
      return "balance"

    case .pretty:
      return "pretty"

    case .stable:
      return "stable"

    case .global(let global):
      return global.description
    }
  }
}
