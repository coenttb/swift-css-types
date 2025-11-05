import Foundation

/// Represents a CSS ratio value.
///
/// The `Ratio` type represents a proportional relationship between two values in CSS, most commonly
/// used for aspect ratios. Ratios are used in properties like `aspect-ratio` and in media queries like
/// `@media (min-aspect-ratio: 16/9)`.
///
/// Example:
/// ```swift
/// .aspectRatio(Ratio(16, 9))       // aspect-ratio: 16/9
/// .aspectRatio(Ratio(1))           // aspect-ratio: 1
/// ```
///
/// Common aspect ratios:
/// - 4/3 (1.33): Traditional TV format
/// - 16/9 (1.78): Modern widescreen TV format
/// - 185/100 (1.85): Common movie format
/// - 239/100 (2.39): Widescreen, anamorphic movie format
///
/// - SeeAlso: [MDN Web Docs on ratio](https://developer.mozilla.org/en-US/docs/Web/CSS/ratio)
public struct Ratio: Sendable, Hashable, Comparable {
    /// The width component of the ratio
    public let width: Double

    /// The height component of the ratio
    public let height: Double

    /// Creates a new CSS ratio value with explicit width and height
    /// - Parameters:
    ///   - width: The width component (must be positive)
    ///   - height: The height component (must be positive)
    public init(_ width: Double, _ height: Double) {
        precondition(width >= 0, "Width component of ratio must be positive")
        precondition(height >= 0, "Height component of ratio must be positive")
        self.width = width
        self.height = height
    }

    /// Creates a new CSS ratio value with explicit width and height as integers
    /// - Parameters:
    ///   - width: The width component (must be positive)
    ///   - height: The height component (must be positive)
    public init(_ width: Int, _ height: Int) {
        self.init(Double(width), Double(height))
    }

    /// Creates a square ratio (width/height = value/1)
    /// - Parameter value: The ratio value (must be positive)
    public init(_ value: Double) {
        self.init(value, 1)
    }

    /// Creates a square ratio (width/height = value/1) from an integer
    /// - Parameter value: The ratio value (must be positive)
    public init(_ value: Int) {
        self.init(Double(value))
    }

    /// The quotient of width divided by height
    public var quotient: Double {
        return width / height
    }

    /// Creates a square ratio (1:1)
    public static let square = Ratio(1, 1)

    /// Creates a 4:3 ratio (traditional TV)
    public static let tv = Ratio(4, 3)

    /// Creates a 16:9 ratio (widescreen)
    public static let widescreen = Ratio(16, 9)

    /// Creates a 21:9 ratio (ultrawide)
    public static let ultrawide = Ratio(21, 9)

    /// Creates a 1.85:1 ratio (common movie format)
    public static let movie = Ratio(185, 100)

    /// Creates a 2.39:1 ratio (anamorphic widescreen)
    public static let cinemascope = Ratio(239, 100)
}

/// Provides string conversion for CSS output
extension Ratio: CustomStringConvertible {
    /// Converts the ratio to its CSS string representation
    public var description: String {
        // Check if height is 1 and the CSS allows the simplified form
        if height == 1 {
            return width.truncatingRemainder()
        } else {
            return "\(width.truncatingRemainder()) / \(height.truncatingRemainder())"
        }
    }
}

/// Integer literal conversion
extension Ratio: ExpressibleByIntegerLiteral {
    /// Creates a ratio from an integer literal (value/1)
    public init(integerLiteral value: Int) {
        self.init(value)
    }
}

/// Floating point literal conversion
extension Ratio: ExpressibleByFloatLiteral {
    /// Creates a ratio from a floating point literal (value/1)
    public init(floatLiteral value: Double) {
        self.init(value)
    }
}

/// Ratio comparison operations
extension Ratio {
    /// Compares two ratios based on their quotients
    public static func < (lhs: Ratio, rhs: Ratio) -> Bool {
        return lhs.quotient < rhs.quotient
    }

    /// Returns the inverse of this ratio (height/width)
    public var inverse: Ratio {
        return Ratio(height, width)
    }

    /// Simplifies the ratio to its lowest terms
    /// - Returns: A new ratio with the same proportions but reduced to lowest terms
    public func simplified() -> Ratio {
        func gcd(_ a: Double, _ b: Double) -> Double {
            let epsilon = 1e-10

            // Convert to integers if they appear to be whole numbers
            let isWhole =
                a.truncatingRemainder(dividingBy: 1) < epsilon
                && b.truncatingRemainder(dividingBy: 1) < epsilon

            if isWhole {
                let intA = Int(a.rounded())
                let intB = Int(b.rounded())

                // Use Euclidean algorithm for integers
                func gcdInt(_ a: Int, _ b: Int) -> Int {
                    return b == 0 ? a : gcdInt(b, a % b)
                }

                return Double(gcdInt(intA, intB))
            }

            // For non-integer values, maintain original values
            // by returning 1 (which won't change the ratio)
            return 1.0
        }

        let divisor = gcd(width, height)
        return Ratio(width / divisor, height / divisor)
    }
}
