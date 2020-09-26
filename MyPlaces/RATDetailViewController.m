//
//  RATDetailViewController.m
//  Homepwner
//
//  Created by Artem Rakhmatulin on 21/09/2020.
//  Copyright © 2020 Rakhmatulin Artem Timurovich IP. All rights reserved.
//

#import "RATDetailViewController.h"
#import "RATDetailViewController+.h"
#import "RATPlace.h"
#import "RATImageStore.h"


@implementation RATDetailViewController

#pragma mark - View life cycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.nameField.text = self.place.name;
    self.noteField.text = self.place.note;
    static NSDateFormatter *dateFormatter = nil;
    if (!dateFormatter) {
        dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.dateStyle = NSDateFormatterMediumStyle;
        dateFormatter.timeStyle = NSDateFormatterNoStyle;
    }
    self.dateLabel.text = [dateFormatter stringFromDate:self.place.dateCreated];
    self.imageView.image =[[RATImageStore sharedStore] imageForKey:self.place.uuid];
} //viewDidLoad

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.view endEditing:YES];
    self.place.name = self.nameField.text;
    self.place.note = self.noteField.text;
} //viewWillDisappear:

#pragma mark - IBActions
- (IBAction)takePicture:(id)sender
{
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    //Если у устройста есть камера, то делаем фото, в противном случае - используем библиотеку фото.
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
        imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    else
        imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    imagePicker.delegate = self;
    [self presentViewController:imagePicker animated:true completion:nil];
} //takePicture:

- (IBAction)backgroundTapped:(UIView *)sender
{
    [sender endEditing:YES];
} //backgroundTapped:

#pragma mark -
- (void)setPlace:(RATPlace *)item
{
    self->_place = item;
    self.navigationItem.title = self->_place.name;
} //setItem:

@end
