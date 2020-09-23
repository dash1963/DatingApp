import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';

import { HttpClientModule } from '@angular/common/http';
import { TabsModule } from 'ngx-bootstrap/tabs';
import { BsDropdownModule} from 'ngx-bootstrap/dropdown';
import { FormsModule } from '@angular/forms';
import { RouterModule } from '@angular/router';
import { JwtModule } from '@auth0/angular-jwt';

import { AppComponent } from './app.component';
import { NavComponent } from './nav/nav.component';
import { AuthService } from './_services/auth.service';
import { HomeComponent } from './home/home.component';
import { RegisterComponent } from './register/register.component';
import { ErrorInterceptorProvider } from './_services/error.interceptor';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';

import { MemberDetailResolver  } from '../app/_resolvers/member-detail.resolver';
import { MemberListResolver } from '../app/_resolvers/member-list.resolver';
import {  MemberEditResolver } from '../app/_resolvers/member-edit.resolver';
import { PrevetUnsavedChanges } from '../app/_guards/prevet-unsaved-changes.guard';


import { MemberListComponent } from '../app/members/member-list/member-list.component';
import { MemberCardComponent } from './members/member-card/member-card.component';
import { MemberDetailComponent } from './members/member-detail/member-detail.component';
import { MemberEditComponent } from './members/member-edit/member-edit.component';

import { ListsComponent } from './lists/lists.component';
import { MessagesComponent } from './messages/messages.component';
import { appRoutes } from './routes';

import { NgxGalleryModule } from '@kolkov/ngx-gallery';



// export function tokenGetter() {
//   return  localStorage.getItem('token');
// }

@NgModule({
  declarations: [
      AppComponent,
      NavComponent,
      HomeComponent,
      RegisterComponent,
      MemberListComponent,
      ListsComponent,
      MessagesComponent,
      HomeComponent,
      MemberCardComponent,
      MemberDetailComponent,
      MemberEditComponent
   ],
  imports: [
    BrowserModule,
    HttpClientModule,
    FormsModule,
    BrowserAnimationsModule,
    TabsModule.forRoot(),
    BsDropdownModule.forRoot(),
    RouterModule.forRoot(appRoutes),

    NgxGalleryModule,

    JwtModule.forRoot({
      config: {
        tokenGetter: () => { return localStorage.getItem('token'); },
        allowedDomains: ['localhost:5000'],
        disallowedRoutes: ['localhost:5000/api/auth']
      }
    })
  ],
  providers: [
    AuthService,
    ErrorInterceptorProvider,
    MemberDetailResolver,
    MemberListResolver,
    MemberEditResolver,
    PrevetUnsavedChanges 
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }
