import CSSTypeTypes
import Foundation

/// The CSS `font-variation-settings` property provides low-level control over variable font characteristics
/// by specifying the four-letter axis names of the characteristics you want to vary along with their values.
///
/// This property is particularly important for controlling variable fonts that support different scripts
/// and typographic needs across different languages and writing systems.
///
/// - Note: This property is a low-level mechanism designed to set variable font features where no other way
///         to enable or access those features exist. You should only use it when no basic properties exist
///         to set those features (e.g., `font-weight`, `font-style`).
///
/// Example:
/// ```swift
/// .fontVariationSettings(.normal)                      // font-variation-settings: normal
/// .fontVariationSettings(["wght": 625])                // font-variation-settings: "wght" 625
/// .fontVariationSettings(["wdth": 75, "wght": 300])    // font-variation-settings: "wdth" 75, "wght" 300
/// ```
///
/// - SeeAlso: [MDN Web Docs on font-variation-settings](https://developer.mozilla.org/en-US/docs/Web/CSS/font-variation-settings)
public enum FontVariationSettings: Property {

  public static let property: String = "font-variation-settings"

  /// Text is laid out using default settings.
  case normal

  /// A collection of variable font axis names and their values.
  case axes([String: Double])

  /// Global values
  case global(CSSTypeTypes.Global)

  /// Initialize with a single axis and value
  public init(_ axis: String, _ value: Double) {
    self = .axes([axis: value])
  }

  /// Initialize with a dictionary of axes and their values
  public init(_ axes: [String: Double]) {
    if axes.isEmpty {
      self = .normal
    } else {
      self = .axes(axes)
    }
  }
}

/// CSS Output conversion
extension FontVariationSettings: CustomStringConvertible {
  /// Converts the font-variation-settings value to its CSS string representation
  public var description: String {
    switch self {
    case .normal:
      return "normal"

    case .axes(let axes):
      let axisStrings = axes.map { (axis, value) -> String in
        return "\"\(axis)\" \(value)"
      }
      return axisStrings.joined(separator: ", ")

    case .global(let global):
      return global.description
    }
  }
}

// Convenience initializers for common variable font axes
extension FontVariationSettings {
  /// Set font weight axis (wght) value
  /// - Parameter value: A value typically between 1 and 999, where 400 is normal
  public static func weight(_ value: Double) -> Self {
    .axes(["wght": value])
  }

  /// Set font width axis (wdth) value
  /// - Parameter value: A value typically between 50 and 200, where 100 is normal
  public static func width(_ value: Double) -> Self {
    .axes(["wdth": value])
  }

  /// Set font slant axis (slnt) value
  /// - Parameter value: A value typically between -90 and 0, where 0 is normal
  public static func slant(_ value: Double) -> Self {
    .axes(["slnt": value])
  }

  /// Set font italic axis (ital) value
  /// - Parameter value: Usually 0 for normal, 1 for italic
  public static func italic(_ value: Double) -> Self {
    .axes(["ital": value])
  }

  /// Set font optical sizing axis (opsz) value
  /// - Parameter value: A value that typically corresponds to the font size in points
  public static func opticalSize(_ value: Double) -> Self {
    .axes(["opsz": value])
  }

  //    /// Set a custom font variation axis
  //    /// - Parameters:
  //    ///   - tag: The four-letter tag for the axis
  //    ///   - value: The value for the axis
  //    /// - Returns: A font variation settings with the custom axis
  //    public static func custom(_ tag: String, _ value: Double) -> Self {
  //        // Ensure tag is exactly 4 characters
  //        guard tag.count == 4, tag.allSatisfy({ $0.isASCII && $0.isPrintable }) else {
  //            return .normal
  //        }
  //        return .axes([tag: value])
  //    }
}
