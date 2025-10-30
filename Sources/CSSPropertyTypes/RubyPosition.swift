//
//  RubyPosition.swift
//  swift-css
//
//  Created by Coen ten Thije Boonkkamp on 26/03/2025.
//

import CSSTypeTypes
import Foundation

/// The CSS `ruby-position` property defines the position of a ruby element relative to its base element.
///
/// Ruby annotations are small text used to indicate pronunciation or meaning of the corresponding characters.
/// This property controls whether ruby text appears over, under, or between the base text,
/// and how multiple levels of annotations are handled.
///
/// Example:
/// ```swift
/// .rubyPosition(.over)              // ruby-position: over
/// .rubyPosition(.under)             // ruby-position: under
/// .rubyPosition(.alternate)         // ruby-position: alternate
/// .rubyPosition(.interCharacter)    // ruby-position: inter-character
/// ```
///
/// - SeeAlso: [MDN Web Docs on ruby-position](https://developer.mozilla.org/en-US/docs/Web/CSS/ruby-position)
public enum RubyPosition: Property, GlobalConvertible {
  public static let property: String = "ruby-position"

  /// Ruby text is positioned over the base text in horizontal scripts
  case over

  /// Ruby text is positioned under the base text in horizontal scripts
  case under

  /// Ruby text alternates between over and under when there are multiple levels
  case alternate

  /// Ruby text is positioned with alternate over configuration
  case alternateOver

  /// Ruby text is positioned with alternate under configuration
  case alternateUnder

  /// Ruby text is positioned between characters
  case interCharacter

  /// Global value
  case global(CSSTypeTypes.Global)

  public var description: String {
    switch self {
    case .over:
      return "over"
    case .under:
      return "under"
    case .alternate:
      return "alternate"
    case .alternateOver:
      return "alternate over"
    case .alternateUnder:
      return "alternate under"
    case .interCharacter:
      return "inter-character"
    case .global(let global):
      return global.description
    }
  }
}
