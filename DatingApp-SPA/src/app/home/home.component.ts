import { HttpClient } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.scss']
})
export class HomeComponent implements OnInit {

  registerMode: boolean = false;
  //
  // parent to child example @INPUT()
  //
  // values: any;


  constructor( private http: HttpClient) { }

  ngOnInit() {
    //
    // parent to child example @INPUT()   Parent:  HOME    Child: REGISTER
    //
    //  this,this.getValues();
  }

  registerToggle()
  {
    this.registerMode = true;
  }

  //
  // parent to child example @INPUT()
  //
  // getValues() {
  //   this.http.get("http://localhost:5000/api/values").subscribe(response => {
  //        this.values = response;
  //   }, error => {
  //     console.log(error);
  //   });
  // }

  cancelRegisterMode(registerMode: boolean)
  {
    this.registerMode = registerMode;
  }

}
