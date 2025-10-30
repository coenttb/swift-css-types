import Foundation

/// Represents a CSS filter function for applying graphical effects to elements.
///
/// Filter functions are used in the `filter` and `backdrop-filter` properties to
/// apply visual effects such as blurring, color shifting, and shadow effects to elements.
///
/// Example:
/// ```swift
/// .filter([.blur(10), .grayscale(0.5)])          // Multiple filters
/// .backdropFilter([.brightness(1.2), .contrast(0.8)])  // Background effects
/// ```
///
/// - SeeAlso: [MDN Web Docs on filter-function](https://developer.mozilla.org/en-US/docs/Web/CSS/filter-function)
public enum FilterFunction: Sendable, Hashable {
  /// Blurs the element
  ///
  /// The blur radius defines how many pixels on the screen blend into each other.
  /// A value of 0 leaves the element unchanged.
  /// ```css
  /// filter: blur(5px);
  /// ```
  case blur(Length)

  /// Makes the element brighter or darker
  ///
  /// A value of 0 makes the element completely black, 1 leaves it unchanged,
  /// and values above 1 make it brighter.
  /// ```css
  /// filter: brightness(1.5);
  /// ```
  case brightness(Double)

  /// Adjusts the contrast of the element
  ///
  /// A value of 0 makes the element completely gray, 1 leaves it unchanged,
  /// and values above 1.0 increase the contrast.
  /// ```css
  /// filter: contrast(200%);
  /// ```
  case contrast(Double)

  /// Applies a drop shadow effect to the element
  ///
  /// Creates a shadow that follows the alpha shape of the element.
  /// ```css
  /// filter: drop-shadow(16px 16px 10px black);
  /// ```
  case dropShadow(offsetX: Length, offsetY: Length, blurRadius: Length?, color: Color?)

  /// Converts the element to grayscale
  ///
  /// A value of 0 leaves the element unchanged, while 1 makes it completely grayscale.
  /// ```css
  /// filter: grayscale(0.5);
  /// ```
  case grayscale(Double)

  /// Rotates the hue of the element
  ///
  /// Applies a rotation to the colors of the element. A value of 0deg leaves the element unchanged.
  /// ```css
  /// filter: hue-rotate(90deg);
  /// ```
  case hueRotate(Angle)

  /// Inverts the colors of the element
  ///
  /// A value of 0 leaves the element unchanged, while 1 completely inverts the colors.
  /// ```css
  /// filter: invert(0.75);
  /// ```
  case invert(Double)

  /// Adjusts the opacity of the element
  ///
  /// A value of 0 makes the element completely transparent, while 1 leaves it unchanged.
  /// ```css
  /// filter: opacity(0.5);
  /// ```
  case opacity(Double)

  /// Adjusts color saturation of the element
  ///
  /// A value of 0 makes the element completely unsaturated (grayscale),
  /// 1 leaves it unchanged, and values above 1 increase saturation.
  /// ```css
  /// filter: saturate(2);
  /// ```
  case saturate(Double)

  /// Converts the element to sepia
  ///
  /// A value of 0 leaves the element unchanged, while 1 makes it completely sepia-toned.
  /// ```css
  /// filter: sepia(0.6);
  /// ```
  case sepia(Double)
}

/// Provides string conversion for CSS output
extension FilterFunction: CustomStringConvertible {
  /// Converts the filter function to its CSS string representation
  public var description: String {
    switch self {
    case .blur(let radius):
      return "blur(\(radius))"

    case .brightness(let amount):
      let value = formatNumberOrPercentage(amount)
      return "brightness(\(value))"

    case .contrast(let amount):
      let value = formatNumberOrPercentage(amount)
      return "contrast(\(value))"

    case .dropShadow(let offsetX, let offsetY, let blurRadius, let color):
      var shadow = "\(offsetX) \(offsetY)"

      if let blurRadius = blurRadius {
        shadow += " \(blurRadius)"
      }

      if let color = color {
        shadow += " \(color)"
      }

      return "drop-shadow(\(shadow))"

    case .grayscale(let amount):
      let value = formatNumberOrPercentage(amount)
      return "grayscale(\(value))"

    case .hueRotate(let angle):
      return "hue-rotate(\(angle))"

    case .invert(let amount):
      let value = formatNumberOrPercentage(amount)
      return "invert(\(value))"

    case .opacity(let amount):
      let value = formatNumberOrPercentage(amount)
      return "opacity(\(value))"

    case .saturate(let amount):
      let value = formatNumberOrPercentage(amount)
      return "saturate(\(value))"

    case .sepia(let amount):
      let value = formatNumberOrPercentage(amount)
      return "sepia(\(value))"
    }
  }

  /// Helper function to format number values, using percentage notation for values between 0 and 1
  private func formatNumberOrPercentage(_ value: Double) -> String {
    if value >= 0 && value <= 1 {
      // Format as percentage for values between 0 and 1
      let percentage = Percentage(value * 100)
      return percentage.description
    } else {
      // Format as decimal for other values
      return value.truncatingRemainder()
    }
  }
}
