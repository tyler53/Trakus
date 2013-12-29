//
//  SChartCategoryAxis.h
//  SChart
//
//  Copyright 2011 Scott Logic Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SChartNumberRange;
@class SChartDataSeries;

/** 
 A SChartCategoryAxis is a subclass of SChartAxis designed to work with discrete data points with no linear correlation between values.
 
 For the purposes of ranges, each data point value for a category axis is represented by an index (generated by the order in which data points are added to the series - but removing duplicates). This determines order and can be used to set ranges.
 
 For example, for datapoint values @"June", @5 and @"Frog" passed to the chart in that order along a category axis: 
 <ol>
 <li>June is equivalent to 0. </li>
 <li>5    is equivalent to 1. </li>
 <li>Frog is equivalent to 2. </li>
 <li>The range of this data is 0 to 2. </li>
 <li>Setting a range of 0 to 1 would show June and 5, but not Frog. </li>
 </ol>
 
 The data point values are not sorted and do not need to be members of the same class - as long as they respond to the 'description' selector.<br>
 Each series linked to the Category Axis can only have one datapoint per Category. If a second data point is added with the same value, it will replace the first.

 Since one cannot interpolate between '5' and a 'Frog', or group 'June' and '5' into an encapsulating value, minor tick marks are disabled on Category Axes.<br>
 Major tick marks and labels, if enabled, will be shown for each datapoint.<br>
 Setting major or minor tick frequencies will have no effect.
 
 
 @available Standard
 @available Premium
 
 @sa ChartsUserGuide
 
 @sample Area
 @sample BarChart
 @sample ColumnChart
 @sample LineChart
 
 */
@interface SChartCategoryAxis : SChartAxis


#pragma mark - 
#pragma mark Initialization
/** @name Initializing a Category Axis */
/** Init a Category Axis with a number range representing the indices.
 
 The range is based upon the index number of each category where 0 is the first category and n is the nth category, in the order in which the data points are presented to the chart. 
 The index number of a category can be found from the array `categories` - which contains the actual set of categories. */
- (id)initWithRange:(SChartNumberRange *)range;


#pragma mark -
#pragma mark Categories
/** @name Accessing the Categories on the Axis */
/** An array containing all of the categories across all series linked to this axis.
 
 This array should not be replaced or manipulated, but it can be used to link data point values to integer values.<br>
 The `dataIndex` from the data source may not correspond to the index of the category.*/
@property (nonatomic, retain) NSMutableArray *categories;

@end
