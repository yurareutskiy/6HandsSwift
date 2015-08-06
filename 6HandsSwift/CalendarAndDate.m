//
//  CalendarAndDate.m
//  MESISchedule
//
//  Created by Reutskiy Jury on 05.05.15.
//  Copyright (c) 2015 MESI. All rights reserved.
//

#import "CalendarAndDate.h"

@implementation CalendarAndDate {
    NSUserDefaults *user;
}

- (void) setFirst:(NSString*)dateStr {
    
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"d:L:yy"];
    NSDate *date = [dateFormat dateFromString:dateStr];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"w";
    NSString *week = [formatter stringFromDate:date];
    NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
    f.numberStyle = NSNumberFormatterDecimalStyle;
    NSNumber *numberOfWeek = [f numberFromString:week];
    user = [NSUserDefaults standardUserDefaults];
    [user setObject:numberOfWeek forKey:@"firstWeek"];
    
    NSLog(@"week = %@", week);
    
}

- (NSNumber*) determineCurrentNumberOfWeek {
    NSDate *current = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"w";
    NSString *week = [formatter stringFromDate:current];
    NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
    f.numberStyle = NSNumberFormatterDecimalStyle;
    NSNumber *numberOfWeek = [f numberFromString:week];
    return numberOfWeek;
}

- (BOOL) checkUpOrDown:(NSNumber*) week {
    user = [NSUserDefaults standardUserDefaults];
    int firstWeek = [[user objectForKey:@"firstWeek"] intValue];
    int otherWeek = [week intValue];
    int parity = firstWeek % 2;
    if ((otherWeek % 2) == parity) {
        return 0;
    }
    return 1;
}

- (BOOL) isUpWeekWithCurrentDate {
    NSNumber *numberOfWeek = [self determineCurrentNumberOfWeek];
    BOOL parity = [self checkUpOrDown:numberOfWeek];
    // 0 is UP week, 1 is Down week
    return parity;
}

- (int) determineCurrentDayOfWeek {
    NSDate *current = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"e";
    NSString *day = [formatter stringFromDate:current];
    NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
    f.numberStyle = NSNumberFormatterDecimalStyle;
    int dayOfWeek = [day intValue];
    return dayOfWeek - 1;
}

- (int)determineCurrentDayWithTwoWeeks {
    int day = [self determineCurrentDayOfWeek];
    int week = [self isUpWeekWithCurrentDate];
    return (7 * week + day);
}

- (NSString *)getStringWithDateWith:(int) offset {
    NSDate *anotherDay = [[NSDate date] dateByAddingTimeInterval:86400 * offset];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @", d MMMM";
    NSString *dayString = [formatter stringFromDate:anotherDay];
    return dayString;
}

- (NSMutableArray*)fillDates {
    NSMutableArray *arrayWithDays = [NSMutableArray arrayWithObjects:@"Понедельник", @"Вторник", @"Среда", @"Четверг", @"Пятница", @"Суббота", @"Воскресенье", @"Понедельник", @"Вторник", @"Среда", @"Четверг", @"Пятница", @"Суббота", @"Воскресенье", nil];
//    NSLog(@"array %@ with %d objects", arrayWithDays, arrayWithDays.count);
    int index = [self determineCurrentDayWithTwoWeeks];
    for (int i = 0; i < 14; i++) {
        arrayWithDays[i] = [arrayWithDays[i] stringByAppendingString:[self getStringWithDateWith:i - index]];
    }
    
    [arrayWithDays removeObject:arrayWithDays[6]];
    [arrayWithDays removeObject:arrayWithDays[12]];
    return arrayWithDays;
    
}

@end
