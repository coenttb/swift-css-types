//
// ScrollbarColor.swift


import CSSTypeTypes

/// The `scrollbar-color` CSS property sets the color of the scrollbar track and thumb.
///
/// The track refers to the background of the scrollbar, which is generally fixed regardless of the scrolling position.
/// 
/// The thumb refers to the moving part of the scrollbar, which usually floats on top of the track.
/// 
/// When the scrollbar-color value is set on the document's root element, the values are applied to the viewport scrollbars.
///
/// ```css
/// scrollbar-color: auto;
/// scrollbar-color: rebeccapurple green; /* thumb color, track color */
/// ```
public enum ScrollbarColor: Property {
    public static let property: String = "scrollbar-color"
    
    /// Default platform rendering for the scrollbar
    case auto
    
    /// Applies the first color to the scrollbar thumb, the second to the scrollbar track
    case colors(thumb: Color, track: Color)
    
    /// Global CSS value
    case global(CSSTypeTypes.Global)
    
    public var description: String {
        switch self {
        case .auto:
            return "auto"
        case .colors(let thumb, let track):
            return "\(thumb.description) \(track.description)"
        case .global(let global):
            return global.description
        }
    }

    
    /// Creates a ScrollbarColor with named colors for thumb and track
    ///
    /// - Parameters:
    ///   - thumb: The named color for the scrollbar thumb
    ///   - track: The named color for the scrollbar track
    /// - Returns: A ScrollbarColor with the specified named colors
    public static func named(thumb: NamedColor, track: NamedColor) -> Self {
        .colors(thumb: .named(thumb), track: .named(track))
    }
    
    /// Creates a ScrollbarColor with hex color strings for thumb and track
    ///
    /// - Parameters:
    ///   - thumb: The hex color string for the scrollbar thumb
    ///   - track: The hex color string for the scrollbar track
    /// - Returns: A ScrollbarColor with the specified hex colors
    public static func hex(thumb: String, track: String) -> Self {
        .colors(thumb: .hex(thumb), track: .hex(track))
    }
    
    /// Creates a ScrollbarColor with RGB values for thumb and track
    ///
    /// - Parameters:
    ///   - thumbR: The red component for the thumb (0-255)
    ///   - thumbG: The green component for the thumb (0-255)
    ///   - thumbB: The blue component for the thumb (0-255)
    ///   - trackR: The red component for the track (0-255)
    ///   - trackG: The green component for the track (0-255)
    ///   - trackB: The blue component for the track (0-255)
    /// - Returns: A ScrollbarColor with the specified RGB colors
    public static func rgb(thumbR: Int, thumbG: Int, thumbB: Int, trackR: Int, trackG: Int, trackB: Int) -> Self {
        .colors(
            thumb: .rgb(thumbR, thumbG, thumbB),
            track: .rgb(trackR, trackG, trackB)
        )
    }
}
