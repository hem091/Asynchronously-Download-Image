//
//  HemsUrlToImage.h
//  Hicon
//
//  Created by Hemant Sharma on 25/06/2013.
//  Copyright (c) 2013 Hemant Sharma. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IconDownloader.h"
@protocol HemsUrlToImageDelegate;
@interface HemsUrlToImage : NSObject <IconDownloaderDelegate>
{
    id <HemsUrlToImageDelegate> delegate;
    NSMutableDictionary *imageDownloadsinProgress;
    NSMutableArray *mainURLArray;
}
@property (nonatomic, assign) id <HemsUrlToImageDelegate> delegate;
@property (nonatomic, assign) BOOL isNoCaching,isSmallSize;
@property (nonatomic, assign) NSString *identifier;
-(void)setImageArrayFromUrlArray:(NSArray*)urlArray;
- (void)cancelDownload;
@end

@protocol HemsUrlToImageDelegate
-(void)urlToImageConverted:(NSArray*)convertedArray withIdentifier:(NSString*)identifier andIndex:(NSInteger)indexNumber;
@end