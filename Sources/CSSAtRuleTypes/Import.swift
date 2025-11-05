import CSSTypeTypes
import Foundation

/// Represents a CSS @import at-rule.
///
/// The @import CSS at-rule is used to import style rules from other stylesheets.
/// It must be defined at the top of the stylesheet, before any other at-rule
/// (except @charset and @layer) and style declarations.
///
/// Examples:
/// ```swift
/// // Simple import
/// Import("custom.css")
///
/// // Import with a URL
/// Import.url("https://example.com/styles/main.css")
///
/// // Import with a single media query
/// Import("print.css").media(Media.print)
///
/// // Import with multiple media queries
/// Import("responsive.css").media([Media.screen, Media.maxWidth(.px(768))])
///
/// // Import with supports condition
/// Import("grid.css").supports("display: grid")
///
/// // Import into a layer
/// Import("theme.css").layer("utilities")
///
/// // Complex import with all conditions
/// Import("responsive.css")
///     .layer("layout")
///     .supports("display: flex")
///     .media([Media.screen, Media.maxWidth(.px(500))])
/// ```
public struct Import: AtRule {
    public static let identifier: String = "import"

    public var rawValue: String
    private var url: String
    private var conditions: [String] = []
    private var layerName: String?

    public init(rawValue: String) {
        self.rawValue = rawValue

        // Extract URL from rawValue - simplified implementation
        if let urlRange = rawValue.range(of: "@import\\s+([^\\s;]+)", options: .regularExpression),
            let matches = rawValue[urlRange].range(
                of: "\\s+([^\\s;]+)",
                options: .regularExpression
            )
        {
            self.url = String(rawValue[matches]).trimmingCharacters(in: .whitespacesAndNewlines)
        } else {
            self.url = ""
        }
    }

    /// Creates an import rule with the specified path.
    ///
    /// - Parameter path: The path to the CSS file to import.
    public init(_ path: String) {
        self.url = "\"\(path)\""
        self.rawValue = "@import \(self.url);"
    }

    /// Creates an import rule with the specified URL.
    ///
    /// - Parameter url: The URL to the CSS file to import.
    /// - Returns: An Import instance.
    public static func url(_ url: String) -> Import {
        let formattedUrl = "url(\"\(url)\")"
        var importRule = Import(rawValue: "@import \(formattedUrl);")
        importRule.url = formattedUrl
        return importRule
    }

    /// Updates the raw value based on the current conditions.
    private mutating func updateRawValue() {
        var parts: [String] = ["@import", url]

        if let layerName = layerName {
            if layerName.isEmpty {
                parts.append("layer")
            } else {
                parts.append("layer(\(layerName))")
            }
        }

        parts.append(contentsOf: conditions)
        rawValue = parts.joined(separator: " ") + ";"
    }

    /// Sets the media query condition.
    ///
    /// - Parameter media: The media query to apply.
    /// - Returns: An updated Import instance.
    public func media(_ media: Media) -> Import {
        var importRule = self
        // Extract just the media query part (without "@media ")
        let mediaQueryString = String(media.rawValue.dropFirst(7))
        importRule.conditions = importRule.conditions.filter {
            !$0.starts(with: "screen") && !$0.starts(with: "print") && !$0.starts(with: "all")
        }
        importRule.conditions.append(mediaQueryString)
        importRule.updateRawValue()
        return importRule
    }

    /// Sets the media query conditions using multiple media queries.
    ///
    /// - Parameter medias: An array of media queries to apply.
    /// - Returns: An updated Import instance.
    public func media(_ medias: [Media]) -> Import {
        var importRule = self
        let mediaQueryStrings = medias.map { String($0.rawValue.dropFirst(7)) }
        let mediaQueryString = mediaQueryStrings.joined(separator: ", ")
        importRule.conditions = importRule.conditions.filter {
            !$0.starts(with: "screen") && !$0.starts(with: "print") && !$0.starts(with: "all")
        }
        importRule.conditions.append(mediaQueryString)
        importRule.updateRawValue()
        return importRule
    }

    /// Sets the supports condition.
    ///
    /// - Parameter condition: The condition to check for support.
    /// - Returns: An updated Import instance.
    public func supports(_ condition: String) -> Import {
        var importRule = self
        importRule.conditions = importRule.conditions.filter { !$0.starts(with: "supports") }
        importRule.conditions.append("supports(\(condition))")
        importRule.updateRawValue()
        return importRule
    }

    /// Sets the layer to import into.
    ///
    /// - Parameter name: The name of the layer. Pass an empty string for an anonymous layer.
    /// - Returns: An updated Import instance.
    public func layer(_ name: String = "") -> Import {
        var importRule = self
        importRule.layerName = name
        importRule.updateRawValue()
        return importRule
    }
}
