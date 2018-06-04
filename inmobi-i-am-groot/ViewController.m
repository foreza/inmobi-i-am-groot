//
//  ViewController.m
//  inmobi-i-am-groot
//
//  Created by Jason C on 6/4/18.
//  Copyright © 2018 Jason C. All rights reserved.
//

@import InMobiSDK.IMBanner;
@import InMobiSDK.IMBannerDelegate;
@import InMobiSDK.IMInterstitial;
@import InMobiSDK.IMInterstitialDelegate;

#ifndef INMOBI_BANNER_PLACEMENT
#define INMOBI_BANNER_PLACEMENT     1447912324502
#endif

#ifndef INMOBI_INTERSTITIAL_PLACEMENT
#define INMOBI_INTERSTITIAL_PLACEMENT   1446377525790
#endif

#import "ViewController.h"


@interface ViewController () <IMBannerDelegate, IMInterstitialDelegate>

@property (nonatomic, strong) IMBanner* banner;                 // Make a banner object
@property (nonatomic, strong) IMInterstitial* interstitial;     // Make an interstitial object

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.banner = [[IMBanner alloc] initWithFrame:CGRectMake((self.view.frame.size.width - 320)/2, self.view.frame.size.height-70, 320, 50) placementId:INMOBI_BANNER_PLACEMENT];

    //Optional: set a delegate to be notified if the banner is loaded/failed etc.
    self.banner.delegate = self;

    [self.banner load];

    [self.view addSubview:self.banner];
    
     // Load interstitial on start
    
    
    self.interstitial = [[IMInterstitial alloc] initWithPlacementId:INMOBI_INTERSTITIAL_PLACEMENT delegate:self];
    [self.interstitial load];
    [self.interstitial showFromViewController:self];
    // [self.interstitial showFromViewController:self withAnimation:kIMInterstitialAnimationTypeCoverVertical];
    
    
    NSLog(@"View loaded");

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/**
 * Notifies the delegate that the banner has finished loading
 */
-(void)bannerDidFinishLoading:(IMBanner*)banner {
    NSLog(@"InMobi Banner finished loading");
}
/**
 * Notifies the delegate that the banner has failed to load with some error.
 */
-(void)banner:(IMBanner*)banner didFailToLoadWithError:(IMRequestStatus*)error {
    NSLog(@"InMobi Banner failed to load with error %@", error);
}
/**
 * Notifies the delegate that the banner was interacted with.
 */
-(void)banner:(IMBanner*)banner didInteractWithParams:(NSDictionary*)params {
    NSLog(@"InMobi Banner did interact with params : %@", params);
}
/**
 * Notifies the delegate that the user would be taken out of the application context.
 */
-(void)userWillLeaveApplicationFromBanner:(IMBanner*)banner {
    NSLog(@"User will leave application from InMobi Banner");
}
/**
 * Notifies the delegate that the banner would be presenting a full screen content.
 */
-(void)bannerWillPresentScreen:(IMBanner*)banner {
    NSLog(@"InMobi Banner will present a screen");
}
/**
 * Notifies the delegate that the banner has finished presenting screen.
 */
-(void)bannerDidPresentScreen:(IMBanner*)banner {
    NSLog(@"InMobi Banner finished presenting a screen");
}
/**
 * Notifies the delegate that the banner will start dismissing the presented screen.
 */
-(void)bannerWillDismissScreen:(IMBanner*)banner {
    NSLog(@"InMobi Banner will dismiss a presented screen");
}
/**
 * Notifies the delegate that the banner has dismissed the presented screen.
 */
-(void)bannerDidDismissScreen:(IMBanner*)banner {
    NSLog(@"InMobi Banner dismissed a presented screen");
}
/**
 * Notifies the delegate that the user has completed the action to be incentivised with.
 */
-(void)banner:(IMBanner*)banner rewardActionCompletedWithRewards:(NSDictionary*)rewards {
    NSLog(@"InMobi Banner rewarded action completed. Rewards : %@", rewards);
}



/*Indicates that the interstitial is ready to be shown */
- (void)interstitialDidFinishLoading:(IMInterstitial *)interstitial {
    NSLog(@"interstitialDidFinishLoading");
    if (interstitial.isReady) {
        [interstitial showFromViewController:self];
    }
}
/* Indicates that the interstitial has failed to receive an ad. */
- (void)interstitial:(IMInterstitial *)interstitial didFailToLoadWithError:(IMRequestStatus *)error {
    NSLog(@"Interstitial failed to load ad");
    NSLog(@"Error : %@",error.description);
}
/* Indicates that the interstitial has failed to present itself. */
- (void)interstitial:(IMInterstitial *)interstitial didFailToPresentWithError:(IMRequestStatus *)error {
    NSLog(@"Interstitial didFailToPresentWithError");
    NSLog(@"Error : %@",error.description);
}
/* indicates that the interstitial is going to present itself. */
- (void)interstitialWillPresent:(IMInterstitial *)interstitial {
    NSLog(@"interstitialWillPresent");
}
/* Indicates that the interstitial has presented itself */
- (void)interstitialDidPresent:(IMInterstitial *)interstitial {
    NSLog(@"interstitialDidPresent");
}
/* Indicates that the interstitial is going to dismiss itself. */
- (void)interstitialWillDismiss:(IMInterstitial *)interstitial {
    NSLog(@"interstitialWillDismiss");
}
/* Indicates that the interstitial has dismissed itself. */
- (void)interstitialDidDismiss:(IMInterstitial *)interstitial {
    NSLog(@"interstitialDidDismiss");
}
/* Indicates that the user will leave the app. */
- (void)userWillLeaveApplicationFromInterstitial:(IMInterstitial *)interstitial {
    NSLog(@"userWillLeaveApplicationFromInterstitial");
}
/* interstitial:didInteractWithParams: Indicates that the interstitial was interacted with. */
- (void)interstitial:(IMInterstitial *)interstitial didInteractWithParams:(NSDictionary *)params {
    NSLog(@"InterstitialDidInteractWithParams");
}
/* Not used for direct integration. Notifies the delegate that the ad server has returned an ad but assets are not yet available. */
- (void)interstitialDidReceiveAd:(IMInterstitial *)interstitial {
    NSLog(@"interstitialDidReceiveAd");
}




- (void)encodeWithCoder:(nonnull NSCoder *)aCoder {
    // Do something

}

- (void)traitCollectionDidChange:(nullable UITraitCollection *)previousTraitCollection {
    // Do something

}

- (void)preferredContentSizeDidChangeForChildContentContainer:(nonnull id<UIContentContainer>)container {
    // Do something

}

- (CGSize)sizeForChildContentContainer:(nonnull id<UIContentContainer>)container withParentContainerSize:(CGSize)parentSize {
    CGSize c=CGSizeMake(100, 100);
    return c;
}

- (void)systemLayoutFittingSizeDidChangeForChildContentContainer:(nonnull id<UIContentContainer>)container {
    // Do something
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(nonnull id<UIViewControllerTransitionCoordinator>)coordinator {
    // Do something

}

- (void)willTransitionToTraitCollection:(nonnull UITraitCollection *)newCollection withTransitionCoordinator:(nonnull id<UIViewControllerTransitionCoordinator>)coordinator {
    // Do something

}

- (void)didUpdateFocusInContext:(nonnull UIFocusUpdateContext *)context withAnimationCoordinator:(nonnull UIFocusAnimationCoordinator *)coordinator {
    // Do something
}

- (void)setNeedsFocusUpdate {
    // Do something
}

- (BOOL)shouldUpdateFocusInContext:(nonnull UIFocusUpdateContext *)context {
    return true;
}

- (void)updateFocusIfNeeded {
    // Do something
}

-(void)dealloc {
    self.banner.delegate = nil;
}



@end
