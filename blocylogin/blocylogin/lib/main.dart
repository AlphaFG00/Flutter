import 'package:blocylogin/blocs/provider.dart';
import 'package:blocylogin/pages/home_page.dart';
import 'package:blocylogin/pages/login_page.dart';
import 'package:flutter/material.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {




    return Provider(
      
      child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Login',
              initialRoute: 'login',
              routes: {
                'login': (BuildContext context) => LoginPage(),
                'home' : (BuildContext context) => HomePage(),


              },
              theme: ThemeData(primaryColor: Colors.deepPurple),
              )
    ,);
    
    
    
    // Stream<bool> get formValidStream => 
    // CombineLatestStream.combine2(emailStream, passwordStream, (e, p) => true);

    
  }
}