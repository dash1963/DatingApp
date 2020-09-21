import { Component, EventEmitter, Input, OnInit, Output } from '@angular/core';
import { AuthService } from '../_services/auth.service';
import { AlertifyService } from '../_services/alertify.service';

@Component({
  selector: 'app-register',
  templateUrl: './register.component.html',
  styleUrls: ['./register.component.scss']
})
export class RegisterComponent implements OnInit {
  
  //
  // parent to child example @INPUT()   Parent: HOME    Child: REGISTER
  //
  // @Input() valuesFromHome: any;


  @Output() cancelregister = new EventEmitter();


  model: any = {};

  constructor( private authService: AuthService, private alertify: AlertifyService) { }

  ngOnInit() {
  }

  register()
  {
    this.authService.register(this.model).subscribe( () => {
      this.alertify.success('Registration successful!!');
    }, (error) => {
      this.alertify.error(error);
    });
  }

  cancel() {
    this.cancelregister.emit(false);
    this.alertify.message('Cancelled')
  }

}
