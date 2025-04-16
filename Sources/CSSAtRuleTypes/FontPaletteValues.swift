//@font-palette-values
//
//
//Baseline 2022
//NEWLY AVAILABLE
//
//
//
//The @font-palette-values CSS at-rule allows you to customize the default values of font-palette created by the font-maker.
//
//Syntax
//CSS
//Copy to Clipboard
//@font-palette-values --identifier {
//  font-family: Bixa;
//}
//.my-class {
//  font-palette: --identifier;
//}
//The <dashed-ident> is a user defined identifier, that while it looks like a CSS custom property behaves in a different way and is not wrapped in a CSS var() function.
//
//Descriptors
//base-palette
//Specifies the name or index of the base-palette, created by the font-maker, to use.
//
//font-family
//Specifies the name of the font family that this palette can be applied to. A font-family name is required for the @font-palette-values rule to be valid.
//
//override-colors
//Specifies the colors in the base palette to override.
//
//Formal syntax
//@font-palette-values =
//  @font-palette-values <dashed-ident> { <declaration-list> }
//
//Sources: CSS Fonts Module Level 4
//Examples
//Overriding colors in an existing palette
//This example shows how you can change some or all of the colors in a color font.
//
//HTML
//
//HTML
//Copy to Clipboard
//Play
//<p>default colors</p>
//<p class="alternate">alternate colors</p>
//CSS
//
//CSS
//Copy to Clipboard
//Play
//@import url(https://fonts.googleapis.com/css2?family=Bungee+Spice);
//p {
//  font-family: "Bungee Spice";
//  font-size: 2rem;
//}
//@font-palette-values --Alternate {
//  font-family: "Bungee Spice";
//  override-colors:
//    0 #00ffbb,
//    1 #007744;
//}
//.alternate {
//  font-palette: --Alternate;
//}
//Result
//
//When overriding colors of the normal or base-palette at index 0 you do not need to declare which base-palette to use. This should only be done when overriding a different base-palette. If you are overriding all the colors then there is also no need to specify the base-palette to use.
//
