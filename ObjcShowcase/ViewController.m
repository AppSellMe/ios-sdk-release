//
//  ViewController.m
//  ObjcShowcase
//
//  Created by Mikhail Igonin on 23.07.2018.
//  Copyright © 2018 AppSell. All rights reserved.
//

#import "ViewController.h"
#import <AppSellSDK/AppSellSDK.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)initSDK:(id)sender {
    [AppSellSDK initAppWith:@"bdad341b-53a1-4cf6-ad8e-7acfcd769e0d" completion:^(NSError * _Nullable error) {
        [self showMessageForError:error];
    }];
}

- (IBAction)sendEvent:(id)sender {
    [AppSellSDK sendEvent:@"registration" completion:^(NSError * _Nullable error) {
        [self showMessageForError:error];
    }];
}

- (void)showMessageForError: (nullable NSError*)error {
    NSString* message = nil;
    
    if (error == nil) {
        message = @"Success";
    } else {
        message = [NSString stringWithFormat:@"Error: %@", error.localizedDescription];
    }
    
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"" message:message preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil]];
    [self presentViewController:alert animated:YES completion:nil];
}

@end
