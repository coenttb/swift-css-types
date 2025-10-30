import Foundation

/// Represents a CSS alpha value for opacity or transparency.
///
/// The `AlphaValue` data type can be expressed as either a number (between 0 and 1)
/// or a percentage, specifying the transparency level of a color or element.
///
/// Visual Reference:
/// ```
/// 0.0 or 0%   = Fully transparent
/// 0.5 or 50%  = Semi-transparent
/// 1.0 or 100% = Fully opaque
/// ```
///
/// Example:
/// ```swift
/// .color(.rgba(255, 0, 0, .number(0.5)))   // Red with 50% opacity (as number)
/// .color(.rgba(255, 0, 0, .percentage(50)))   // Red with 50% opacity (as percentage)
/// .opacity(.number(0.7))                   // 70% opacity
/// ```
///
/// - Note: Values outside the range 0-1 (or 0%-100%) are permitted in CSS, but are
///         clamped to lie within the valid range when rendered.
///
/// - SeeAlso: [MDN Web Docs on alpha values](https://developer.mozilla.org/en-US/docs/Web/CSS/alpha-value)
public enum AlphaValue: Sendable, Hashable, ExpressibleByIntegerLiteral, ExpressibleByFloatLiteral,
  PercentageConvertible
{
  /// Specifies alpha as a number between 0.0 (transparent) and 1.0 (opaque)
  /// ```css
  /// opacity: 0.5;
  /// color: rgba(255, 0, 0, 0.75);
  /// ```
  case number(Number)

  /// Specifies alpha as a percentage between 0% (transparent) and 100% (opaque)
  /// ```css
  /// opacity: 50%;
  /// color: rgba(255, 0, 0, 75%);
  /// ```
  case percentage(Percentage)

  /// Creates an alpha value as a number from an integer literal
  ///
  /// Integers are converted to their decimal equivalent as numbers.
  /// Note that 0 means fully transparent and 1 means fully opaque.
  /// Values greater than 1 will be clamped to 1 when rendered.
  ///
  /// ```swift
  /// .opacity(0)  // Fully transparent
  /// .opacity(1)  // Fully opaque
  /// ```
  public init(integerLiteral value: Int) {
    self = .number(.init(value))
  }

  /// Creates an alpha value as a number from a floating-point literal
  ///
  /// This allows you to use decimal numbers directly where alpha values are expected.
  ///
  /// ```swift
  /// .opacity(0.5)  // 50% opacity
  /// ```
  public init(floatLiteral value: Double) {
    self = .number(.init(value))
  }
}

/// Provides string conversion for CSS output
extension AlphaValue: CustomStringConvertible {
  /// Converts the alpha value to its CSS string representation
  ///
  /// This method returns the appropriate CSS string for either a number or percentage.
  public var description: String {
    switch self {
    case .number(let number):
      return number.description
    case .percentage(let percentage):
      return percentage.description
    }
  }
}
