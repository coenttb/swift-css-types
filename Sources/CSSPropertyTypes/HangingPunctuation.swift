import Foundation
import CSSTypeTypes

/// The CSS `hanging-punctuation` property specifies whether a punctuation mark should hang
/// at the start or end of a line of text.
///
/// Hanging punctuation may be placed outside the line box. This property is particularly
/// useful for improving the visual appearance of text, especially with East Asian typography.
///
/// Example:
/// ```swift
/// .hangingPunctuation(.none)                 // hanging-punctuation: none
/// .hangingPunctuation(.first)                // hanging-punctuation: first
/// .hangingPunctuation(.last)                 // hanging-punctuation: last
/// .hangingPunctuation(.allowEnd)             // hanging-punctuation: allow-end
/// .hangingPunctuation(.all)                  // hanging-punctuation: first last allow-end
/// ```
///
/// - SeeAlso: [MDN Web Docs on hanging-punctuation](https://developer.mozilla.org/en-US/docs/Web/CSS/hanging-punctuation)
public enum HangingPunctuation: Property {
    
    public static let property: String = "hanging-punctuation"
    
    /// No character hangs
    case none
    
    /// A combination of hanging punctuation options
    case options(Set<HangingPunctuationOption>)
    
    /// Global values
    case global(CSSTypeTypes.Global)
    
    /// Initialize with a set of hanging punctuation options
    public init(_ options: Set<HangingPunctuationOption>) {
        if options.isEmpty {
            self = .none
        } else {
            self = .options(options)
        }
    }
    
    /// Initialize with an array of hanging punctuation options
    public init(_ options: [HangingPunctuationOption]) {
        self.init(Set(options))
    }
    
    /// Initialize with multiple hanging punctuation options
    public init(_ options: HangingPunctuationOption...) {
        self.init(options)
    }
}

/// Represents the possible options for hanging punctuation
public enum HangingPunctuationOption: String, Sendable, Hashable, CaseIterable {
    /// Opening punctuation at the start of the first line hangs
    case first
    
    /// Closing punctuation at the end of the last line hangs
    case last
    
    /// A stop or comma at the end of a line hangs if it doesn't otherwise fit
    case allowEnd = "allow-end"
}

/// CSS Output conversion
extension HangingPunctuation: CustomStringConvertible {
    /// Converts the hanging-punctuation value to its CSS string representation
    public var description: String {
        switch self {
        case .none:
            return "none"
            
        case .options(let options):
            return options.map { $0.rawValue }.joined(separator: " ")
            
        case .global(let global):
            return global.description
        }
    }
}

/// Common configurations for hanging punctuation
extension HangingPunctuation {
    /// Opening punctuation at the start of the first line hangs
    public static var first: HangingPunctuation {
        .options([.first])
    }
    
    /// Closing punctuation at the end of the last line hangs
    public static var last: HangingPunctuation {
        .options([.last])
    }
    
    /// A stop or comma at the end of a line hangs if it doesn't otherwise fit
    public static var allowEnd: HangingPunctuation {
        .options([.allowEnd])
    }
    
    /// Both opening and closing punctuation hang
    public static var firstAndLast: HangingPunctuation {
        .options([.first, .last])
    }
    
    /// First punctuation hangs and commas/stops at the end of a line hang
    public static var firstAndAllowEnd: HangingPunctuation {
        .options([.first, .allowEnd])
    }
    
    /// All punctuation types hang (first, last, and allow-end)
    public static var all: HangingPunctuation {
        .options([.first, .last, .allowEnd])
    }
}
