import Foundation

/// Extension providing validated factory methods for creating color values.
///
/// This extension adds methods that match the original factory method names
/// but use a namespaced approach to avoid redeclaration errors.
extension Color {
  /// Namespace for validated color creation methods
  public struct Safe {
    /// Creates a color from RGB values with validation.
    ///
    /// - Parameters:
    ///   - red: The red component (0-255)
    ///   - green: The green component (0-255)
    ///   - blue: The blue component (0-255)
    /// - Returns: A Color in RGB format with validated components
    public static func rgb(_ red: Int, _ green: Int, _ blue: Int) -> Color {
      return Color.validatedRGB(red, green, blue)
    }

    /// Creates a color from RGBA values with validation.
    ///
    /// - Parameters:
    ///   - red: The red component (0-255)
    ///   - green: The green component (0-255)
    ///   - blue: The blue component (0-255)
    ///   - alpha: The alpha component (0.0-1.0)
    /// - Returns: A Color in RGBA format with validated components
    public static func rgba(_ red: Int, _ green: Int, _ blue: Int, _ alpha: Double) -> Color {
      return Color.validatedRGBA(red, green, blue, alpha)
    }

    /// Creates a color from HSL values with validation.
    ///
    /// - Parameters:
    ///   - hue: The hue component (0-360)
    ///   - saturation: The saturation component (0-100)
    ///   - lightness: The lightness component (0-100)
    /// - Returns: A Color in HSL format with validated components
    public static func hsl(_ hue: Hue, _ saturation: Double, _ lightness: Double) -> Color {
      return Color.validatedHSL(hue, saturation, lightness)
    }

    /// Creates a color from HSLA values with validation.
    ///
    /// - Parameters:
    ///   - hue: The hue component (0-360)
    ///   - saturation: The saturation component (0-100)
    ///   - lightness: The lightness component (0-100)
    ///   - alpha: The alpha component (0.0-1.0)
    /// - Returns: A Color in HSLA format with validated components
    public static func hsla(
      _ hue: Hue,
      _ saturation: Double,
      _ lightness: Double,
      _ alpha: Double
    ) -> Color {
      return Color.validatedHSLA(hue, saturation, lightness, alpha)
    }

    /// Creates a color from HWB values with validation.
    ///
    /// - Parameters:
    ///   - hue: The hue component (0-360)
    ///   - whiteness: The whiteness component (0-100)
    ///   - blackness: The blackness component (0-100)
    /// - Returns: A Color in HWB format with validated components
    public static func hwb(_ hue: Hue, _ whiteness: Double, _ blackness: Double) -> Color {
      return Color.validatedHWB(hue, whiteness, blackness)
    }

    /// Creates a color from Oklch values with validation.
    ///
    /// - Parameters:
    ///   - lightness: The perceptual lightness (0-1)
    ///   - chroma: The chroma (colorfulness)
    ///   - hue: The hue angle (0-360)
    /// - Returns: A Color in Oklch format with validated components
    public static func oklch(
      _ lightness: Percentage,
      _ chroma: Percentage,
      _ hue: Percentage
    ) -> Color {
      return Color.validatedOklch(lightness, chroma, hue)
    }
  }
}
