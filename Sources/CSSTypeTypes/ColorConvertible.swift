//
//  File.swift
//  swift-css
//
//  Created by Coen ten Thije Boonkkamp on 01/04/2025.
//

import Foundation

public protocol ColorConvertible {
  static func color(_ color: Color) -> Self
}

extension ColorConvertible {

  /// Creates a color from RGB values
  ///
  /// - Parameters:
  ///   - red: The red component (0-255)
  ///   - green: The green component (0-255)
  ///   - blue: The blue component (0-255)
  /// - Returns: A Color in RGB format
  public static func rgb(_ red: Int, _ green: Int, _ blue: Int) -> Self {
    return .color(
      .rgb(
        red: min(255, max(0, red)),
        green: min(255, max(0, green)),
        blue: min(255, max(0, blue))
      )
    )
  }

  /// Creates a color from RGBA values
  ///
  /// - Parameters:
  ///   - red: The red component (0-255)
  ///   - green: The green component (0-255)
  ///   - blue: The blue component (0-255)
  ///   - alpha: The alpha component (0.0-1.0)
  /// - Returns: A Color in RGBA format
  public static func rgba(_ red: Int, _ green: Int, _ blue: Int, _ alpha: Double) -> Self {
    return .color(
      .rgba(
        red: min(255, max(0, red)),
        green: min(255, max(0, green)),
        blue: min(255, max(0, blue)),
        alpha: min(1.0, max(0.0, alpha))
      )
    )
  }

  /// Creates a color from HSL values
  ///
  /// - Parameters:
  ///   - hue: The hue component (0-360)
  ///   - saturation: The saturation component (0-100)
  ///   - lightness: The lightness component (0-100)
  /// - Returns: A Color in HSL format
  public static func hsl(_ hue: Hue, _ saturation: Double, _ lightness: Double) -> Self {
    return .color(
      .hsl(
        hue: hue,
        saturation: min(100, max(0, saturation)),
        lightness: min(100, max(0, lightness))
      )
    )
  }

  /// Creates a color from HSLA values
  ///
  /// - Parameters:
  ///   - hue: The hue component (0-360)
  ///   - saturation: The saturation component (0-100)
  ///   - lightness: The lightness component (0-100)
  ///   - alpha: The alpha component (0.0-1.0)
  /// - Returns: A Color in HSLA format
  public static func hsla(
    _ hue: Hue,
    _ saturation: Double,
    _ lightness: Double,
    _ alpha: Double
  ) -> Self {
    return .color(
      .hsla(
        hue: hue,
        saturation: min(100, max(0, saturation)),
        lightness: min(100, max(0, lightness)),
        alpha: min(1.0, max(0.0, alpha))
      )
    )
  }

  /// Creates a color from HWB values
  ///
  /// - Parameters:
  ///   - hue: The hue component (0-360)
  ///   - whiteness: The whiteness component (0-100)
  ///   - blackness: The blackness component (0-100)
  /// - Returns: A Color in HWB format
  public static func hwb(_ hue: Hue, _ whiteness: Double, _ blackness: Double) -> Self {
    return .color(
      .hwb(
        hue: hue,
        whiteness: min(100, max(0, whiteness)),
        blackness: min(100, max(0, blackness))
      )
    )
  }

  /// Creates a color from LAB values
  ///
  /// - Parameters:
  ///   - hue: The hue component (0-360)
  ///   - whiteness: The whiteness component (0-100)
  ///   - blackness: The blackness component (0-100)
  /// - Returns: A Color in HWB format
  public static func lab(_ lightness: Double, _ aAxis: Double, _ bAxis: Double) -> Self {
    return .color(
      .lab(
        lightness: min(100, max(0, lightness)),
        aAxis: aAxis,
        bAxis: bAxis
      )
    )
  }

  /// Creates a color from LAB values
  ///
  /// - Parameters:
  ///   - hue: The hue component (0-360)
  ///   - whiteness: The whiteness component (0-100)
  ///   - blackness: The blackness component (0-100)
  /// - Returns: A Color in HWB format
  public static func lch(
    _ lightness: Double,
    _ chroma: Double,
    _ hue: Double
  ) -> Self {
    return .color(
      .lch(
        lightness: lightness,
        chroma: chroma,
        hue: hue
      )
    )
  }

  /// Creates a color from Oklch values
  ///
  /// - Parameters:
  ///   - lightness: The perceptual lightness (0-1)
  ///   - chroma: The chroma (colorfulness)
  ///   - hue: The hue angle (0-360)
  /// - Returns: A Color in Oklch format
  public static func oklch(_ lightness: Double, _ chroma: Double, _ hue: Double) -> Self {
    return .color(
      .oklch(
        lightness: min(1.0, max(0.0, lightness)),
        chroma: max(0, chroma),
        hue: hue.truncatingRemainder(dividingBy: 360)
      )
    )
  }

  /// Creates a color from Oklch values
  ///
  /// - Parameters:
  ///   - lightness: The perceptual lightness (0-1)
  ///   - chroma: The chroma (colorfulness)
  ///   - hue: The hue angle (0-360)
  /// - Returns: A Color in Oklch format
  public static func oklab(_ lightness: Double, _ aAxis: Double, _ bAxis: Double) -> Self {
    return .color(
      .oklab(
        lightness: lightness,
        aAxis: aAxis,
        bAxis: bAxis
      )
    )
  }

  public static func hex(_ value: String) -> Self {
    return .color(
      .hex(value)
    )
  }

  public static func named(_ value: NamedColor) -> Self {
    return .color(
      .named(value)
    )
  }
}

extension ColorConvertible {
  /// Creates a color from RGB values with labeled parameters
  ///
  /// - Parameters:
  ///   - red: The red component (0-255)
  ///   - green: The green component (0-255)
  ///   - blue: The blue component (0-255)
  /// - Returns: A color in RGB format
  public static func rgb(red: Int, green: Int, blue: Int) -> Self {
    .rgb(red, green, blue)
  }

  /// Creates a color from RGBA values with labeled parameters
  ///
  /// - Parameters:
  ///   - red: The red component (0-255)
  ///   - green: The green component (0-255)
  ///   - blue: The blue component (0-255)
  ///   - alpha: The alpha component (0.0-1.0)
  /// - Returns: A color in RGBA format
  public static func rgba(red: Int, green: Int, blue: Int, alpha: Double) -> Self {
    .rgba(red, green, blue, alpha)
  }

  /// Creates a color from HSL values with labeled parameters
  ///
  /// - Parameters:
  ///   - hue: The hue component (0-360)
  ///   - saturation: The saturation component (0-100)
  ///   - lightness: The lightness component (0-100)
  /// - Returns: A color in HSL format
  public static func hsl(hue: Hue, saturation: Double, lightness: Double) -> Self {
    .hsl(hue, saturation, lightness)
  }

  /// Creates a color from HSLA values with labeled parameters
  ///
  /// - Parameters:
  ///   - hue: The hue component (0-360)
  ///   - saturation: The saturation component (0-100)
  ///   - lightness: The lightness component (0-100)
  ///   - alpha: The alpha component (0.0-1.0)
  /// - Returns: A color in HSLA format
  public static func hsla(hue: Hue, saturation: Double, lightness: Double, alpha: Double) -> Self {
    .hsla(hue, saturation, lightness, alpha)
  }

  /// Creates a color from HWB values with labeled parameters
  ///
  /// - Parameters:
  ///   - hue: The hue component (0-360)
  ///   - whiteness: The whiteness component (0-100)
  ///   - blackness: The blackness component (0-100)
  /// - Returns: A color in HWB format
  public static func hwb(hue: Hue, whiteness: Double, blackness: Double) -> Self {
    .hwb(hue, whiteness, blackness)
  }

  /// Creates a color from LAB values with labeled parameters
  ///
  /// - Parameters:
  ///   - lightness: The lightness component (0-100)
  ///   - aAxis: The a-axis component
  ///   - bAxis: The b-axis component
  /// - Returns: A color in LAB format
  public static func lab(lightness: Double, aAxis: Double, bAxis: Double) -> Self {
    .lab(lightness, aAxis, bAxis)
  }

  /// Creates a color from LCH values with labeled parameters
  ///
  /// - Parameters:
  ///   - lightness: The lightness component (0-100)
  ///   - chroma: The chroma component
  ///   - hue: The hue component (0-360)
  /// - Returns: A color in LCH format
  public static func lch(lightness: Double, chroma: Double, hue: Double) -> Self {
    .lch(lightness, chroma, hue)
  }

  /// Creates a color from Oklab values with labeled parameters
  ///
  /// - Parameters:
  ///   - lightness: The lightness component (0-1)
  ///   - aAxis: The a-axis component
  ///   - bAxis: The b-axis component
  /// - Returns: A color in Oklab format
  public static func oklab(lightness: Double, aAxis: Double, bAxis: Double) -> Self {
    .oklab(lightness, aAxis, bAxis)
  }

  /// Creates a color from Oklch values with labeled parameters
  ///
  /// - Parameters:
  ///   - lightness: The lightness component (0-1)
  ///   - chroma: The chroma component
  ///   - hue: The hue component (0-360)
  /// - Returns: A color in Oklch format
  public static func oklch(lightness: Double, chroma: Double, hue: Double) -> Self {
    .oklch(lightness, chroma, hue)
  }
}

// Basic colors (CSS Level 1)

extension ColorConvertible {
  public static var black: Self { .color(.named(.black)) }
  public static var silver: Self { .color(.named(.silver)) }
  public static var gray: Self { .color(.named(.gray)) }
  public static var white: Self { .color(.named(.white)) }
  public static var maroon: Self { .color(.named(.maroon)) }
  public static var red: Self { .color(.named(.red)) }
  public static var purple: Self { .color(.named(.purple)) }
  public static var fuchsia: Self { .color(.named(.fuchsia)) }
  public static var green: Self { .color(.named(.green)) }
  public static var lime: Self { .color(.named(.lime)) }
  public static var olive: Self { .color(.named(.olive)) }
  public static var yellow: Self { .color(.named(.yellow)) }
  public static var navy: Self { .color(.named(.navy)) }
  public static var blue: Self { .color(.named(.blue)) }
  public static var teal: Self { .color(.named(.teal)) }
  public static var aqua: Self { .color(.named(.aqua)) }
  public static var orange: Self { .color(.named(.orange)) }
  public static var rebeccapurple: Self { .color(.named(.rebeccapurple)) }
  public static var aliceblue: Self { .color(.named(.aliceblue)) }
  public static var antiquewhite: Self { .color(.named(.antiquewhite)) }
  public static var aquamarine: Self { .color(.named(.aquamarine)) }
  public static var azure: Self { .color(.named(.azure)) }
  public static var beige: Self { .color(.named(.beige)) }
  public static var bisque: Self { .color(.named(.bisque)) }
  public static var blanchedalmond: Self { .color(.named(.blanchedalmond)) }
  public static var blueviolet: Self { .color(.named(.blueviolet)) }
  public static var brown: Self { .color(.named(.brown)) }
  public static var burlywood: Self { .color(.named(.burlywood)) }
  public static var cadetblue: Self { .color(.named(.cadetblue)) }
  public static var chartreuse: Self { .color(.named(.chartreuse)) }
  public static var chocolate: Self { .color(.named(.chocolate)) }
  public static var coral: Self { .color(.named(.coral)) }
  public static var cornflowerblue: Self { .color(.named(.cornflowerblue)) }
  public static var cornsilk: Self { .color(.named(.cornsilk)) }
  public static var crimson: Self { .color(.named(.crimson)) }
  public static var cyan: Self { .color(.named(.cyan)) }
  public static var darkblue: Self { .color(.named(.darkblue)) }
  public static var darkcyan: Self { .color(.named(.darkcyan)) }
  public static var darkgoldenrod: Self { .color(.named(.darkgoldenrod)) }
  public static var darkgray: Self { .color(.named(.darkgray)) }
  public static var darkgreen: Self { .color(.named(.darkgreen)) }
  public static var darkgrey: Self { .color(.named(.darkgrey)) }
  public static var darkkhaki: Self { .color(.named(.darkkhaki)) }
  public static var darkmagenta: Self { .color(.named(.darkmagenta)) }
  public static var darkolivegreen: Self { .color(.named(.darkolivegreen)) }
  public static var darkorange: Self { .color(.named(.darkorange)) }
  public static var darkorchid: Self { .color(.named(.darkorchid)) }
  public static var darkred: Self { .color(.named(.darkred)) }
  public static var darksalmon: Self { .color(.named(.darksalmon)) }
  public static var darkseagreen: Self { .color(.named(.darkseagreen)) }
  public static var darkslateblue: Self { .color(.named(.darkslateblue)) }
  public static var darkslategray: Self { .color(.named(.darkslategray)) }
  public static var darkslategrey: Self { .color(.named(.darkslategrey)) }
  public static var darkturquoise: Self { .color(.named(.darkturquoise)) }
  public static var darkviolet: Self { .color(.named(.darkviolet)) }
  public static var deeppink: Self { .color(.named(.deeppink)) }
  public static var deepskyblue: Self { .color(.named(.deepskyblue)) }
  public static var dimgray: Self { .color(.named(.dimgray)) }
  public static var dimgrey: Self { .color(.named(.dimgrey)) }
  public static var dodgerblue: Self { .color(.named(.dodgerblue)) }
  public static var firebrick: Self { .color(.named(.firebrick)) }
  public static var floralwhite: Self { .color(.named(.floralwhite)) }
  public static var forestgreen: Self { .color(.named(.forestgreen)) }
  public static var gainsboro: Self { .color(.named(.gainsboro)) }
  public static var ghostwhite: Self { .color(.named(.ghostwhite)) }
  public static var gold: Self { .color(.named(.gold)) }
  public static var goldenrod: Self { .color(.named(.goldenrod)) }
  public static var greenyellow: Self { .color(.named(.greenyellow)) }
  public static var grey: Self { .color(.named(.grey)) }
  public static var honeydew: Self { .color(.named(.honeydew)) }
  public static var hotpink: Self { .color(.named(.hotpink)) }
  public static var indianred: Self { .color(.named(.indianred)) }
  public static var indigo: Self { .color(.named(.indigo)) }
  public static var ivory: Self { .color(.named(.ivory)) }
  public static var khaki: Self { .color(.named(.khaki)) }
  public static var lavender: Self { .color(.named(.lavender)) }
  public static var lavenderblush: Self { .color(.named(.lavenderblush)) }
  public static var lawngreen: Self { .color(.named(.lawngreen)) }
  public static var lemonchiffon: Self { .color(.named(.lemonchiffon)) }
  public static var lightblue: Self { .color(.named(.lightblue)) }
  public static var lightcoral: Self { .color(.named(.lightcoral)) }
  public static var lightcyan: Self { .color(.named(.lightcyan)) }
  public static var lightgoldenrodyellow: Self { .color(.named(.lightgoldenrodyellow)) }
  public static var lightgray: Self { .color(.named(.lightgray)) }
  public static var lightgreen: Self { .color(.named(.lightgreen)) }
  public static var lightgrey: Self { .color(.named(.lightgrey)) }
  public static var lightpink: Self { .color(.named(.lightpink)) }
  public static var lightsalmon: Self { .color(.named(.lightsalmon)) }
  public static var lightseagreen: Self { .color(.named(.lightseagreen)) }
  public static var lightskyblue: Self { .color(.named(.lightskyblue)) }
  public static var lightslategray: Self { .color(.named(.lightslategray)) }
  public static var lightslategrey: Self { .color(.named(.lightslategrey)) }
  public static var lightsteelblue: Self { .color(.named(.lightsteelblue)) }
  public static var lightyellow: Self { .color(.named(.lightyellow)) }
  public static var limegreen: Self { .color(.named(.limegreen)) }
  public static var linen: Self { .color(.named(.linen)) }
  public static var magenta: Self { .color(.named(.magenta)) }
  public static var mediumaquamarine: Self { .color(.named(.mediumaquamarine)) }
  public static var mediumblue: Self { .color(.named(.mediumblue)) }
  public static var mediumorchid: Self { .color(.named(.mediumorchid)) }
  public static var mediumpurple: Self { .color(.named(.mediumpurple)) }
  public static var mediumseagreen: Self { .color(.named(.mediumseagreen)) }
  public static var mediumslateblue: Self { .color(.named(.mediumslateblue)) }
  public static var mediumspringgreen: Self { .color(.named(.mediumspringgreen)) }
  public static var mediumturquoise: Self { .color(.named(.mediumturquoise)) }
  public static var mediumvioletred: Self { .color(.named(.mediumvioletred)) }
  public static var midnightblue: Self { .color(.named(.midnightblue)) }
  public static var mintcream: Self { .color(.named(.mintcream)) }
  public static var mistyrose: Self { .color(.named(.mistyrose)) }
  public static var moccasin: Self { .color(.named(.moccasin)) }
  public static var navajowhite: Self { .color(.named(.navajowhite)) }
  public static var oldlace: Self { .color(.named(.oldlace)) }
  public static var olivedrab: Self { .color(.named(.olivedrab)) }
  public static var orangered: Self { .color(.named(.orangered)) }
  public static var orchid: Self { .color(.named(.orchid)) }
  public static var palegoldenrod: Self { .color(.named(.palegoldenrod)) }
  public static var palegreen: Self { .color(.named(.palegreen)) }
  public static var paleturquoise: Self { .color(.named(.paleturquoise)) }
  public static var palevioletred: Self { .color(.named(.palevioletred)) }
  public static var papayawhip: Self { .color(.named(.papayawhip)) }
  public static var peachpuff: Self { .color(.named(.peachpuff)) }
  public static var peru: Self { .color(.named(.peru)) }
  public static var pink: Self { .color(.named(.pink)) }
  public static var plum: Self { .color(.named(.plum)) }
  public static var powderblue: Self { .color(.named(.powderblue)) }
  public static var rosybrown: Self { .color(.named(.rosybrown)) }
  public static var royalblue: Self { .color(.named(.royalblue)) }
  public static var saddlebrown: Self { .color(.named(.saddlebrown)) }
  public static var salmon: Self { .color(.named(.salmon)) }
  public static var sandybrown: Self { .color(.named(.sandybrown)) }
  public static var seagreen: Self { .color(.named(.seagreen)) }
  public static var seashell: Self { .color(.named(.seashell)) }
  public static var sienna: Self { .color(.named(.sienna)) }
  public static var skyblue: Self { .color(.named(.skyblue)) }
  public static var slateblue: Self { .color(.named(.slateblue)) }
  public static var slategray: Self { .color(.named(.slategray)) }
  public static var slategrey: Self { .color(.named(.slategrey)) }
  public static var snow: Self { .color(.named(.snow)) }
  public static var springgreen: Self { .color(.named(.springgreen)) }
  public static var steelblue: Self { .color(.named(.steelblue)) }
  public static var tan: Self { .color(.named(.tan)) }
  public static var thistle: Self { .color(.named(.thistle)) }
  public static var tomato: Self { .color(.named(.tomato)) }
  public static var turquoise: Self { .color(.named(.turquoise)) }
  public static var violet: Self { .color(.named(.violet)) }
  public static var wheat: Self { .color(.named(.wheat)) }
  public static var whitesmoke: Self { .color(.named(.whitesmoke)) }
  public static var yellowgreen: Self { .color(.named(.yellowgreen)) }
  public static var transparent: Self { .color(.named(.transparent)) }
  public static var currentColor: Self { .color(.named(.currentColor)) }
}
