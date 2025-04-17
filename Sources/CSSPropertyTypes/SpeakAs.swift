//
//  SpeakAs.swift
//  swift-css
//
//  Created by Coen ten Thije Boonkkamp on 26/03/2025.
//

import Foundation
import CSSTypeTypes

/// The CSS `speak-as` property is used to define how HTML content is spoken.
///
/// This property determines the manner by which elements and text get rendered by
/// aural technologies, such as screen readers and digital assistants.
///
/// This property applies to all content, including pseudo-elements, with the
/// exception of ::marker pseudo-elements constructed via a @counter-style with
/// a defined speak-as descriptor.
///
/// - Warning: This is an experimental property with limited browser support.
///
/// - SeeAlso: [MDN Web Docs on speak-as](https://developer.mozilla.org/en-US/docs/Web/CSS/speak-as)
public enum SpeakAs: Property {
    public static let property: String = "speak-as"
    
    /// Configuration for how content is spoken
    case options(Options)
    
    /// Global CSS values
    case global(CSSTypeTypes.Global)
    
    /// Create a new speak-as property
    /// - Parameters:
    ///   - mode: The speaking mode for content (normal or spell-out)
    ///   - digits: Whether numbers are pronounced as individual digits
    ///   - punctuation: How punctuation marks are pronounced
    public init(mode: SpeakingMode = .normal,
                digits: Bool = false,
                punctuation: PunctuationMode = .auto) {
        self = .options(Options(mode: mode, digits: digits, punctuation: punctuation))
    }
    
    /// The different modes for speaking content
    public enum SpeakingMode: Sendable, Hashable, CustomStringConvertible {
        /// Normal pronunciation rules with punctuation replaced by pauses.
        /// For example, "Hello, world!" would be pronounced as "Hello (pause) world (pause)".
        case normal
        
        /// Content is spelled out letter by letter.
        /// For example, "role" would be pronounced as "r" "o" "l" "e".
        case spellOut
        
        /// String representation
        public var description: String {
            switch self {
            case .normal:
                return "normal"
            case .spellOut:
                return "spell-out"
            }
        }
    }
    
    /// The different modes for pronouncing punctuation
    public enum PunctuationMode: String, Sendable, Hashable, CustomStringConvertible {
        /// Default punctuation mode
        case auto
        
        /// Punctuation marks are spelled out literally.
        /// For example, "Hello, world!" would be pronounced as "Hello comma world exclamation mark."
        case literalPunctuation = "literal-punctuation"
        
        /// Content is pronounced normally without any punctuation.
        /// For example, "Hello, world!" would be pronounced as "Hello" "world".
        case noPunctuation = "no-punctuation"
        
        /// String representation
        public var description: String {
            return rawValue
        }
    }
    
    /// Configuration options for speak-as
    public struct Options: Sendable, Hashable, CustomStringConvertible {
        /// The speaking mode for content
        public let mode: SpeakingMode
        
        /// The speaking mode for digits
        public let digits: Bool
        
        /// The pronunciation of punctuation marks
        public let punctuation: PunctuationMode
        
        /// Create a new options configuration
        /// - Parameters:
        ///   - mode: The speaking mode for content
        ///   - digits: Whether numbers are pronounced as individual digits
        ///   - punctuation: How punctuation marks are pronounced
        public init(mode: SpeakingMode = .normal,
                    digits: Bool = false,
                    punctuation: PunctuationMode = .auto) {
            self.mode = mode
            self.digits = digits
            self.punctuation = punctuation
        }
        
        /// String representation
        public var description: String {
            if mode == .normal && !digits && punctuation == .auto {
                return "normal"
            }
            
            var components: [String] = []
            
            if mode != .normal {
                components.append(mode.description)
            }
            
            if digits {
                components.append("digits")
            }
            
            if punctuation != .auto {
                components.append(punctuation.description)
            }
            
            return components.isEmpty ? "normal" : components.joined(separator: " ")
        }
    }
}

/// CSS Output conversion
extension SpeakAs: CustomStringConvertible {
    /// Converts the speak-as value to its CSS string representation
    public var description: String {
        switch self {
        case .options(let options):
            return options.description
        case .global(let global):
            return global.description
        }
    }
}

/// Convenience factory methods for common speak-as values
extension SpeakAs {
    /// Normal pronunciation rules with punctuation replaced by pauses
    public static var normal: SpeakAs {
        .options(Options(mode: .normal, digits: false, punctuation: .auto))
    }
    
    /// Content is spelled out letter by letter
    public static var spellOut: SpeakAs {
        .options(Options(mode: .spellOut, digits: false, punctuation: .auto))
    }
    
    /// Punctuation marks are spelled out literally
    public static var literalPunctuation: SpeakAs {
        .options(Options(mode: .normal, digits: false, punctuation: .literalPunctuation))
    }
    
    /// Content is pronounced without any punctuation
    public static var noPunctuation: SpeakAs {
        .options(Options(mode: .normal, digits: false, punctuation: .noPunctuation))
    }
    
    /// Numbers are pronounced as individual digits
    public static var digits: SpeakAs {
        .options(Options(mode: .normal, digits: true, punctuation: .auto))
    }
}
