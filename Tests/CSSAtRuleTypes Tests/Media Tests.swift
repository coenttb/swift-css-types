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
    
    @Test("Direct feature methods create correct media queries")
    func testDirectFeatureMethods() {
        #expect(Media.width(.px(100)).rawValue == "@media (width: 100px)")
        #expect(Media.minWidth(.em(1.5)).rawValue == "@media (min-width: 1.5em)")
        #expect(Media.maxWidth(.percentage(80)).rawValue == "@media (max-width: 80%)")
        
        #expect(Media.height(.px(100)).rawValue == "@media (height: 100px)")
        #expect(Media.minHeight(.em(1.5)).rawValue == "@media (min-height: 1.5em)")
        #expect(Media.maxHeight(.percentage(80)).rawValue == "@media (max-height: 80%)")
        
        #expect(Media.aspectRatio(16, 9).rawValue == "@media (aspect-ratio: 16/9)")
        #expect(Media.minAspectRatio(1, 1).rawValue == "@media (min-aspect-ratio: 1/1)")
        #expect(Media.maxAspectRatio(21, 9).rawValue == "@media (max-aspect-ratio: 21/9)")
        
        #expect(Media.orientation(.portrait).rawValue == "@media (orientation: portrait)")
        #expect(Media.orientation(.landscape).rawValue == "@media (orientation: landscape)")
        
        #expect(Media.prefersColorScheme(.dark).rawValue == "@media (prefers-color-scheme: dark)")
        #expect(Media.prefersColorScheme(.light).rawValue == "@media (prefers-color-scheme: light)")
        
        #expect(Media.prefersReducedMotion().rawValue == "@media (prefers-reduced-motion: reduce)")
        #expect(Media.prefersReducedMotion(.noPreference).rawValue == "@media (prefers-reduced-motion: no-preference)")
        
        #expect(Media.prefersContrast(.more).rawValue == "@media (prefers-contrast: more)")
        #expect(Media.prefersContrast(.less).rawValue == "@media (prefers-contrast: less)")
        
        #expect(Media.resolution(Resolution.dpi(300)).rawValue == "@media (resolution: 300dpi)")
        #expect(Media.minResolution(Resolution.dppx(2)).rawValue == "@media (min-resolution: 2dppx)")
    }
    
    // MARK: - Logical Operator Tests
    
    @Test("AND operator combines media query correctly")
    func testAndOperator() {
        let media = Media.screen.and(Media.maxWidth(.px(500)))
        #expect(media.rawValue == "@media screen and (max-width: 500px)")
        
        let complexMedia = Media.screen
            .and(Media.minWidth(.px(300)))
            .and(Media.maxWidth(.px(800)))
            .and(Media.orientation(.landscape))
        
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
            .and(Media.maxWidth(.px(500)))
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
            .and(Media.maxWidth(.px(500)))
            .or(Media.print)
        
        #expect(
            complexMedia.rawValue == 
            "@media screen and (max-width: 500px), print"
        )
    }
    
    // MARK: - Operator Overload Tests
    
    @Test("& operator combines media query with feature correctly")
    func testAmpersandOperator() {
        let media = Media.screen && Media.maxWidth(.px(500))
        #expect(media.rawValue == "@media screen and (max-width: 500px)")
        
        let complexMedia = Media.screen 
            && Media.minWidth(.px(300))
            && Media.maxWidth(.px(800))
        
        #expect(
            complexMedia.rawValue == 
            "@media screen and (min-width: 300px) and (max-width: 800px)"
        )
    }
    
    @Test("|| operator combines media queries correctly with comma")
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
            .and(Media.minWidth(.px(768)))
            .and(Media.maxWidth(.px(1200)))
            .and(Media.orientation(.landscape))
            .and(Media.prefersReducedMotion())
        
        #expect(
            complexQuery.rawValue == 
            "@media screen and (min-width: 768px) and (max-width: 1200px) and (orientation: landscape) and (prefers-reduced-motion: reduce)"
        )
    }
    
    @Test("Complex media queries combine correctly with operators")
    func testComplexQueriesWithOperators() {
        let complexQueryWithOperators = Media.screen
            && Media.minWidth(.px(768))
            && Media.maxWidth(.px(1200))
            && Media.orientation(.landscape)
            && Media.prefersReducedMotion()
        
        #expect(
            complexQueryWithOperators.rawValue == 
            "@media screen and (min-width: 768px) and (max-width: 1200px) and (orientation: landscape) and (prefers-reduced-motion: reduce)"
        )
    }
    
    @Test("Combined OR and AND operators work correctly")
    func testCombinedOrAndOperators() {
        let combinedQuery = (Media.screen && Media.minWidth(.px(992)))
            || (Media.print && Media.orientation(.portrait))
        
        #expect(
            combinedQuery.rawValue == 
            "@media screen and (min-width: 992px), print and (orientation: portrait)"
        )
    }
    
    @Test("Combined NOT and AND operators work correctly")
    func testCombinedNotAndOperators() {
        let negatedQuery = !(Media.screen && Media.maxWidth(.px(600)))
        
        #expect(
            negatedQuery.rawValue == 
            "@media not screen and (max-width: 600px)"
        )
    }
}
