import Foundation
import CSSTypeTypes

/// The CSS appearance property is used to display UI elements with platform-specific
/// styling, based on the operating system's theme.
///
/// Before standardization, this property allowed elements to be shown as widgets, such as
/// buttons or check boxes. It was considered a misfeature and authors are encouraged to
/// use only standard keywords now.
///
/// Example:
/// ```swift
/// .appearance(.none)                // appearance: none
/// .appearance(.auto)                // appearance: auto
/// .appearance(.menulistButton)      // appearance: menulist-button
/// .appearance(.textfield)           // appearance: textfield
/// ```
///
/// - SeeAlso: [MDN Web Docs on appearance](https://developer.mozilla.org/en-US/docs/Web/CSS/appearance)
public enum Appearance: Property {
    
    public static let property: String = "appearance"
    
    /// Force standardized primitive appearance
    case none
    
    /// Acts as none on elements with no special styling
    case auto
    
    /// Special compatibility value menulist-button
    case menulistButton
    
    /// Special compatibility value textfield
    case textfield
    
    /// Compatibility auto values
    case compat(CompatAuto)
    
    /// Global values
    case global(CSSTypeTypes.Global)
}

/// Compatibility auto values for the appearance property
public enum CompatAuto: String, Sendable, Hashable, CaseIterable {
    /// Button appearance
    case button
    
    /// Checkbox appearance
    case checkbox
    
    /// Listbox appearance
    case listbox
    
    /// Menulist appearance
    case menulist
    
    /// Meter appearance
    case meter
    
    /// Progress bar appearance
    case progressBar = "progress-bar"
    
    /// Push button appearance
    case pushButton = "push-button"
    
    /// Radio button appearance
    case radio
    
    /// Search field appearance
    case searchfield
    
    /// Horizontal slider appearance
    case sliderHorizontal = "slider-horizontal"
    
    /// Square button appearance
    case squareButton = "square-button"
    
    /// Textarea appearance
    case textarea
}

/// CSS Output conversion
extension Appearance: CustomStringConvertible {
    /// Converts the appearance to its CSS string representation
    public var description: String {
        switch self {
        case .none:
            return "none"
        case .auto:
            return "auto"
        case .menulistButton:
            return "menulist-button"
        case .textfield:
            return "textfield"
        case .compat(let compat):
            return compat.rawValue
        case .global(let global):
            return global.description
        }
    }
}
