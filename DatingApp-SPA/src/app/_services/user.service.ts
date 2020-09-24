import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { environment } from '../../environments/environment';
import { User } from '../_models/user';

// const httpOptions = {
//   headers: new HttpHeaders({
//     Authorization: 'Bearer ' + localStorage.getItem('token')
//   })
// };


@Injectable({
  providedIn: 'root'
})
export class UserService {
  baseUrl = environment.apiUrl;

constructor( private http: HttpClient) { }

getUsers(): Observable<User[]>
{
  //return this.http.get<User[]>(this.baseUrl + 'users', httpOptions);
  
  return this.http.get<User[]>(this.baseUrl + 'users');
}

getUser(id): Observable<User>
{
 //return this.http.get<User>(this.baseUrl + 'users/' + id, httpOptions);

 return this.http.get<User>(this.baseUrl + 'users/' + id);
}

updateUser(id: number, user: User)
{
    return this.http.put(this.baseUrl + 'users/' + id, user);
}


setMainPhoto(userId: number, id: number)
{
  return this.http.post(this.baseUrl + 'users/' + userId + '/photos/' + id + '/setmain' , {});
}

// baseUrl: http://localhost:5000/api/
// pluse 'users/userId/photos/photoId'
deletePhoto(userId: number, id: number)
{
  return this.http.delete(this.baseUrl + 'users/' + userId + '/photos/' + id);
}

}
