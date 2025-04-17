import Foundation
import CSSTypeTypes

/// Represents a CSS @media at-rule.
///
/// The @media CSS at-rule can be used to apply part of a style sheet based 
/// on the result of one or more media queries.
///
/// Examples:
/// ```swift
/// // Using media type
/// Media.screen
///
/// // Using direct feature initialization
/// Media.prefersColorScheme(.dark)
///
/// // Combining media queries with logical operators
/// Media.screen.and(Media.maxWidth(.px(500)))
///
/// // More concise approach with direct feature methods
/// Media.screen
///     .and(Media.maxWidth(.px(500)))
///     .and(Media.prefersColorScheme(.dark))
///
/// // Using operator overloads
/// Media.screen & Media.maxWidth(.px(500)) & Media.prefersColorScheme(.dark)
/// ```
public struct Media: AtRule {
    public static let identifier: String = "media"
    
    public var rawValue: String
    
    public init(rawValue: String) {
        self.rawValue = rawValue
    }
    
    /// Creates a new media query with the specified type.
    public init(_ type: MediaType) {
        self.rawValue = "@media \(type.rawValue)"
    }
    
    /// Helper to create a media feature query
    private static func feature(_ name: String, _ value: CustomStringConvertible) -> Media {
        Media(rawValue: "@media (\(name): \(value))")
    }
    
    /// Returns true if this media query is a feature query
    private var isFeatureQuery: Bool {
        rawValue.starts(with: "@media (") && rawValue.hasSuffix(")")
    }
    
    /// Extracts the feature part from a feature query
    private var featureString: String? {
        guard isFeatureQuery else { return nil }
        return String(rawValue.dropFirst(8).dropLast(1))
    }
    
    /// Combines this media query with another using the 'and' operator.
    public func and(_ other: Media) -> Media {
        guard let featureString = other.featureString else {
            // If other is not a feature query, fall back to OR behavior
            return self.or(other)
        }
        
        return Media(rawValue: "\(rawValue) and (\(featureString))")
    }
    
    /// Negates the media query.
    public func not() -> Media {
        Media(rawValue: "@media not \(rawValue.dropFirst(7))")
    }
    
    /// Applies the 'only' operator to the media query.
    public func only() -> Media {
        if rawValue.starts(with: "@media ") {
            return Media(rawValue: "@media only \(rawValue.dropFirst(7))")
        }
        return self
    }
    
    /// Combines this media query with another using the 'or' operator (comma in CSS).
    public func or(_ other: Media) -> Media {
        Media(rawValue: "\(rawValue), \(other.rawValue.dropFirst(7))")
    }
    
    // Predefined media types
    public static let all = Media(.all)
    public static let print = Media(.print)
    public static let screen = Media(.screen)
}

// MARK: - Media Type

extension Media {
    /// Represents media types in a CSS @media query.
    public enum MediaType: String, Hashable, Sendable {
        /// Suitable for all devices.
        case all
        
        /// Intended for paged material and documents viewed on a screen in print preview mode.
        case print
        
        /// Intended primarily for screens.
        case screen
    }
}

// MARK: - Direct Feature Methods

extension Media {
    // Width-related features
    public static func width(_ value: LengthPercentage) -> Media {
        feature("width", value)
    }
    
    public static func minWidth(_ value: LengthPercentage) -> Media {
        feature("min-width", value)
    }
    
    public static func maxWidth(_ value: LengthPercentage) -> Media {
        feature("max-width", value)
    }
    
    // Height-related features
    public static func height(_ value: LengthPercentage) -> Media {
        feature("height", value)
    }
    
    public static func minHeight(_ value: LengthPercentage) -> Media {
        feature("min-height", value)
    }
    
    public static func maxHeight(_ value: LengthPercentage) -> Media {
        feature("max-height", value)
    }
    
    // Aspect ratio
    public static func aspectRatio(_ width: Int, _ height: Int) -> Media {
        feature("aspect-ratio", "\(width)/\(height)")
    }
    
    public static func minAspectRatio(_ width: Int, _ height: Int) -> Media {
        feature("min-aspect-ratio", "\(width)/\(height)")
    }
    
    public static func maxAspectRatio(_ width: Int, _ height: Int) -> Media {
        feature("max-aspect-ratio", "\(width)/\(height)")
    }
    
    // Orientation
    public static func orientation(_ value: Orientation) -> Media {
        feature("orientation", value.rawValue)
    }
    
    // Color features
    public static func prefersColorScheme(_ value: ColorScheme) -> Media {
        feature("prefers-color-scheme", value.rawValue)
    }
    
    // Motion preferences
    public static func prefersReducedMotion(_ value: ReducedMotion = .reduce) -> Media {
        feature("prefers-reduced-motion", value.rawValue)
    }
    
    // Contrast preferences
    public static func prefersContrast(_ value: Contrast) -> Media {
        feature("prefers-contrast", value.rawValue)
    }
    
    // Reduced data
    public static func prefersReducedData(_ value: ReducedData = .reduce) -> Media {
        feature("prefers-reduced-data", value.rawValue)
    }
    
    // Hover capability
    public static func hover(_ value: HoverCapability) -> Media {
        feature("hover", value.rawValue)
    }
    
    public static func anyHover(_ value: HoverCapability) -> Media {
        feature("any-hover", value.rawValue)
    }
    
    // Pointer capabilities
    public static func pointer(_ value: PointerCapability) -> Media {
        feature("pointer", value.rawValue)
    }
    
    public static func anyPointer(_ value: PointerCapability) -> Media {
        feature("any-pointer", value.rawValue)
    }
    
    // Display mode
    public static func displayMode(_ value: DisplayMode) -> Media {
        feature("display-mode", value.rawValue)
    }
    
    // Resolution
    public static func resolution(_ value: Resolution) -> Media {
        feature("resolution", value)
    }
    
    public static func minResolution(_ value: Resolution) -> Media {
        feature("min-resolution", value)
    }
    
    public static func maxResolution(_ value: Resolution) -> Media {
        feature("max-resolution", value)
    }
    
    // Scripting
    public static func scripting(_ value: ScriptingState) -> Media {
        feature("scripting", value.rawValue)
    }
    
    // Update frequency
    public static func update(_ value: UpdateFrequency) -> Media {
        feature("update", value.rawValue)
    }
}

// MARK: - Media Feature Value Types

extension Media {
    /// Orientation values for media queries
    public enum Orientation: String, Hashable, Sendable {
        case portrait
        case landscape
    }
    
    /// Color scheme values for media queries
    public enum ColorScheme: String, Hashable, Sendable {
        case light
        case dark
    }
    
    /// Reduced motion preference values for media queries
    public enum ReducedMotion: String, Hashable, Sendable {
        case reduce
        case noPreference = "no-preference"
    }
    
    /// Contrast preference values for media queries
    public enum Contrast: String, Hashable, Sendable {
        case more
        case less
        case custom
        case noPreference = "no-preference"
    }
    
    /// Reduced data preference values for media queries
    public enum ReducedData: String, Hashable, Sendable {
        case reduce
        case noPreference = "no-preference"
    }
    
    /// Hover capability values for media queries
    public enum HoverCapability: String, Hashable, Sendable {
        case hover
        case none
    }
    
    /// Pointer capability values for media queries
    public enum PointerCapability: String, Hashable, Sendable {
        case none
        case coarse
        case fine
    }
    
    /// Display mode values for media queries
    public enum DisplayMode: String, Hashable, Sendable {
        case fullscreen
        case standalone
        case minimalUi = "minimal-ui"
        case browser
        case pictureInPicture = "picture-in-picture"
    }
    
    /// Scripting state values for media queries
    public enum ScriptingState: String, Hashable, Sendable {
        case enabled
        case initialOnly = "initial-only"
        case none
    }
    
    /// Update frequency values for media queries
    public enum UpdateFrequency: String, Hashable, Sendable {
        case none
        case slow
        case fast
    }
}

// MARK: - Operator Overloads

extension Media {
    /// Operator for combining media queries with the 'and' operator.
    ///
    /// Example:
    /// ```swift
    /// let query = Media.screen & Media.prefersColorScheme(.dark)
    /// ```
    public static func && (lhs: Media, rhs: Media) -> Media {
        lhs.and(rhs)
    }
    
    /// Operator for combining media queries with the 'or' operator (comma in CSS).
    ///
    /// Example:
    /// ```swift
    /// let query = Media.screen || Media.print
    /// ```
    public static func || (lhs: Media, rhs: Media) -> Media {
        lhs.or(rhs)
    }
    
    /// Operator for negating a media query.
    ///
    /// Example:
    /// ```swift
    /// let query = !Media.print // @media not print
    /// ```
    public static prefix func ! (query: Media) -> Media {
        query.not()
    }
}
