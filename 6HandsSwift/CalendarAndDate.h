//
//  CalendarAndDate.h
//  MESISchedule
//
//  Created by Reutskiy Jury on 05.05.15.
//  Copyright (c) 2015 MESI. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalendarAndDate : NSObject

@property (strong, nonatomic) NSDate *originDate;

- (void) setFirst:(NSString*)dateStr; // set first date of studing in format string "dd:mm:yy"

- (int)determineCurrentDayWithTwoWeeks;
- (int)determineCurrentDayOfWeek;
- (NSMutableArray*)fillDates;
- (NSNumber*) determineCurrentNumberOfWeek;
- (BOOL) isUpWeekWithCurrentDate;
@end
