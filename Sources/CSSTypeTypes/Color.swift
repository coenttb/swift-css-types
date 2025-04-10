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
public indirect enum Color: Sendable, Equatable {
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
            return "hsla(\(h), \(s.truncatingRemainder())%, \(l.truncatingRemainder())%, \(a.truncatingRemainder()))"
            
        case .hwb(let h, let w, let b):
            return "hwb(\(h) \(w.truncatingRemainder())% \(b.truncatingRemainder())%)"
            
        case .lab(let l, let a, let b):
            return "lab(\(l.truncatingRemainder())% \(a.truncatingRemainder()) \(b.truncatingRemainder()))"
            
        case .lch(let l, let c, let h):
            return "lch(\(l.truncatingRemainder())% \(c.truncatingRemainder()) \(h.truncatingRemainder()))"
            
        case .oklab(let l, let a, let b):
            return "oklab(\(l.truncatingRemainder()) \(a.truncatingRemainder()) \(b.truncatingRemainder()))"
            
        case .oklch(let l, let c, let h):
            return "oklch(\(l.truncatingRemainder()) \(c.truncatingRemainder()) \(h.truncatingRemainder()))"
            
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

/// Convenience factory methods for creating Color values
extension Color {
    /// Returns an opacity-modified version of this color
    ///
    /// - Parameter alpha: The opacity value (0.0-1.0)
    /// - Returns: A new color with the specified opacity
    public func opacity(_ alpha: Double) -> Color {
        let clampedAlpha = min(1.0, max(0.0, alpha))
        
        switch self {
        case .rgb(let r, let g, let b):
            return .rgba(r, g, b, clampedAlpha)
            
        case .rgba(let r, let g, let b, _):
            return .rgba(r, g, b, clampedAlpha)
            
        case .hsl(let h, let s, let l):
            return .hsla(h, s, l, clampedAlpha)
            
        case .hsla(let h, let s, let l, _):
            return .hsla(h, s, l, clampedAlpha)
            
        case .named(let name):
            // For named colors, we need to convert to RGB values first
            if let rgb = namedColorToRgb(name) {
                return .rgba(rgb.r, rgb.g, rgb.b, clampedAlpha)
            }
            return self
            
        case .hex(let hex):
            // For hex colors, we can parse the RGB values
            if let rgb = hexToRgb(hex.value) {
                return .rgba(rgb.r, rgb.g, rgb.b, clampedAlpha)
            }
            return self
            
        default:
            // For other color types, simply return this color as we don't have
            // a straightforward way to apply opacity
            return self
        }
    }
    
    /// Helper function to convert HEX to RGB
    private func hexToRgb(_ hex: String) -> (r: Int, g: Int, b: Int)? {
        var cleaned = hex.trimmingCharacters(in: CharacterSet(charactersIn: "#"))
        
        // Handle shorthand hex (#RGB)
        if cleaned.count == 3 {
            cleaned = cleaned.map { "\($0)\($0)" }.joined()
        }
        
        guard cleaned.count == 6 else { return nil }
        
        var rgb: [Int] = []
        
        for i in stride(from: 0, to: 6, by: 2) {
            let start = cleaned.index(cleaned.startIndex, offsetBy: i)
            let end = cleaned.index(start, offsetBy: 2)
            let hexPair = String(cleaned[start..<end])
            
            guard let value = Int(hexPair, radix: 16) else { return nil }
            rgb.append(value)
        }
        
        return (r: rgb[0], g: rgb[1], b: rgb[2])
    }
    
    /// Helper function to convert named colors to RGB
    private func namedColorToRgb(_ name: NamedColor) -> (r: Int, g: Int, b: Int)? {
        // A simple lookup table for basic named colors
        switch name {
        case .black: return (0, 0, 0)
        case .silver: return (192, 192, 192)
        case .gray: return (128, 128, 128)
        case .white: return (255, 255, 255)
        case .maroon: return (128, 0, 0)
        case .red: return (255, 0, 0)
        case .purple: return (128, 0, 128)
        case .fuchsia: return (255, 0, 255)
        case .green: return (0, 128, 0)
        case .lime: return (0, 255, 0)
        case .olive: return (128, 128, 0)
        case .yellow: return (255, 255, 0)
        case .navy: return (0, 0, 128)
        case .blue: return (0, 0, 255)
        case .teal: return (0, 128, 128)
        case .aqua: return (0, 255, 255)
        default: return nil
        }
    }
    
    
    /// Black color
    public static let black: Color = .named(.black)
    
    /// White color
    public static let white: Color = .named(.white)
    
    /// Red color
    public static let red: Color = .named(.red)
    
    /// Green color
    public static let green: Color = .named(.green)
    
    /// Blue color
    public static let blue: Color = .named(.blue)
    
    /// Yellow color
    public static let yellow: Color = .named(.yellow)
    
    /// Magenta color
    public static let magenta: Color = .named(.fuchsia)
    
    /// Cyan color
    public static let cyan: Color = .named(.aqua)
    
    /// Gray color
    public static let gray: Color = .named(.gray)
    
    /// The currentColor keyword
    public static let current: Color = .currentColor
    
    
    /// Creates a color from a hexadecimal string
    ///
    /// - Parameter hex: The hexadecimal color string
    /// - Returns: A Color in hexadecimal notation
    public static func hex(_ hex: String) -> Color {
        return .hex(HexColor(hex))
    }
    
    /// Adjusts the brightness of a color by a percentage
    ///
    /// - Parameter percent: The brightness adjustment (-1.0 to 1.0, where -1.0 is completely darkened and 1.0 is completely lightened)
    /// - Returns: A new color with adjusted brightness
    public func adjustBrightness(by percent: Double) -> Color {
        guard percent >= -1, percent <= 1 else { return self }
        
        func adjustComponent(_ value: Int) -> Int {
            if percent > 0 {
                return min(255, max(0, Int(Double(value) + (255 - Double(value)) * percent)))
            } else {
                return max(0, min(255, Int(Double(value) * (1 + percent))))
            }
        }
        
        func adjustLightness(_ l: Double) -> Double {
            if percent > 0 {
                return min(100, max(0, l + (100 - l) * percent))
            } else {
                return max(0, min(100, l * (1 + percent)))
            }
        }
        
        switch self {
        case .rgb(let r, let g, let b):
            return .rgb(adjustComponent(r), adjustComponent(g), adjustComponent(b))
            
        case .rgba(let r, let g, let b, let a):
            return .rgba(adjustComponent(r), adjustComponent(g), adjustComponent(b), a)
            
        case .hsl(let h, let s, let l):
            return .hsl(h, s, adjustLightness(l))
            
        case .hsla(let h, let s, let l, let a):
            return .hsla(h, s, adjustLightness(l), a)
            
        case .hex(let hex):
            if let rgb = hexToRgb(hex.value) {
                let adjustedR = adjustComponent(rgb.r)
                let adjustedG = adjustComponent(rgb.g)
                let adjustedB = adjustComponent(rgb.b)
                return .rgb(adjustedR, adjustedG, adjustedB)
            }
            return self
            
        case .named(let name):
            if let rgb = namedColorToRgb(name) {
                let adjustedR = adjustComponent(rgb.r)
                let adjustedG = adjustComponent(rgb.g)
                let adjustedB = adjustComponent(rgb.b)
                return .rgb(adjustedR, adjustedG, adjustedB)
            }
            return self
            
        default:
            return self
        }
    }
    
    /// Creates a darker version of this color
    ///
    /// - Parameter percent: The amount to darken (0.0-1.0)
    /// - Returns: A darker color
    public func darker(by percent: Double = 0.2) -> Color {
        return adjustBrightness(by: -percent)
    }
    
    /// Creates a lighter version of this color
    ///
    /// - Parameter percent: The amount to lighten (0.0-1.0)
    /// - Returns: A lighter color
    public func lighter(by percent: Double = 0.2) -> Color {
        return adjustBrightness(by: percent)
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
