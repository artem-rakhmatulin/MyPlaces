//
//  RATDetailViewController+UIImagePickerControllerDelegate.m
//  MyPlaces
//
//  Created by Artem Rakhmatulin on 25/09/2020.
//  Copyright © 2020 Rakhmatulin Artem Timurovich IP. All rights reserved.
//

#import "RATDetailViewController.h"
#import "RATDetailViewController+.h"
#import "RATPlace.h"
#import "RATImageStore.h"

@interface RATDetailViewController (UIImagePickerControllerDelegate) <UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@end

@implementation RATDetailViewController (UIImagePickerControllerDelegate)

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<UIImagePickerControllerInfoKey,id> *)info
{
    //Получаем выбранную картинку
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    //Сохраняем в словарь
    [[RATImageStore sharedStore] setImage:image forKey:self.place.uuid];
    //Помещаем на экран
    self.imageView.image = image;
    //Освобождаем imagePicker
    [self dismissViewControllerAnimated:YES completion:nil];
} //imagePickerController:didFinishPickingMediaWithInfo:

@end
