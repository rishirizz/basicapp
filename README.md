# basicapp

This is an app taking in account for absolute beginners in API requets.
It has two three screens which are login screen, home screen and the dashboard.
The api used for login is 'https://reqres.in/api/login'. The login data is stored in the shared preference so that the users don't have to login again unless they log out.
The second screen is the DashBoard screen which is just a UI having different widgets.
The third screen ie; the Home has two tabs, photos and posts and we are simply rendering the data from GET request in these two tabs.
The api used for these two tabs are 'https://jsonplaceholder.typicode.com/photos/' and 'https://jsonplaceholder.typicode.com/posts/' respectively.
I have used many third party packages which are listed below: 
  http: ^0.13.3
  crypto: ^3.0.1
  shared_preferences: ^2.0.7
  google_fonts: ^2.2.0
  transparent_image: ^2.0.0
  package_info_plus: ^1.3.1
 The app changes its widgets/UI according to the viewports. You can refer to the screenshots folder for the same.
 
 /*
 NOTE: THIS IS A RUDIMENTARY APP JUST FOR SHOWING DATA FETCHED FROM THE INTERNET. THE UI AND OTHER THINGS ARE NOT PRECISE.
 */
  
