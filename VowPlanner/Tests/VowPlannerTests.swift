import XCTest

class VowPlannerTests: XCTestCase {
    func testTimelineGeneration() {
        let service = TimelineService.shared
        let items = service.generateTimeline(weddingDate: Date(), planningStage: "engaged")
        XCTAssertEqual(items.count, 12)
    }
}