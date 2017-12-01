//
//  annotationDataModel.m
//  Tut1
//
//  Created by Joshua Acanthe [el16ja] on 01/12/2017.
//  Copyright © 2017 Joshua Acanthe [el16ja]. All rights reserved.
//

#import "annotationDataModel.h"

@implementation annotationDataModel

static annotationDataModel *_annotationShare;

- (id) init {
    if (self = [super init]) {
        self.annotations = [NSMutableArray array];
    }
    return self;
}

+ (annotationDataModel  *) annotationShare;
{
    if (!_annotationShare) {
        _annotationShare = [[annotationDataModel alloc] init];
        _annotationShare.annotations = [NSMutableArray array];
    }
    return _annotationShare;
}

- (void) storeAnnotationInArraywithIndex: (NSInteger) index
                         withCoordinates: (CLLocationCoordinate2D) coords withRadius: (CLLocationDistance) radius WithOverlay:(MKCircle *)overlay{
    Annotation *annotationDetails = [[Annotation alloc]init];
    annotationDetails.index = self.annotations.count;
    annotationDetails.coords = coords;
    annotationDetails.radius = radius;
    annotationDetails.overlay = overlay;
    NSLog(@"*NSLOG> annotation stored: %ld",(long)annotationDetails.index);
}

@end
