import Foundation
import CSSTypeTypes

/// The CSS `font-variant-numeric` property controls the usage of alternate glyphs
/// for numbers, fractions, and ordinal markers.
///
/// This property is crucial for proper internationalized typography, as different languages
/// and cultural contexts have different numbering styles and conventions.
///
/// Example:
/// ```swift
/// .fontVariantNumeric(.normal)                        // font-variant-numeric: normal
/// .fontVariantNumeric([.slashedZero])                 // font-variant-numeric: slashed-zero
/// .fontVariantNumeric([.oldstyleNums])                // font-variant-numeric: oldstyle-nums
/// .fontVariantNumeric([.tabularNums])                 // font-variant-numeric: tabular-nums
/// .fontVariantNumeric([.ordinal, .slashedZero])       // font-variant-numeric: ordinal slashed-zero
/// .fontVariantNumeric([.liningNums, .proportionalNums, 
///                       .diagonalFractions])          // font-variant-numeric: lining-nums 
///                                                     //                       proportional-nums 
///                                                     //                       diagonal-fractions
/// ```
///
/// - SeeAlso: [MDN Web Docs on font-variant-numeric](https://developer.mozilla.org/en-US/docs/Web/CSS/font-variant-numeric)
public enum FontVariantNumeric: Property {
    
    public static let property: String = "font-variant-numeric"
    
    /// Default rendering, deactivating the use of alternate numeric glyphs
    case normal
    
    /// A set of specific numeric glyph options to apply
    case options(Set<NumericOption>)
    
    /// Global values
    case global(CSSTypeTypes.Global)
    
    /// Initialize with a set of numeric options
    public init(_ options: Set<NumericOption>) {
        if options.isEmpty {
            self = .normal
        } else {
            self = .options(options)
        }
    }
    
    /// Initialize with an array of numeric options
    public init(_ options: [NumericOption]) {
        self.init(Set(options))
    }
    
    /// Initialize with multiple numeric options
    public init(_ options: NumericOption...) {
        self.init(options)
    }
}

/// Represents the possible numeric variant options
public enum NumericOption: String, Sendable, Hashable, CaseIterable {
    /// Forces the use of special glyphs for ordinal markers (1st, 2nd, 3rd, etc.)
    case ordinal
    
    /// Forces the use of a 0 with a slash; useful when a clear distinction
    /// between O and 0 is needed
    case slashedZero = "slashed-zero"
    
    // Numeric figure values
    /// Activates figures where all numbers are aligned on the baseline (modern style)
    case liningNums = "lining-nums"
    
    /// Activates figures where some numbers (like 3, 4, 7, 9) have descenders (traditional style)
    case oldstyleNums = "oldstyle-nums"
    
    // Numeric spacing values
    /// Activates proportionally-spaced figures where numbers have different widths
    case proportionalNums = "proportional-nums"
    
    /// Activates monospaced figures where all numbers have the same width,
    /// for alignment in tables and financial data
    case tabularNums = "tabular-nums"
    
    // Fraction values
    /// Activates diagonal fractions (numerator/denominator separated by a slash)
    case diagonalFractions = "diagonal-fractions"
    
    /// Activates stacked fractions (numerator stacked above denominator)
    case stackedFractions = "stacked-fractions"
}

/// CSS Output conversion
extension FontVariantNumeric: CustomStringConvertible {
    /// Converts the font-variant-numeric value to its CSS string representation
    public var description: String {
        switch self {
        case .normal:
            return "normal"
            
        case .options(let options):
            return options.map { $0.rawValue }.joined(separator: " ")
            
        case .global(let global):
            return global.description
        }
    }
}

// Convenience properties for common numeric variant combinations
extension FontVariantNumeric {
    /// Settings optimized for financial data: tabular numbers with slashed zero
    public static var financial: FontVariantNumeric {
        .options([.liningNums, .tabularNums, .slashedZero])
    }
    
    /// Settings for traditional text typography with oldstyle figures
    public static var traditional: FontVariantNumeric {
        .options([.oldstyleNums, .proportionalNums])
    }
    
    /// Settings for modern, clean typography
    public static var modern: FontVariantNumeric {
        .options([.liningNums, .proportionalNums])
    }
    
    /// Settings optimized for fraction display
    public static var fractions: FontVariantNumeric {
        .options([.liningNums, .diagonalFractions])
    }
    
    /// Settings optimized for tables and data
    public static var tabular: FontVariantNumeric {
        .options([.tabularNums, .liningNums])
    }
}
