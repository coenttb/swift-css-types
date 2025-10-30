import Foundation

/// Represents CSS color values.
///
/// The `Color` data type represents color values in various formats, including keywords,
/// hexadecimal notation, RGB, HSL, and other modern color formats.
///
/// Example:
/// ```swift
/// .color(.hex("#ff0000"))                          // #ff0000 (red)
/// .color(.rgb(255, 0, 0))                          // rgb(255, 0, 0)
/// .color(.rgba(255, 0, 0, 0.5))                    // rgba(255, 0, 0, 0.5)
/// .color(.hsl(0, 100, 50))                         // hsl(0, 100%, 50%)
/// .color(.lch(54.3, 106.8, 40.1))                  // lch(54.3% 106.8 40.1)
/// ```
///
/// - SeeAlso: [MDN Web Docs on color](https://developer.mozilla.org/en-US/docs/Web/CSS/color_value)
public indirect enum Color: Sendable, Hashable {
  /// A named color keyword
  case named(NamedColor)

  /// A hexadecimal color notation
  case hex(HexColor)

  /// A color using the RGB color model
  case rgb(Int, Int, Int)

  /// A color using the RGB color model with alpha
  case rgba(Int, Int, Int, Double)

  /// A color using the HSL color model (hue, saturation, lightness)
  case hsl(Hue, Double, Double)

  /// A color using the HSL color model with alpha
  case hsla(Hue, Double, Double, Double)

  /// A color using the HWB color model (hue, whiteness, blackness)
  case hwb(Hue, Double, Double)

  /// A color using the CIELAB color model
  case lab(Double, Double, Double)

  /// A color using the LCH color model (lightness, chroma, hue)
  case lch(Double, Double, Double)

  /// A color using the Oklab color model
  case oklab(Double, Double, Double)

  /// A color using the Oklch color model
  case oklch(Double, Double, Double)

  /// A color-mix function with two colors
  case mix(ColorInterpolationMethod, Color, Color, Double? = nil)

  /// A system color
  case system(SystemColor)

  /// The current color value
  case currentColor

  /// A completely transparent color
  case transparent

}

/// Provides string conversion for CSS output
extension Color: CustomStringConvertible {
  /// Converts the color to its CSS string representation
  public var description: String {
    switch self {
    case .named(let name):
      return name.description

    case .hex(let hex):
      return hex.description

    case .rgb(let r, let g, let b):
      return "rgb(\(r), \(g), \(b))"

    case .rgba(let r, let g, let b, let a):
      return "rgba(\(r), \(g), \(b), \(a.truncatingRemainder()))"

    case .hsl(let h, let s, let l):
      return "hsl(\(h), \(s.truncatingRemainder())%, \(l.truncatingRemainder())%)"

    case .hsla(let h, let s, let l, let a):
      return
        "hsla(\(h), \(s.truncatingRemainder())%, \(l.truncatingRemainder())%, \(a.truncatingRemainder()))"

    case .hwb(let h, let w, let b):
      return "hwb(\(h) \(w.truncatingRemainder())% \(b.truncatingRemainder())%)"

    case .lab(let l, let a, let b):
      return
        "lab(\(l.truncatingRemainder())% \(a.truncatingRemainder()) \(b.truncatingRemainder()))"

    case .lch(let l, let c, let h):
      return
        "lch(\(l.truncatingRemainder())% \(c.truncatingRemainder()) \(h.truncatingRemainder()))"

    case .oklab(let l, let a, let b):
      return
        "oklab(\(l.truncatingRemainder()) \(a.truncatingRemainder()) \(b.truncatingRemainder()))"

    case .oklch(let l, let c, let h):
      return
        "oklch(\(l.truncatingRemainder()) \(c.truncatingRemainder()) \(h.truncatingRemainder()))"

    case .mix(let method, let color1, let color2, let percentage):
      if let percentage = percentage {
        return "color-mix(\(method), \(color1), \(color2) \(percentage.truncatingRemainder())%)"
      } else {
        return "color-mix(\(method), \(color1), \(color2))"
      }

    case .system(let color):
      return color.description

    case .currentColor:
      return "currentColor"

    case .transparent:
      return "transparent"
    }
  }
}

extension Color {
  /// Creates a color from a hexadecimal string
  ///
  /// - Parameter hex: The hexadecimal color string
  /// - Returns: A Color in hexadecimal notation
  public static func hex(_ hex: String) -> Color {
    return .hex(HexColor(hex))
  }

  /// Creates a color from RGB values
  ///
  /// - Parameters:
  ///   - red: The red component (0-255)
  ///   - green: The green component (0-255)
  ///   - blue: The blue component (0-255)
  /// - Returns: A Color in RGB format
  public static func rgb(red: Int, green: Int, blue: Int) -> Color {
    return .rgb(red, green, blue)
  }

  /// Creates a color from RGBA values
  ///
  /// - Parameters:
  ///   - red: The red component (0-255)
  ///   - green: The green component (0-255)
  ///   - blue: The blue component (0-255)
  ///   - alpha: The alpha component (0.0-1.0)
  /// - Returns: A Color in RGBA format
  public static func rgba(red: Int, green: Int, blue: Int, alpha: Double) -> Color {
    return .rgba(red, green, blue, alpha)
  }

  /// Creates a color from HSL values
  ///
  /// - Parameters:
  ///   - hue: The hue component (0-360)
  ///   - saturation: The saturation component (0-100)
  ///   - lightness: The lightness component (0-100)
  /// - Returns: A Color in HSL format
  public static func hsl(hue: Hue, saturation: Double, lightness: Double) -> Color {
    return .hsl(hue, saturation, lightness)
  }

  /// Creates a color from HSLA values
  ///
  /// - Parameters:
  ///   - hue: The hue component (0-360)
  ///   - saturation: The saturation component (0-100)
  ///   - lightness: The lightness component (0-100)
  ///   - alpha: The alpha component (0.0-1.0)
  /// - Returns: A Color in HSLA format
  public static func hsla(hue: Hue, saturation: Double, lightness: Double, alpha: Double) -> Color {
    return .hsla(hue, saturation, lightness, alpha)
  }

  /// Creates a color from HWB values
  ///
  /// - Parameters:
  ///   - hue: The hue component (0-360)
  ///   - whiteness: The whiteness component (0-100)
  ///   - blackness: The blackness component (0-100)
  /// - Returns: A Color in HWB format
  public static func hwb(hue: Hue, whiteness: Double, blackness: Double) -> Color {
    return .hwb(hue, whiteness, blackness)
  }

  /// Creates a color from LAB values
  ///
  /// - Parameters:
  ///   - lightness: The lightness component (0-100)
  ///   - aAxis: The a-axis component
  ///   - bAxis: The b-axis component
  /// - Returns: A Color in LAB format
  public static func lab(lightness: Double, aAxis: Double, bAxis: Double) -> Color {
    return .lab(lightness, aAxis, bAxis)
  }

  /// Creates a color from LCH values
  ///
  /// - Parameters:
  ///   - lightness: The lightness component (0-100)
  ///   - chroma: The chroma component
  ///   - hue: The hue component (0-360)
  /// - Returns: A Color in LCH format
  public static func lch(lightness: Double, chroma: Double, hue: Double) -> Color {
    return .lch(lightness, chroma, hue)
  }

  /// Creates a color from Oklab values
  ///
  /// - Parameters:
  ///   - lightness: The lightness component (0-1)
  ///   - aAxis: The a-axis component
  ///   - bAxis: The b-axis component
  /// - Returns: A Color in Oklab format
  public static func oklab(lightness: Double, aAxis: Double, bAxis: Double) -> Color {
    return .oklab(lightness, aAxis, bAxis)
  }

  /// Creates a color from Oklch values
  ///
  /// - Parameters:
  ///   - lightness: The lightness component (0-1)
  ///   - chroma: The chroma component
  ///   - hue: The hue component (0-360)
  /// - Returns: A Color in Oklch format
  public static func oklch(lightness: Double, chroma: Double, hue: Double) -> Color {
    return .oklch(lightness, chroma, hue)
  }
}
