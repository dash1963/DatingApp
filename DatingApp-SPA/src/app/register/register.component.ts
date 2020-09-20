import { Component, EventEmitter, Input, OnInit, Output } from '@angular/core';
import { AuthService } from '../_services/auth.service';

@Component({
  selector: 'app-register',
  templateUrl: './register.component.html',
  styleUrls: ['./register.component.scss']
})
export class RegisterComponent implements OnInit {
  
  //
  // parent to child example @INPUT()   Parent: HOME    Child: REGISTER
  //
  //@Input() valuesFromHome: any;


  @Output() cancelregister = new EventEmitter();


  model: any = {};

  constructor( private authService: AuthService) { }

  ngOnInit() {
  }

  register()
  {
    this.authService.register(this.model).subscribe( () => {
      console.log('Registration successful!!');
    }, (error) => {
      console.log(error);
    })
  }

  cancel() {
    this.cancelregister.emit(false);
    console.log("Cancelled")
  }

}
