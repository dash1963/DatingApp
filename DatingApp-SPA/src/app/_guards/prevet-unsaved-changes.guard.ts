import { Injectable } from '@angular/core';
import { CanDeactivate } from '@angular/router';
import { MemberEditComponent } from '../members/member-edit/member-edit.component';


@Injectable()

export class PrevetUnsavedChanges implements CanDeactivate<MemberEditComponent> {
    canDeactivate(component: MemberEditComponent)  {
       if (component.editForm.dirty) {
           return confirm('Any unsaved changes will be lost!. \nAre you sure you want to continue?');
       }
       return true;
    }

}