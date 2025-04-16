import CSSAtRuleTypes
import Testing
import CSSTypeTypes

@Suite("Media Tests")
struct MediaTests {
    
    // MARK: - Basic Initialization Tests
    
    @Test("Media type initialization creates correct raw values")
    func testMediaTypeInitialization() {
        let mediaScreen = Media(.screen)
        #expect(mediaScreen.rawValue == "@media screen")
        
        let mediaPrint = Media(.print)
        #expect(mediaPrint.rawValue == "@media print")
        
        let mediaAll = Media(.all)
        #expect(mediaAll.rawValue == "@media all")
    }
    
    @Test("Static media type properties create correct raw values")
    func testStaticMediaTypeProperties() {
        #expect(Media.screen.rawValue == "@media screen")
        #expect(Media.print.rawValue == "@media print")
        #expect(Media.all.rawValue == "@media all")
    }
    
    @Test("Media feature initialization creates correct raw values")
    func testMediaFeatureInitialization() {
        let mediaFeature = Media(Media.Feature.maxWidth(.px(500)))
        #expect(mediaFeature.rawValue == "@media (max-width: 500px)")
    }
    
    // MARK: - Media Feature Tests
    
    @Test("Width-related features have correct raw values")
    func testWidthFeatures() {
        #expect(Media.Feature.width(.px(100)).rawValue == "width: 100px")
        #expect(Media.Feature.minWidth(.em(1.5)).rawValue == "min-width: 1.5em")
        #expect(Media.Feature.maxWidth(.percentage(80)).rawValue == "max-width: 80%")
    }
    
    @Test("Height-related features have correct raw values")
    func testHeightFeatures() {
        #expect(Media.Feature.height(.px(100)).rawValue == "height: 100px")
        #expect(Media.Feature.minHeight(.em(1.5)).rawValue == "min-height: 1.5em")
        #expect(Media.Feature.maxHeight(.percentage(80)).rawValue == "max-height: 80%")
    }
    
    @Test("Aspect ratio features have correct raw values")
    func testAspectRatioFeatures() {
        #expect(Media.Feature.aspectRatio(16, 9).rawValue == "aspect-ratio: 16/9")
        #expect(Media.Feature.minAspectRatio(1, 1).rawValue == "min-aspect-ratio: 1/1")
        #expect(Media.Feature.maxAspectRatio(21, 9).rawValue == "max-aspect-ratio: 21/9")
    }
    
    @Test("Orientation feature has correct raw values")
    func testOrientationFeature() {
        #expect(Media.Feature.orientation(.portrait).rawValue == "orientation: portrait")
        #expect(Media.Feature.orientation(.landscape).rawValue == "orientation: landscape")
    }
    
    @Test("Color scheme feature has correct raw values")
    func testColorSchemeFeature() {
        #expect(Media.Feature.prefersColorScheme(.dark).rawValue == "prefers-color-scheme: dark")
        #expect(Media.Feature.prefersColorScheme(.light).rawValue == "prefers-color-scheme: light")
    }
    
    @Test("Motion preference feature has correct raw values")
    func testMotionFeature() {
        #expect(Media.Feature.prefersReducedMotion().rawValue == "prefers-reduced-motion: reduce")
        #expect(Media.Feature.prefersReducedMotion(.noPreference).rawValue == "prefers-reduced-motion: no-preference")
    }
    
    @Test("Contrast preference feature has correct raw values")
    func testContrastFeature() {
        #expect(Media.Feature.prefersContrast(.more).rawValue == "prefers-contrast: more")
        #expect(Media.Feature.prefersContrast(.less).rawValue == "prefers-contrast: less")
        #expect(Media.Feature.prefersContrast(.custom).rawValue == "prefers-contrast: custom")
        #expect(Media.Feature.prefersContrast(.noPreference).rawValue == "prefers-contrast: no-preference")
    }
    
    @Test("Resolution feature has correct raw values")
    func testResolutionFeature() {
        #expect(Media.Feature.resolution(Resolution.dpi(300)).rawValue == "resolution: 300dpi")
        #expect(Media.Feature.minResolution(Resolution.dppx(2)).rawValue == "min-resolution: 2dppx")
        #expect(Media.Feature.maxResolution(Resolution.dpi(96)).rawValue == "max-resolution: 96dpi")
    }
    
    // MARK: - Logical Operator Tests
    
    @Test("AND operator combines media query correctly")
    func testAndOperator() {
        let media = Media.screen.and(Media.Feature.maxWidth(.px(500)))
        #expect(media.rawValue == "@media screen and (max-width: 500px)")
        
        let complexMedia = Media.screen
            .and(Media.Feature.minWidth(.px(300)))
            .and(Media.Feature.maxWidth(.px(800)))
            .and(Media.Feature.orientation(.landscape))
        
        #expect(
            complexMedia.rawValue == 
            "@media screen and (min-width: 300px) and (max-width: 800px) and (orientation: landscape)"
        )
    }
    
    @Test("NOT operator negates media query correctly")
    func testNotOperator() {
        let media = Media.print.not()
        #expect(media.rawValue == "@media not print")
        
        let complexMedia = Media.screen
            .and(Media.Feature.maxWidth(.px(500)))
            .not()
        
        #expect(
            complexMedia.rawValue == 
            "@media not screen and (max-width: 500px)"
        )
    }
    
    @Test("ONLY operator applies correctly to media query")
    func testOnlyOperator() {
        let media = Media.screen.only()
        #expect(media.rawValue == "@media only screen")
    }
    
    @Test("OR operator combines media queries correctly with comma")
    func testOrOperator() {
        let media = Media.screen.or(Media.print)
        #expect(media.rawValue == "@media screen, print")
        
        let complexMedia = Media.screen
            .and(Media.Feature.maxWidth(.px(500)))
            .or(Media.print)
        
        #expect(
            complexMedia.rawValue == 
            "@media screen and (max-width: 500px), print"
        )
    }
    
    // MARK: - Operator Overload Tests
    
    @Test("& operator combines media query with feature correctly")
    func testAmpersandOperator() {
        let media = Media.screen & Media.Feature.maxWidth(.px(500))
        #expect(media.rawValue == "@media screen and (max-width: 500px)")
        
        let complexMedia = Media.screen 
            & Media.Feature.minWidth(.px(300)) 
            & Media.Feature.maxWidth(.px(800))
        
        #expect(
            complexMedia.rawValue == 
            "@media screen and (min-width: 300px) and (max-width: 800px)"
        )
    }
    
    @Test("| operator combines media queries correctly with comma")
    func testPipeOperator() {
        let media = Media.screen || Media.print
        #expect(media.rawValue == "@media screen, print")
    }
    
    @Test("! operator negates media query correctly")
    func testExclamationOperator() {
        let media = !Media.print
        #expect(media.rawValue == "@media not print")
    }
    
    // MARK: - Complex Media Query Tests
    
    @Test("Complex media queries combine correctly with functions")
    func testComplexQueriesWithFunctions() {
        let complexQuery = Media.screen
            .and(Media.Feature.minWidth(.px(768)))
            .and(Media.Feature.maxWidth(.px(1200)))
            .and(Media.Feature.orientation(.landscape))
            .and(Media.Feature.prefersReducedMotion())
        
        #expect(
            complexQuery.rawValue == 
            "@media screen and (min-width: 768px) and (max-width: 1200px) and (orientation: landscape) and (prefers-reduced-motion: reduce)"
        )
    }
    
    @Test("Complex media queries combine correctly with operators")
    func testComplexQueriesWithOperators() {
        let complexQueryWithOperators = Media.screen
            & Media.Feature.minWidth(.px(768))
            & Media.Feature.maxWidth(.px(1200))
            & Media.Feature.orientation(.landscape)
            & Media.Feature.prefersReducedMotion()
        
        #expect(
            complexQueryWithOperators.rawValue == 
            "@media screen and (min-width: 768px) and (max-width: 1200px) and (orientation: landscape) and (prefers-reduced-motion: reduce)"
        )
    }
    
    @Test("Combined OR and AND operators work correctly")
    func testCombinedOrAndOperators() {
        let combinedQuery = (Media.screen & Media.Feature.minWidth(.px(992))) 
            || (Media.print & Media.Feature.orientation(.portrait))
        
        #expect(
            combinedQuery.rawValue == 
            "@media screen and (min-width: 992px), print and (orientation: portrait)"
        )
    }
    
    @Test("Combined NOT and AND operators work correctly")
    func testCombinedNotAndOperators() {
        let negatedQuery = !(Media.screen & Media.Feature.maxWidth(.px(600)))
        
        #expect(
            negatedQuery.rawValue == 
            "@media not screen and (max-width: 600px)"
        )
    }
}
