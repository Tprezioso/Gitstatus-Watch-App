//
//  ComplicationController.swift
//  GitStatusWatchApp WatchKit Extension
//
//  Created by Thomas Prezioso on 9/4/19.
//  Copyright © 2019 Thomas Prezioso. All rights reserved.
//

import ClockKit


class ComplicationController: NSObject, CLKComplicationDataSource {
    
    // MARK: - Timeline Configuration
    
    func getSupportedTimeTravelDirections(for complication: CLKComplication, withHandler handler: @escaping (CLKComplicationTimeTravelDirections) -> Void) {
        handler([.forward, .backward])
    }
    
    func getTimelineStartDate(for complication: CLKComplication, withHandler handler: @escaping (Date?) -> Void) {
        handler(nil)
    }
    
    func getTimelineEndDate(for complication: CLKComplication, withHandler handler: @escaping (Date?) -> Void) {
        handler(nil)
    }
    
    func getPrivacyBehavior(for complication: CLKComplication, withHandler handler: @escaping (CLKComplicationPrivacyBehavior) -> Void) {
        handler(.showOnLockScreen)
    }
    
    // MARK: - Timeline Population
    
    func getCurrentTimelineEntry(for complication: CLKComplication, withHandler handler: @escaping (CLKComplicationTimelineEntry?) -> Void) {
        // Call the handler with the current timeline entry

        if complication.family == .circularSmall {
            let template = CLKComplicationTemplateCircularSmallRingImage()
            guard let image = UIImage(named: "Complication/Circular") else { handler(nil); return}
            template.imageProvider = CLKImageProvider(onePieceImage: image)
            let timelineEntry = CLKComplicationTimelineEntry(date: Date(), complicationTemplate: template)
            handler(timelineEntry)
            
        } else if complication.family == .utilitarianSmall {
            let template = CLKComplicationTemplateUtilitarianSmallRingImage()
            guard let image = UIImage(named: "Complication/Utilitarian") else { handler(nil); return}
            template.imageProvider = CLKImageProvider(onePieceImage: image)
            let timelineEntry = CLKComplicationTimelineEntry(date: Date(), complicationTemplate: template)
            handler(timelineEntry)
            
        } else if complication.family == .modularSmall {
            let template = CLKComplicationTemplateModularSmallRingImage()
            guard let image = UIImage(named: "Complication/Modular") else { handler(nil); return}
            template.imageProvider = CLKImageProvider(onePieceImage: image)
            let timelineEntry = CLKComplicationTimelineEntry(date: Date(), complicationTemplate: template)
            handler(timelineEntry)
            
        } else if complication.family == .graphicCircular {
            let template = CLKComplicationTemplateGraphicCircularImage()
            guard let image = UIImage(named: "Complication/GraphicCircular") else { handler(nil); return}
            template.imageProvider = CLKFullColorImageProvider(fullColorImage: image)
            let timelineEntry = CLKComplicationTimelineEntry(date: Date(), complicationTemplate: template)
            handler(timelineEntry)
            
        } else if complication.family == .graphicCorner {
            let template = CLKComplicationTemplateGraphicCornerCircularImage()
            guard let image = UIImage(named: "GraphicCorner") else { handler(nil); return}
            template.imageProvider = CLKFullColorImageProvider(fullColorImage: image)
            let timelineEntry = CLKComplicationTimelineEntry(date: Date(), complicationTemplate: template)
            handler(timelineEntry)

        } else {
            handler(nil)
        }

    }
    
    func getTimelineEntries(for complication: CLKComplication, before date: Date, limit: Int, withHandler handler: @escaping ([CLKComplicationTimelineEntry]?) -> Void) {
        // Call the handler with the timeline entries prior to the given date
        handler(nil)
    }
    
    func getTimelineEntries(for complication: CLKComplication, after date: Date, limit: Int, withHandler handler: @escaping ([CLKComplicationTimelineEntry]?) -> Void) {
        // Call the handler with the timeline entries after to the given date
        handler(nil)
    }
    
    // MARK: - Placeholder Templates
    
    func getLocalizableSampleTemplate(for complication: CLKComplication, withHandler handler: @escaping (CLKComplicationTemplate?) -> Void) {
        // This method will be called once per supported complication, and the results will be cached
        handler(nil)
    }
    
}
