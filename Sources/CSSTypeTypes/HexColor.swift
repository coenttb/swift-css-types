import Foundation

/// Represents a CSS hexadecimal color notation.
///
/// The `HexColor` type represents sRGB colors using their primary components
/// (red, green, blue) written as hexadecimal numbers, with optional transparency (alpha).
/// Hex colors are commonly used in CSS and are a concise way to define colors.
///
/// Example:
/// ```swift
/// .color(.hex("#ff0099"))         // Pink (#ff0099)
/// .color(.hex("#f09"))            // Same color in shorthand
/// .color(.hex("#ff0099aa"))       // Semi-transparent pink
/// ```
///
/// - Note: This type accepts standard hexadecimal color notations in 3, 4, 6, or 8 digit formats.
///         The prefix "#" is required for valid CSS output.
///
/// - SeeAlso: [MDN Web Docs on hex-color](https://developer.mozilla.org/en-US/docs/Web/CSS/hex-color)
public struct HexColor: Sendable, Equatable {
    /// The hex color value including the leading "#"
    public let value: String
    
    /// Creates a hexadecimal color from a string value.
    ///
    /// - Parameter value: The hex color string (e.g., "#ff0000", "#f00")
    /// - Note: The function will add a "#" prefix if missing
    public init(_ value: String) {
        if value.hasPrefix("#") {
            self.value = value
        } else {
            self.value = "#" + value
        }
    }
    
    /// Creates a hexadecimal color using RGB components.
    ///
    /// - Parameters:
    ///   - red: The red component (0-255)
    ///   - green: The green component (0-255)
    ///   - blue: The blue component (0-255)
    /// - Returns: A HexColor in 6-digit format (#RRGGBB)
    public static func rgb(_ red: Int, _ green: Int, _ blue: Int) -> HexColor {
        let hexString: String = .init(format: "#%02X%02X%02X", 
                             min(max(0, red), 255),
                             min(max(0, green), 255),
                             min(max(0, blue), 255))
        return HexColor(hexString)
    }
    
    /// Creates a hexadecimal color using RGBA components.
    ///
    /// - Parameters:
    ///   - red: The red component (0-255)
    ///   - green: The green component (0-255)
    ///   - blue: The blue component (0-255)
    ///   - alpha: The alpha component (0.0-1.0)
    /// - Returns: A HexColor in 8-digit format (#RRGGBBAA)
    public static func rgba(_ red: Int, _ green: Int, _ blue: Int, _ alpha: Double) -> HexColor {
        // Convert alpha from 0.0-1.0 to 0-255 (using rounding instead of truncation)
        let alphaInt = Int(round(min(max(0.0, alpha), 1.0) * 255))
        
        let hexString = String(format: "#%02X%02X%02X%02X", 
                             min(max(0, red), 255),
                             min(max(0, green), 255),
                             min(max(0, blue), 255),
                             alphaInt)
        return HexColor(hexString)
    }
    
    /// Checks if the hex color is valid.
    ///
    /// - Returns: True if the hex color has a valid format (3, 4, 6, or 8 digits with # prefix)
    public var isValid: Bool {
        let pattern = "^#([0-9A-Fa-f]{3}|[0-9A-Fa-f]{4}|[0-9A-Fa-f]{6}|[0-9A-Fa-f]{8})$"
        let regex = try? NSRegularExpression(pattern: pattern)
        let range = NSRange(location: 0, length: value.utf16.count)
        return regex?.firstMatch(in: value, range: range) != nil
    }
}

/// Provides string conversion for CSS output
extension HexColor: CustomStringConvertible {
    /// Converts the hex color to its CSS string representation
    public var description: String {
        return value
    }
}

///// Conformance to Color protocol
//extension HexColor: Color {
//    /// Returns an opacity-modified version of this color
//    ///
//    /// - Parameter alpha: The opacity value (0.0-1.0)
//    /// - Returns: A new color with the specified opacity
//    public func opacity(_ alpha: Double) -> Color {
//        // Parse existing hex color
//        let trimmedValue = value.hasPrefix("#") ? String(value.dropFirst()) : value
//        
//        var red = 0, green = 0, blue = 0
//        
//        // Handle different hex formats
//        switch trimmedValue.count {
//        case 3: // #RGB
//            let chars = Array(trimmedValue)
//            red = Int(String(repeating: chars[0], count: 2), radix: 16) ?? 0
//            green = Int(String(repeating: chars[1], count: 2), radix: 16) ?? 0
//            blue = Int(String(repeating: chars[2], count: 2), radix: 16) ?? 0
//            
//        case 4: // #RGBA - ignore original alpha
//            let chars = Array(trimmedValue)
//            red = Int(String(repeating: chars[0], count: 2), radix: 16) ?? 0
//            green = Int(String(repeating: chars[1], count: 2), radix: 16) ?? 0
//            blue = Int(String(repeating: chars[2], count: 2), radix: 16) ?? 0
//            
//        case 6: // #RRGGBB
//            red = Int(trimmedValue.prefix(2), radix: 16) ?? 0
//            green = Int(trimmedValue.dropFirst(2).prefix(2), radix: 16) ?? 0
//            blue = Int(trimmedValue.dropFirst(4).prefix(2), radix: 16) ?? 0
//            
//        case 8: // #RRGGBBAA - ignore original alpha
//            red = Int(trimmedValue.prefix(2), radix: 16) ?? 0
//            green = Int(trimmedValue.dropFirst(2).prefix(2), radix: 16) ?? 0
//            blue = Int(trimmedValue.dropFirst(4).prefix(2), radix: 16) ?? 0
//            
//        default:
//            // If invalid format, return original with CSS rgba() function
//            return CSS.RGBAColor(red: 0, green: 0, blue: 0, alpha: alpha)
//        }
//        
//        // Create a new color with the specified opacity
//        return HexColor.rgba(red, green, blue, alpha)
//    }
//}
