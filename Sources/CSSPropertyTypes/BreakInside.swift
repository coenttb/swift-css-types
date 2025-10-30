import CSSTypeTypes
import Foundation

/// The CSS `break-inside` property sets how page, column, or region breaks should behave inside a generated box.
/// If there is no generated box, the property is ignored.
///
/// Example:
/// ```swift
/// .breakInside(.auto)         // break-inside: auto
/// .breakInside(.avoid)        // break-inside: avoid
/// .breakInside(.avoidPage)    // break-inside: avoid-page
/// .breakInside(.avoidColumn)  // break-inside: avoid-column
/// .breakInside(.avoidRegion)  // break-inside: avoid-region
/// ```
///
/// This property is useful for controlling fragmentation inside elements, such as avoiding breaks inside figures with
/// captions or other content that should stay together.
///
/// - Note: Unlike `break-before` and `break-after`, this property doesn't have values for forcing breaks,
///         as breaks can only be forced at element boundaries, not inside elements.
///
/// - SeeAlso: [MDN Web Docs on break-inside](https://developer.mozilla.org/en-US/docs/Web/CSS/break-inside)
public enum BreakInside: Property {
  public static let property: String = "break-inside"
  /// Allows, but does not force, any break (page, column, or region) to be inserted within the element.
  case auto

  /// Avoids any break (page, column, or region) from being inserted within the element.
  case avoid

  /// Avoids any page break within the element.
  case avoidPage

  /// Avoids any column break within the element.
  case avoidColumn

  /// Avoids any region break within the element.
  case avoidRegion

  /// Global values
  case global(CSSTypeTypes.Global)

  public var description: String {
    switch self {
    case .auto: return "auto"
    case .avoid: return "avoid"
    case .avoidPage: return "avoid-page"
    case .avoidColumn: return "avoid-column"
    case .avoidRegion: return "avoid-region"
    case .global(let global): return global.description
    }
  }
}
