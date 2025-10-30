import CSSTypeTypes
import Foundation

/// Represents a CSS @font-face at-rule.
///
/// The @font-face CSS at-rule specifies a custom font with which to display text;
/// the font can be loaded from either a remote server or a locally-installed font
/// on the user's own computer.
///
/// Examples:
/// ```swift
/// // Basic font face
/// FontFace()
///     .fontFamily("Trickster")
///     .src([.url("trickster-outline.woff", format: "woff")])
///
/// // Font face with multiple sources and local fallback
/// FontFace()
///     .fontFamily("MyHelvetica")
///     .src([
///         .local("Helvetica Neue Bold"),
///         .local("HelveticaNeue-Bold"),
///         .url("MgOpenModernaBold.ttf")
///     ])
///     .fontWeight(.bold)
///
/// // Font face with variable font settings
/// FontFace()
///     .fontFamily("Inter")
///     .src([.url("Inter-VariableFont.ttf")])
///     .fontWeight(.range(100, 900))
///     .fontVariationSettings([
///         ("wght", 400),
///         ("slnt", 0)
///     ])
/// ```
public struct FontFace: AtRule {
  public static let identifier: String = "font-face"

  public var rawValue: String
  private var descriptors: [String: String] = [:]

  public init(rawValue: String) {
    self.rawValue = rawValue
  }

  /// Creates a new font face rule.
  public init() {
    self.rawValue = "@font-face {}"
  }

  /// Updates the raw value based on the current descriptors.
  private mutating func updateRawValue() {
    let descriptorString = descriptors.map { key, value in
      "  \(key): \(value);"
    }.joined(separator: "\n")

    if descriptorString.isEmpty {
      rawValue = "@font-face {}"
    } else {
      rawValue = "@font-face {\n\(descriptorString)\n}"
    }
  }

  /// Sets the font-family descriptor.
  ///
  /// - Parameter name: The name to be used as the font face value.
  /// - Returns: An updated FontFace instance.
  public func fontFamily(_ name: String) -> FontFace {
    var fontFace = self
    fontFace.descriptors["font-family"] = "\"\(name)\""
    fontFace.updateRawValue()
    return fontFace
  }

  /// Sets the src descriptor.
  ///
  /// - Parameter sources: An array of font sources.
  /// - Returns: An updated FontFace instance.
  public func src(_ sources: [Source]) -> FontFace {
    var fontFace = self
    fontFace.descriptors["src"] = sources.map { $0.description }.joined(separator: ",\n    ")
    fontFace.updateRawValue()
    return fontFace
  }

  /// Sets the font-display descriptor.
  ///
  /// - Parameter display: The font display strategy.
  /// - Returns: An updated FontFace instance.
  public func fontDisplay(_ display: FontDisplay) -> FontFace {
    var fontFace = self
    fontFace.descriptors["font-display"] = display.rawValue
    fontFace.updateRawValue()
    return fontFace
  }

  /// Sets the font-weight descriptor.
  ///
  /// - Parameter weight: The font weight.
  /// - Returns: An updated FontFace instance.
  public func fontWeight(_ weight: FontWeight) -> FontFace {
    var fontFace = self
    fontFace.descriptors["font-weight"] = weight.description
    fontFace.updateRawValue()
    return fontFace
  }

  /// Sets the font-style descriptor.
  ///
  /// - Parameter style: The font style.
  /// - Returns: An updated FontFace instance.
  public func fontStyle(_ style: FontStyle) -> FontFace {
    var fontFace = self
    fontFace.descriptors["font-style"] = style.description
    fontFace.updateRawValue()
    return fontFace
  }

  /// Sets the font-stretch descriptor.
  ///
  /// - Parameter stretch: The font stretch.
  /// - Returns: An updated FontFace instance.
  public func fontStretch(_ stretch: FontStretch) -> FontFace {
    var fontFace = self
    fontFace.descriptors["font-stretch"] = stretch.description
    fontFace.updateRawValue()
    return fontFace
  }

  /// Sets the unicode-range descriptor.
  ///
  /// - Parameter ranges: The Unicode range values.
  /// - Returns: An updated FontFace instance.
  public func unicodeRange(_ ranges: [String]) -> FontFace {
    var fontFace = self
    fontFace.descriptors["unicode-range"] = ranges.joined(separator: ", ")
    fontFace.updateRawValue()
    return fontFace
  }

  /// Sets the font-feature-settings descriptor.
  ///
  /// - Parameter settings: The font feature settings as tuples of (feature, value).
  /// - Returns: An updated FontFace instance.
  public func fontFeatureSettings(_ settings: [(String, Int)]) -> FontFace {
    var fontFace = self
    let settingsString = settings.map { "\"\($0.0)\" \($0.1)" }.joined(separator: ", ")
    fontFace.descriptors["font-feature-settings"] = settingsString
    fontFace.updateRawValue()
    return fontFace
  }

  /// Sets the font-variation-settings descriptor.
  ///
  /// - Parameter settings: The font variation settings as tuples of (axis, value).
  /// - Returns: An updated FontFace instance.
  public func fontVariationSettings(_ settings: [(String, Int)]) -> FontFace {
    var fontFace = self
    let settingsString = settings.map { "\"\($0.0)\" \($0.1)" }.joined(separator: ", ")
    fontFace.descriptors["font-variation-settings"] = settingsString
    fontFace.updateRawValue()
    return fontFace
  }

  /// Sets the ascent-override descriptor.
  ///
  /// - Parameter value: The ascent override percentage.
  /// - Returns: An updated FontFace instance.
  public func ascentOverride(_ value: Percentage) -> FontFace {
    var fontFace = self
    fontFace.descriptors["ascent-override"] = value.description
    fontFace.updateRawValue()
    return fontFace
  }

  /// Sets the descent-override descriptor.
  ///
  /// - Parameter value: The descent override percentage.
  /// - Returns: An updated FontFace instance.
  public func descentOverride(_ value: Percentage) -> FontFace {
    var fontFace = self
    fontFace.descriptors["descent-override"] = value.description
    fontFace.updateRawValue()
    return fontFace
  }

  /// Sets the line-gap-override descriptor.
  ///
  /// - Parameter value: The line gap override percentage.
  /// - Returns: An updated FontFace instance.
  public func lineGapOverride(_ value: Percentage) -> FontFace {
    var fontFace = self
    fontFace.descriptors["line-gap-override"] = value.description
    fontFace.updateRawValue()
    return fontFace
  }

  /// Sets the size-adjust descriptor.
  ///
  /// - Parameter value: The size adjust percentage.
  /// - Returns: An updated FontFace instance.
  public func sizeAdjust(_ value: Percentage) -> FontFace {
    var fontFace = self
    fontFace.descriptors["size-adjust"] = value.description
    fontFace.updateRawValue()
    return fontFace
  }
}

// MARK: - Font Source

extension FontFace {
  /// Represents a font source (local or URL).
  public enum Source: CustomStringConvertible {
    /// A local font source.
    case local(String)

    /// A URL font source with optional format and technology.
    case url(String, format: String? = nil, tech: String? = nil)

    public var description: String {
      switch self {
      case .local(let name):
        return "local(\"\(name)\")"
      case .url(let url, let format, let tech):
        var result = "url(\"\(url)\")"
        if let format = format {
          result += " format(\"\(format)\")"
        }
        if let tech = tech {
          result += " tech(\(tech))"
        }
        return result
      }
    }
  }

  /// Represents font-display descriptor values.
  public enum FontDisplay: String, Hashable, Sendable {
    /// Font display strategy: auto.
    case auto

    /// Font display strategy: block.
    case block

    /// Font display strategy: swap.
    case swap

    /// Font display strategy: fallback.
    case fallback

    /// Font display strategy: optional.
    case optional
  }

  /// Represents font-weight descriptor values.
  public enum FontWeight: CustomStringConvertible, Hashable, Sendable {
    /// A specific font weight using a numeric value.
    case value(Int)

    /// A range of font weights for variable fonts.
    case range(Int, Int)

    /// Font weight: normal (400).
    case normal

    /// Font weight: bold (700).
    case bold

    public var description: String {
      switch self {
      case .value(let value):
        return String(value)
      case .range(let min, let max):
        return "\(min) \(max)"
      case .normal:
        return "normal"
      case .bold:
        return "bold"
      }
    }
  }

  /// Represents font-style descriptor values.
  public enum FontStyle: CustomStringConvertible, Hashable, Sendable {
    /// Font style: normal.
    case normal

    /// Font style: italic.
    case italic

    /// Font style: oblique with optional angle.
    case oblique(Int? = nil)

    /// A range of oblique angles for variable fonts.
    case obliqueRange(Int, Int)

    public var description: String {
      switch self {
      case .normal:
        return "normal"
      case .italic:
        return "italic"
      case .oblique(let angle):
        if let angle = angle {
          return "oblique \(angle)deg"
        }
        return "oblique"
      case .obliqueRange(let min, let max):
        return "oblique \(min)deg \(max)deg"
      }
    }
  }

  /// Represents font-stretch descriptor values.
  public enum FontStretch: CustomStringConvertible, Hashable, Sendable {
    /// A specific font stretch value as a percentage.
    case value(Int)

    /// A range of font stretch values for variable fonts.
    case range(Int, Int)

    /// Font stretch: normal (100%).
    case normal

    /// Font stretch: ultra-condensed (50%).
    case ultraCondensed

    /// Font stretch: extra-condensed (62.5%).
    case extraCondensed

    /// Font stretch: condensed (75%).
    case condensed

    /// Font stretch: semi-condensed (87.5%).
    case semiCondensed

    /// Font stretch: semi-expanded (112.5%).
    case semiExpanded

    /// Font stretch: expanded (125%).
    case expanded

    /// Font stretch: extra-expanded (150%).
    case extraExpanded

    /// Font stretch: ultra-expanded (200%).
    case ultraExpanded

    public var description: String {
      switch self {
      case .value(let value):
        return "\(value)%"
      case .range(let min, let max):
        return "\(min)% \(max)%"
      case .normal:
        return "normal"
      case .ultraCondensed:
        return "ultra-condensed"
      case .extraCondensed:
        return "extra-condensed"
      case .condensed:
        return "condensed"
      case .semiCondensed:
        return "semi-condensed"
      case .semiExpanded:
        return "semi-expanded"
      case .expanded:
        return "expanded"
      case .extraExpanded:
        return "extra-expanded"
      case .ultraExpanded:
        return "ultra-expanded"
      }
    }
  }
}
