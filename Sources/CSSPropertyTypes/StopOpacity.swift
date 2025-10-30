//
// StopOpacity.swift

import CSSTypeTypes

/// The `stop-opacity` CSS property defines the opacity of a given color gradient stop in the SVG `<stop>` element
/// within an SVG gradient. If present, it overrides the element's stop-opacity attribute.
///
/// The property value impacts the stop-color's alpha channel; it can increase the transparency of a `<stop>`'s color
/// but cannot make the color defined by the stop-color property more opaque.
///
/// ```css
/// stop-opacity: 0.2;
/// stop-opacity: 20%;
/// ```
public enum StopOpacity: Property {
  public static let property: String = "stop-opacity"

  /// A numeric opacity value between 0 and 1
  case number(Number)

  /// A percentage opacity value between 0% and 100%
  case percentage(Percentage)

  /// Global CSS value
  case global(CSSTypeTypes.Global)

  public var description: String {
    switch self {
    case .number(let number):
      // Clamp opacity value between 0 and 1
      let clampedValue = min(1.0, max(0.0, number.value))
      return String(format: "%.5g", clampedValue)
    case .percentage(let percentage):
      return percentage.description
    case .global(let global):
      return global.description
    }
  }

  /// Creates a StopOpacity with a numeric value
  /// - Parameter value: The opacity value between 0 and 1
  /// - Returns: A StopOpacity with the specified numeric value
  public static func opacity(_ value: Double) -> Self {
    .number(.init(value))
  }

  /// Creates a StopOpacity with a percentage value
  /// - Parameter value: The opacity percentage value
  /// - Returns: A StopOpacity with the specified percentage value
  public static func percent(_ value: Double) -> Self {
    .percentage(.init(value))
  }
}
