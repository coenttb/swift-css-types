// import Foundation
// import CSSTypeTypes
// import CSSPropertyTypes
//
///// The CSS `unicode-range` descriptor defines the range of Unicode code points that 
///// may be supported by the font face for which it is declared.
/////
///// This property is essential for font subsetting, which allows browsers to download only
///// the portions of a font file needed for the text on a page, improving performance for
///// international and multilingual websites.
/////
///// - Note: This property is used within an @font-face rule, not as a standalone property.
/////
///// Example:
///// ```swift
///// // Single character range
///// .unicodeRange([.codePoint(0x26)])                       // unicode-range: U+26
/////
///// // Character range with wildcard 
///// .unicodeRange([.wildcard(0x4)])                         // unicode-range: U+4??
/////
///// // Character range with specific start and end
///// .unicodeRange([.range(0x400, 0x4FF)])                   // unicode-range: U+400-4FF
/////
///// // Multiple ranges
///// .unicodeRange([
/////   .range(0x0, 0x7F),                                   // Basic Latin  
/////   .range(0x80, 0xFF),                                  // Latin-1 Supplement
/////   .range(0x100, 0x17F)                                 // Latin Extended-A
///// ])                                                      // unicode-range: U+0-7F, U+80-FF, U+100-17F
///// ```
/////
///// - SeeAlso: [MDN Web Docs on unicode-range](https://developer.mozilla.org/en-US/docs/Web/CSS/@font-face/unicode-range)
// public enum UnicodeRange: Property {
//    public static let property: String = "unicode-range"
//    
//    /// A collection of Unicode range values.
//    case ranges([UnicodeRangeValue])
//    
//    /// Global values are not applicable to this descriptor
//    /// (but included for consistency with other CSS properties).
//    case global(Global)
//    
//    /// Initialize with a single Unicode range value
//    public init(_ range: UnicodeRangeValue) {
//        self = .ranges([range])
//    }
//    
//    /// Initialize with an array of Unicode range values
//    public init(_ ranges: [UnicodeRangeValue]) {
//        if ranges.isEmpty {
//            // Default to full Unicode range if empty
//            self = .ranges([.range(0x0, 0x10FFFF)])
//        } else {
//            self = .ranges(ranges)
//        }
//    }
//    
//    /// Initialize with multiple Unicode range values
//    public init(_ ranges: UnicodeRangeValue...) {
//        self.init(ranges)
//    }
// }
//
///// Represents different types of Unicode range specifications
// public enum UnicodeRangeValue: Sendable, Hashable {
//    /// A single code point, e.g., U+26
//    case codePoint(Int)
//    
//    /// A range defined by start and end code points, e.g., U+400-4FF
//    case range(Int, Int)
//    
//    /// A wildcard range, e.g., U+4?? (matches U+400 through U+4FF)
//    case wildcard(Int)
//    
//    /// Validates that the code point is within the valid Unicode range (0-10FFFF)
//    private static func isValidCodePoint(_ codePoint: Int) -> Bool {
//        return codePoint >= 0 && codePoint <= 0x10FFFF
//    }
// }
//
///// CSS Output conversion
// extension UnicodeRange: CustomStringConvertible {
//    /// Converts the unicode-range value to its CSS string representation
//    public var description: String {
//        switch self {
//        case .ranges(let ranges):
//            return ranges.map { $0.description }.joined(separator: ", ")
//            
//        case .global(let global):
//            return global.description
//        }
//    }
// }
//
// extension UnicodeRangeValue: CustomStringConvertible {
//    /// Converts the unicode range value to its CSS string representation
//    public var description: String {
//        switch self {
//        case .codePoint(let code):
//            return .init(format: "U+%X", code)
//            
//        case .range(let start, let end):
//            return .init(format: "U+%X-%X", start, end)
//            
//        case .wildcard(let prefix):
//            let prefixHex: String = .init(format: "%X", prefix)
//            let wildcards: String = .init(repeating: "?", count: 6 - prefixHex.count)
//            return "U+\(prefixHex)\(wildcards)"
//        }
//    }
// }
//
//// Convenience factories for common Unicode ranges
// extension UnicodeRange {
//    /// Basic Latin (ASCII) range: U+0-7F
//    public static var basicLatin: UnicodeRange {
//        .ranges([.range(0x0, 0x7F)])
//    }
//    
//    /// Latin-1 Supplement range: U+80-FF
//    public static var latin1Supplement: UnicodeRange {
//        .ranges([.range(0x80, 0xFF)])
//    }
//    
//    /// Latin Extended-A range: U+100-17F
//    public static var latinExtendedA: UnicodeRange {
//        .ranges([.range(0x100, 0x17F)])
//    }
//    
//    /// Latin Extended-B range: U+180-24F
//    public static var latinExtendedB: UnicodeRange {
//        .ranges([.range(0x180, 0x24F)])
//    }
//    
//    /// Cyrillic range: U+400-4FF
//    public static var cyrillic: UnicodeRange {
//        .ranges([.range(0x400, 0x4FF)])
//    }
//    
//    /// Greek range: U+370-3FF
//    public static var greek: UnicodeRange {
//        .ranges([.range(0x370, 0x3FF)])
//    }
//    
//    /// Arabic range: U+600-6FF
//    public static var arabic: UnicodeRange {
//        .ranges([.range(0x600, 0x6FF)])
//    }
//    
//    /// Hebrew range: U+590-5FF
//    public static var hebrew: UnicodeRange {
//        .ranges([.range(0x590, 0x5FF)])
//    }
//    
//    /// CJK (Chinese, Japanese, Korean) ranges
//    public static var cjk: UnicodeRange {
//        .ranges([
//            .range(0x3000, 0x30FF),  // Japanese, including Hiragana and Katakana
//            .range(0x4E00, 0x9FFF),  // CJK Unified Ideographs
//            .range(0x3400, 0x4DBF),  // CJK Unified Ideographs Extension A
//            .range(0xF900, 0xFAFF)   // CJK Compatibility Ideographs
//        ])
//    }
//    
//    /// Full Latin alphabet with common extensions and punctuation
//    public static var fullLatin: UnicodeRange {
//        .ranges([
//            .range(0x0, 0x7F),        // Basic Latin
//            .range(0x80, 0xFF),       // Latin-1 Supplement
//            .range(0x100, 0x17F),     // Latin Extended-A
//            .range(0x180, 0x24F),     // Latin Extended-B
//            .range(0x2000, 0x206F),   // General Punctuation
//            .range(0x2070, 0x209F),   // Superscripts and Subscripts
//            .range(0x20A0, 0x20CF)    // Currency Symbols
//        ])
//    }
// }
