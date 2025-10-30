import CSSTypeTypes
import Foundation

/// The `fill-opacity` CSS property defines the opacity of the fill applied to SVG shapes
/// and text content elements.
///
/// This property affects only the opacity of the element's fill, not its stroke. A value of 0
/// or 0% makes the fill completely transparent, while 1 or 100% makes it fully opaque.
/// Values in between create varying levels of semi-transparency.
///
/// - Note: This property only applies to SVG elements like `<circle>`, `<ellipse>`, `<path>`,
///         `<polygon>`, `<polyline>`, `<rect>`, `<text>`, and related text elements.
///
/// - SeeAlso: [MDN Web Docs](https://developer.mozilla.org/en-US/docs/Web/CSS/fill-opacity)
public enum FillOpacity: Property {
  public static let property: String = "fill-opacity"

  /// A value between 0.0 (fully transparent) and 1.0 (fully opaque)
  case number(Number)

  /// A value between 0% (fully transparent) and 100% (fully opaque)
  case percentage(Percentage)

  /// Global values
  case global(CSSTypeTypes.Global)

  public var description: String {
    switch self {
    case .number(let number):
      // Clamp value between 0 and 1
      let clampedValue = max(0, min(1, number.value))

      // Format with at most 2 decimal places if needed
      if clampedValue == Double(Int(clampedValue)) {
        return "\(Int(clampedValue))"
      } else {
        return String(format: "%.2f", clampedValue).replacingOccurrences(of: ".00", with: "")
      }
    case .percentage(let percentage):
      return percentage.description
    case .global(let value):
      return value.description
    }
  }
}
