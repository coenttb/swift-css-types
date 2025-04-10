import Foundation

/// Provides validation functions for CSS color components.
///
/// This extension adds validation functions that can be used to ensure color
/// component values are within the proper ranges before creating color values.
/// These functions are designed to work with the Color type from the Types module.
public enum ColorValidation {
    
    /// Validates and clamps RGB color components.
    ///
    /// - Parameters:
    ///   - red: The red component (will be clamped to 0-255)
    ///   - green: The green component (will be clamped to 0-255)
    ///   - blue: The blue component (will be clamped to 0-255)
    /// - Returns: Tuple of validated RGB components
    public static func validateRGB(_ red: Int, _ green: Int, _ blue: Int) -> (red: Int, green: Int, blue: Int) {
        return (
            min(255, max(0, red)),
            min(255, max(0, green)),
            min(255, max(0, blue))
        )
    }
    
    /// Validates and clamps RGBA color components.
    ///
    /// - Parameters:
    ///   - red: The red component (will be clamped to 0-255)
    ///   - green: The green component (will be clamped to 0-255)
    ///   - blue: The blue component (will be clamped to 0-255)
    ///   - alpha: The alpha component (will be clamped to 0.0-1.0)
    /// - Returns: Tuple of validated RGBA components
    public static func validateRGBA(_ red: Int, _ green: Int, _ blue: Int, _ alpha: Double) -> (red: Int, green: Int, blue: Int, alpha: Double) {
        return (
            min(255, max(0, red)),
            min(255, max(0, green)),
            min(255, max(0, blue)),
            min(1.0, max(0.0, alpha))
        )
    }
    
    /// Validates and clamps HSL color components.
    ///
    /// - Parameters:
    ///   - hue: The hue component (will be normalized to 0-359)
    ///   - saturation: The saturation component (will be clamped to 0-100)
    ///   - lightness: The lightness component (will be clamped to 0-100)
    /// - Returns: Tuple of validated HSL components
    public static func validateHSL(_ hue: Hue, _ saturation: Double, _ lightness: Double) -> (hue: Hue, saturation: Double, lightness: Double) {
        return (
            hue,
            min(100, max(0, saturation)),
            min(100, max(0, lightness))
        )
    }
    
    /// Validates and clamps HSLA color components.
    ///
    /// - Parameters:
    ///   - hue: The hue component (will be normalized to 0-359)
    ///   - saturation: The saturation component (will be clamped to 0-100)
    ///   - lightness: The lightness component (will be clamped to 0-100)
    ///   - alpha: The alpha component (will be clamped to 0.0-1.0)
    /// - Returns: Tuple of validated HSLA components
    public static func validateHSLA(_ hue: Hue, _ saturation: Double, _ lightness: Double, _ alpha: Double) -> (hue: Hue, saturation: Double, lightness: Double, alpha: Double) {
        return (
            hue,
            min(100, max(0, saturation)),
            min(100, max(0, lightness)),
            min(1.0, max(0.0, alpha))
        )
    }
    
    /// Validates and clamps HWB color components.
    ///
    /// - Parameters:
    ///   - hue: The hue component (will be normalized to 0-359)
    ///   - whiteness: The whiteness component (will be clamped to 0-100)
    ///   - blackness: The blackness component (will be clamped to 0-100)
    /// - Returns: Tuple of validated HWB components
    public static func validateHWB(_ hue: Hue, _ whiteness: Double, _ blackness: Double) -> (hue: Hue, whiteness: Double, blackness: Double) {
        return (
            hue,
            min(100, max(0, whiteness)),
            min(100, max(0, blackness))
        )
    }
    
    /// Validates and clamps Oklch color components.
    ///
    /// - Parameters:
    ///   - lightness: The perceptual lightness (will be clamped to 0-1)
    ///   - chroma: The chroma (colorfulness, will be clamped to non-negative)
    ///   - hue: The hue angle (will be normalized to 0-359)
    /// - Returns: Tuple of validated Oklch components
    public static func validateOklch(_ lightness: Double, _ chroma: Double, _ hue: Double) -> (lightness: Double, chroma: Double, hue: Double) {
        return (
            min(1.0, max(0.0, lightness)),
            max(0, chroma),
            hue.truncatingRemainder(dividingBy: 360)
        )
    }
}

/// Extension for creating validated Color values
///
/// This extension provides factory methods that validate color components
/// before creating Color values, ensuring they are within proper ranges.
public extension Color {
    /// Creates a color from RGB values with validation.
    ///
    /// - Parameters:
    ///   - red: The red component (0-255)
    ///   - green: The green component (0-255)
    ///   - blue: The blue component (0-255)
    /// - Returns: A Color in RGB format with validated components
    static func validatedRGB(_ red: Int, _ green: Int, _ blue: Int) -> Color {
        let validated = ColorValidation.validateRGB(red, green, blue)
        return .rgb(validated.red, validated.green, validated.blue)
    }
    
    /// Creates a color from RGBA values with validation.
    ///
    /// - Parameters:
    ///   - red: The red component (0-255)
    ///   - green: The green component (0-255)
    ///   - blue: The blue component (0-255)
    ///   - alpha: The alpha component (0.0-1.0)
    /// - Returns: A Color in RGBA format with validated components
    static func validatedRGBA(_ red: Int, _ green: Int, _ blue: Int, _ alpha: Double) -> Color {
        let validated = ColorValidation.validateRGBA(red, green, blue, alpha)
        return .rgba(validated.red, validated.green, validated.blue, validated.alpha)
    }
    
    /// Creates a color from HSL values with validation.
    ///
    /// - Parameters:
    ///   - hue: The hue component (0-360)
    ///   - saturation: The saturation component (0-100)
    ///   - lightness: The lightness component (0-100)
    /// - Returns: A Color in HSL format with validated components
    static func validatedHSL(_ hue: Hue, _ saturation: Double, _ lightness: Double) -> Color {
        let validated = ColorValidation.validateHSL(hue, saturation, lightness)
        return .hsl(validated.hue, validated.saturation, validated.lightness)
    }
    
    /// Creates a color from HSLA values with validation.
    ///
    /// - Parameters:
    ///   - hue: The hue component (0-360)
    ///   - saturation: The saturation component (0-100)
    ///   - lightness: The lightness component (0-100)
    ///   - alpha: The alpha component (0.0-1.0)
    /// - Returns: A Color in HSLA format with validated components
    static func validatedHSLA(_ hue: Hue, _ saturation: Double, _ lightness: Double, _ alpha: Double) -> Color {
        let validated = ColorValidation.validateHSLA(hue, saturation, lightness, alpha)
        return .hsla(validated.hue, validated.saturation, validated.lightness, validated.alpha)
    }
    
    /// Creates a color from HWB values with validation.
    ///
    /// - Parameters:
    ///   - hue: The hue component (0-360)
    ///   - whiteness: The whiteness component (0-100)
    ///   - blackness: The blackness component (0-100)
    /// - Returns: A Color in HWB format with validated components
    static func validatedHWB(_ hue: Hue, _ whiteness: Double, _ blackness: Double) -> Color {
        let validated = ColorValidation.validateHWB(hue, whiteness, blackness)
        return .hwb(validated.hue, validated.whiteness, validated.blackness)
    }
    
    /// Creates a color from Oklch values with validation.
    ///
    /// - Parameters:
    ///   - lightness: The perceptual lightness (0-1)
    ///   - chroma: The chroma (colorfulness)
    ///   - hue: The hue angle (0-360)
    /// - Returns: A Color in Oklch format with validated components
    static func validatedOklch(_ lightness: Percentage, _ chroma: Percentage, _ hue: Percentage) -> Color {
        let validated = ColorValidation.validateOklch(lightness.value, chroma.value, hue.value)
        return .oklch(.init(validated.lightness), .init(validated.chroma), .init(validated.hue))
    }
}
