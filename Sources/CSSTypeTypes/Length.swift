//
//  File.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 13/08/2024.
//

import Foundation

/// Represents CSS length values for properties that accept dimensions
///
/// Length is a versatile type used throughout CSS for specifying dimensions like 
/// width, height, margin, padding, font-size, etc. It supports all standard CSS length 
/// units, percentages, keywords, and calculations.
///
/// Visual Reference:
/// ```
/// ┌─────────────────────────────────────────────┐
/// │                                             │
/// │  ┌─────────────────────┐                    │
/// │  │                     │ ← 200px (absolute) │
/// │  │                     │                    │
/// │  └─────────────────────┘                    │
/// │                                             │
/// │  ┌───────────────────────────────────┐      │
/// │  │                                   │      │
/// │  │                                   │ ← 50% (relative to parent) │
/// │  │                                   │      │
/// │  └───────────────────────────────────┘      │
/// │                                             │
/// │  ┌──────────────────────────────────────────┐
/// │  │                                          │
/// │  │                                          │ ← 100vw (viewport width)
/// │  │                                          │
/// │  └──────────────────────────────────────────┘
/// │                                             │
/// └─────────────────────────────────────────────┘
/// ```
///
/// Example:
/// ```swift
/// // Using factory methods
/// .width(.px(200))
/// .height(.percentage(50))
/// .margin(.em(1.5))
///
/// // Using numeric literals
/// .padding(10) // 10px (default)
/// .lineHeight(1.5) // 1.5 (unitless)
///
/// // Using extensions on numeric types
/// .width(200.px)
/// .margin(5.percent)
/// .fontSize(1.2.rem)
///
/// // Using keywords
/// .width(.auto)
/// .height(.maxContent)
///
/// // Using calculations
/// .width(.calc("100% - 20px"))
/// ```
///
/// - SeeAlso: [MDN Web Docs on CSS length values](https://developer.mozilla.org/en-US/docs/Web/CSS/length)
public enum Length: Sendable, ExpressibleByIntegerLiteral, ExpressibleByFloatLiteral, GlobalConvertible {
    /// A length with a specific unit
    ///
    /// This case represents explicit dimensions with any of the supported CSS units.
    case length(Double, Unit)
//    
//    /// A percentage value
//    ///
//    /// Percentages are relative to another value, typically the parent element's
//    /// corresponding dimension or the viewport size.
//    case percent(Double)
    
    /// A specific CSS length keyword
    ///
    /// These keywords provide special dimension behaviors like automatic sizing.
    case keyword(Keyword)
    
    /// A CSS calc() function expression
    ///
    /// The calc() function lets you perform calculations to determine CSS property values.
    case calc(String)
    
    /// Global CSS values that can be applied to any CSS property
    case global(Global)
    
    /// Available CSS length units
    ///
    /// These units represent the various ways to measure length in CSS,
    /// including absolute units (px, cm, etc.) and relative units (em, vw, etc.).
    public enum Unit: String, Sendable {
        // Absolute units
        /// Pixels (device pixels)
        case px
        
        // Relative font units
        /// Relative to the font-size of the element
        case em
        /// Relative to the font-size of the root element
        case rem
        
        // Viewport-relative units
        /// Percentage of viewport width
        case vw
        /// Percentage of viewport height
        case vh
        /// Minimum of viewport width and height
        case vmin
        /// Maximum of viewport width and height
        case vmax
        
        // Physical units
        /// Centimeters
        case cm
        /// Millimeters
        case mm
        /// Inches
        case `in`
        /// Points (1/72 of an inch)
        case pt
        /// Picas (12 points)
        case pc
        
        // More typography-related units
        /// x-height of the element's font
        case ex
        /// Width of the "0" (zero) character
        case ch
        /// Line height of the element
        case lh
        
        // Grid-specific units
        /// Fractional unit for CSS Grid layouts
        case fr
        
        // Newer CSS units
        /// Quarter-millimeters
        case q
        /// Cap height (height of capital letters)
        case cap
        /// Ideographic character width
        case ic
        /// Line height of the root element
        case rlh
    }
    
    /// CSS length-related keywords
    ///
    /// These keywords are used for special sizing behaviors that can't be 
    /// expressed with numeric values.
    public enum Keyword: String, Sendable {
        /// Browser determines the appropriate size based on context
        case auto
        
        /// Size to the intrinsic maximum width/height of the content
        case maxContent = "max-content"
        
        /// Size to the intrinsic minimum width/height of the content
        case minContent = "min-content"
        
        /// Size based on content while respecting constraints
        case fitContent = "fit-content"
    }
    
    /// Creates a length using an integer literal
    ///
    /// Integer literals are interpreted as pixel values.
    ///
    /// - Parameter value: The pixel value as an integer
    ///
    /// Example:
    /// ```swift
    /// .width(100) // Equivalent to .width(.px(100))
    /// ```
    public init(integerLiteral value: Int) {
        self = .length(Double(value), .px)
    }
    
    /// Creates a length using a floating-point literal
    ///
    /// Floating-point literals are interpreted as pixel values.
    ///
    /// - Parameter value: The pixel value as a double
    ///
    /// Example:
    /// ```swift
    /// .width(10.5) // Equivalent to .width(.px(10.5))
    /// ```
    public init(floatLiteral value: Double) {
        self = .length(value, .px)
    }
}

/// Implements equality comparison for Length values
extension Length: Equatable {
    /// Compares two Length values for equality
    ///
    /// Two Length values are considered equal if they have the same case and values.
    public static func == (lhs: Length, rhs: Length) -> Bool {
        switch (lhs, rhs) {
        case let (.length(value1, unit1), .length(value2, unit2)):
            return value1 == value2 && unit1 == unit2
//        case let (.percentage(value1), .percentage(value2)):
//            return value1 == value2
        case let (.keyword(keyword1), .keyword(keyword2)):
            return keyword1 == keyword2
        case let (.calc(calc1), .calc(calc2)):
            return calc1 == calc2
        case let (.global(global1), .global(global2)):
            return global1 == global2
        default:
            return false
        }
    }
}

/// Implements numeric operations for Length values
extension Length: Numeric {
    /// Type representing the magnitude of a Length value
    public typealias Magnitude = Double
    
    /// The absolute value of the Length
    ///
    /// For length and percent values, returns the absolute numeric value.
    /// For other types, returns 0.
    public var magnitude: Double {
        switch self {
        case .length(let value, _):
            return abs(value)
//        case .percentage(let percentage):
//            return abs(percentage)
        case .calc, .keyword, .global:
            return 0 // Non-numeric types return 0 magnitude
        }
    }
    
    /// Creates a Length from an exact binary integer
    ///
    /// This initializer converts the integer to a pixel value.
    public init?<T>(exactly source: T) where T : BinaryInteger {
        self = .length(Double(source), .px)
    }
    
    /// Multiplies two Length values
    ///
    /// - For lengths with the same unit, multiplies the values and preserves the unit
    /// - For percentages, multiplies the percentage values
    /// - For mixed types, creates a calc() expression
    ///
    /// Example:
    /// ```swift
    /// let doubled = 5.px * 2 // 10px
    /// ```
    public static func * (lhs: Length, rhs: Length) -> Length {
        switch (lhs, rhs) {
        case (.length(let v1, let u1), .length(let v2, let u2)) where u1 == u2:
            return .length(v1 * v2, u1)
        default:
            return .calc("\(lhs) * \(rhs)")
        }
    }
    
    /// Multiplies a Length value in place
    ///
    /// Replaces the left-hand value with the result of multiplying by the right-hand value.
    public static func *= (lhs: inout Length, rhs: Length) {
        lhs = lhs * rhs
    }
    
    /// Adds two Length values
    ///
    /// - For lengths with the same unit, adds the values and preserves the unit
    /// - For percentages, adds the percentage values
    /// - For mixed types, creates a calc() expression
    ///
    /// Example:
    /// ```swift
    /// let sum = 5.px + 10.px // 15px
    /// let mixed = 50.percent + 20.px // calc(50% + 20px)
    /// ```
    public static func + (lhs: Length, rhs: Length) -> Length {
        switch (lhs, rhs) {
        case (.length(let v1, let u1), .length(let v2, let u2)) where u1 == u2:
            return .length(v1 + v2, u1)
//        case (.percentage(let v1), .percentage(let v2)):
//            return .percentage(v1 + v2)
        default:
            return .calc("\(lhs) + \(rhs)")
        }
    }
    
    /// Adds a Length value in place
    ///
    /// Replaces the left-hand value with the result of adding the right-hand value.
    public static func += (lhs: inout Length, rhs: Length) {
        lhs = lhs + rhs
    }
    
    /// Subtracts two Length values
    ///
    /// - For lengths with the same unit, subtracts the values and preserves the unit
    /// - For percentages, subtracts the percentage values
    /// - For mixed types, creates a calc() expression
    ///
    /// Example:
    /// ```swift
    /// let difference = 15.px - 5.px // 10px
    /// let mixed = 100.percent - 20.px // calc(100% - 20px)
    /// ```
    public static func - (lhs: Length, rhs: Length) -> Length {
        switch (lhs, rhs) {
        case (.length(let v1, let u1), .length(let v2, let u2)) where u1 == u2:
            return .length(v1 - v2, u1)
//        case (.percentage(let v1), .percentage(let v2)):
//            return .percentage(v1 - v2)
        default:
            return .calc("\(lhs) - \(rhs)")
        }
    }
    
    /// Subtracts a Length value in place
    ///
    /// Replaces the left-hand value with the result of subtracting the right-hand value.
    public static func -= (lhs: inout Length, rhs: Length) {
        lhs = lhs - rhs
    }
    
    /// Divides a Length value by a numeric divisor
    ///
    /// Divides the numeric component of the Length by the specified value,
    /// keeping the same unit or type.
    ///
    /// - Parameters:
    ///   - lhs: The Length value to divide
    ///   - rhs: The divisor
    ///
    /// - Returns: A new Length value with the divided magnitude
    ///
    /// - Precondition: The divisor must not be zero
    ///
    /// Example:
    /// ```swift
    /// let half = 10.px / 2 // 5px
    /// ```
    public static func / (lhs: Length, rhs: Double) -> Length {
        guard rhs != 0 else { fatalError("Division by zero") }
        switch lhs {
        case .length(let value, let unit):
            return .length(value / rhs, unit)
//        case .percentage(let percentage):
//            return .percentage(percentage / rhs)
        case .calc(let expression):
            return .calc("(\(expression)) / \(rhs)")
        case .keyword, .global:
            return lhs // Keywords and globals cannot be divided
        }
    }
}

/// Extends Length with additional division functionality
extension Length {
    /// Divides a Length value by an integer divisor
    ///
    /// Convenience operator that converts the integer to a Double before dividing.
    ///
    /// - Parameters:
    ///   - lhs: The Length value to divide
    ///   - rhs: The integer divisor
    ///
    /// - Returns: A new Length value with the divided magnitude
    ///
    /// Example:
    /// ```swift
    /// let third = 15.px / 3 // 5px
    /// ```
    public static func / (lhs: Length, rhs: Int) -> Length {
        return lhs / Double(rhs)
    }
}

/// Factory methods for creating Length values
extension Length {
    /// Creates a pixel length value
    ///
    /// Pixels are absolute units that represent device pixels.
    ///
    /// - Parameter value: The number of pixels
    ///
    /// Example:
    /// ```swift
    /// .width(.px(200)) // width: 200px
    /// ```
    public static func px(_ value: Double) -> Self { .length(value, .px) }
    
    /// Creates an em length value
    ///
    /// Ems are relative to the font-size of the current element.
    ///
    /// - Parameter value: The number of ems
    ///
    /// Example:
    /// ```swift
    /// .margin(.em(1.5)) // margin: 1.5em
    /// ```
    public static func em(_ value: Double) -> Self { .length(value, .em) }
    
    /// Creates a rem length value
    ///
    /// Rems are relative to the font-size of the root element.
    ///
    /// - Parameter value: The number of rems
    ///
    /// Example:
    /// ```swift
    /// .fontSize(.rem(1.2)) // font-size: 1.2rem
    /// ```
    public static func rem(_ value: Double) -> Self { .length(value, .rem) }
    
    /// Creates a viewport width percentage value
    ///
    /// vw units are relative to 1% of the viewport's width.
    ///
    /// - Parameter value: The percentage of viewport width
    ///
    /// Example:
    /// ```swift
    /// .width(.vw(50)) // width: 50vw
    /// ```
    public static func vw(_ value: Double) -> Self { .length(value, .vw) }
    
    /// Creates a viewport height percentage value
    ///
    /// vh units are relative to 1% of the viewport's height.
    ///
    /// - Parameter value: The percentage of viewport height
    ///
    /// Example:
    /// ```swift
    /// .height(.vh(100)) // height: 100vh
    /// ```
    public static func vh(_ value: Double) -> Self { .length(value, .vh) }
    
    /// Creates a fractional unit value for CSS Grid
    ///
    /// fr units represent a fraction of the available space in the grid container.
    ///
    /// - Parameter value: The number of fraction units
    ///
    /// Example:
    /// ```swift
    /// .gridTemplateColumns(.fr(1), .fr(2)) // grid-template-columns: 1fr 2fr
    /// ```
    public static func fr(_ value: Double) -> Self { .length(value, .fr) }
    
    /// The auto keyword
    ///
    /// The browser determines the appropriate size based on context.
    ///
    /// Example:
    /// ```swift
    /// .width(.auto) // width: auto
    /// ```
    public static let auto: Self = .keyword(.auto)
    
    /// The max-content keyword
    ///
    /// Represents the intrinsic maximum width of the content.
    ///
    /// Example:
    /// ```swift
    /// .width(.maxContent) // width: max-content
    /// ```
    public static let maxContent: Self = .keyword(.maxContent)
    
    /// The min-content keyword
    ///
    /// Represents the intrinsic minimum width of the content.
    ///
    /// Example:
    /// ```swift
    /// .width(.minContent) // width: min-content
    /// ```
    public static let minContent: Self = .keyword(.minContent)
    
    /// The fit-content keyword
    ///
    /// Sizes the element based on its content while respecting constraints.
    ///
    /// Example:
    /// ```swift
    /// .width(.fitContent) // width: fit-content
    /// ```
    public static let fitContent: Self = .keyword(.fitContent)
}

/// Provides string conversion for CSS output
extension Length: CustomStringConvertible {
    /// Converts the length value to its CSS string representation
    ///
    /// This method generates the exact string that should be used in CSS:
    /// ```css
    /// 100px
    /// 1.5em
    /// 50%
    /// calc(100% - 20px)
    /// ```
    ///
    /// Integer values are displayed without decimal points for cleaner output.
    public var description: String {
        switch self {
        case .length(let value, let unit):
            return "\(value.truncatingRemainder())\(unit.rawValue)"
        case .keyword(let keyword):
            return keyword.rawValue
        case .calc(let expression):
            return "calc(\(expression))"
        case .global(let global):
            return global.rawValue
        }
    }
}

/// Integer extensions for creating Length values
extension Int {
    /// Creates a pixel length from this integer
    public var px: Length { .px(Double(self)) }
    
    /// Creates an em length from this integer
    public var em: Length { .em(Double(self)) }
    
    /// Creates a rem length from this integer
    public var rem: Length { .rem(Double(self)) }
    
    /// Creates a viewport width percentage from this integer
    public var vw: Length { .vw(Double(self)) }
    
    /// Creates a viewport height percentage from this integer
    public var vh: Length { .vh(Double(self)) }
    
    /// Creates a grid fractional unit from this integer
    public var fr: Length { .fr(Double(self)) }
    
//    /// Creates a percentage from this integer
//    public var percent: Length { .percentage(Double(self)) }
    
    // Additional units
    
    /// Creates a centimeter length from this integer
    public var cm: Length { .length(Double(self), .cm) }
    
    /// Creates a millimeter length from this integer
    public var mm: Length { .length(Double(self), .mm) }
    
    /// Creates an inch length from this integer
    public var `in`: Length { .length(Double(self), .in) }
    
    /// Creates a point length from this integer
    public var pt: Length { .length(Double(self), .pt) }
    
    /// Creates a pica length from this integer
    public var pc: Length { .length(Double(self), .pc) }
    
    /// Creates an ex length from this integer
    public var ex: Length { .length(Double(self), .ex) }
    
    /// Creates a ch length from this integer
    public var ch: Length { .length(Double(self), .ch) }
    
    /// Creates a line-height length from this integer
    public var lh: Length { .length(Double(self), .lh) }
    
    /// Creates a viewport minimum length from this integer
    public var vmin: Length { .length(Double(self), .vmin) }
    
    /// Creates a viewport maximum length from this integer
    public var vmax: Length { .length(Double(self), .vmax) }
}

/// Double extensions for creating Length values
extension Double {
    /// Creates a pixel length from this double
    public var px: Length { .px(self) }
    
    /// Creates an em length from this double
    public var em: Length { .em(self) }
    
    /// Creates a rem length from this double
    public var rem: Length { .rem(self) }
    
    /// Creates a viewport width percentage from this double
    public var vw: Length { .vw(self) }
    
    /// Creates a viewport height percentage from this double
    public var vh: Length { .vh(self) }
    
    /// Creates a grid fractional unit from this double
    public var fr: Length { .fr(self) }
    
//    /// Creates a percentage from this double
//    public var percent: Length { .percentage(self) }
    
    // Additional units
    
    /// Creates a centimeter length from this double
    public var cm: Length { .length(self, .cm) }
    
    /// Creates a millimeter length from this double
    public var mm: Length { .length(self, .mm) }
    
    /// Creates an inch length from this double
    public var `in`: Length { .length(self, .in) }
    
    /// Creates a point length from this double
    public var pt: Length { .length(self, .pt) }
    
    /// Creates a pica length from this double
    public var pc: Length { .length(self, .pc) }
    
    /// Creates an ex length from this double
    public var ex: Length { .length(self, .ex) }
    
    /// Creates a ch length from this double
    public var ch: Length { .length(self, .ch) }
    
    /// Creates a line-height length from this double
    public var lh: Length { .length(self, .lh) }
    
    /// Creates a viewport minimum length from this double
    public var vmin: Length { .length(self, .vmin) }
    
    /// Creates a viewport maximum length from this double
    public var vmax: Length { .length(self, .vmax) }
}

/// Additional unit extensions for Int
extension Int {
    
    /// Creates a quarter-millimeter length from this integer
    public var q: Length { .length(Double(self), .q) }
    
    /// Creates a cap height length from this integer
    public var cap: Length { .length(Double(self), .cap) }
    
    /// Creates an ideographic character width from this integer
    public var ic: Length { .length(Double(self), .ic) }
    
    /// Creates a root line height length from this integer
    public var rlh: Length { .length(Double(self), .rlh) }
}

/// Additional unit extensions for Double
extension Double {
    /// Creates a quarter-millimeter length from this double
    public var q: Length { .length(self, .q) }
    
    /// Creates a cap height length from this double
    public var cap: Length { .length(self, .cap) }
    
    /// Creates an ideographic character width from this double
    public var ic: Length { .length(self, .ic) }
    
    /// Creates a root line height length from this double
    public var rlh: Length { .length(self, .rlh) }
}

//extension Length: LengthConvertible {
//    public static func length(_ length: Length) -> Length {
//        length
//    }
//}
