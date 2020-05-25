import 'package:blocylogin/blocs/provider.dart';
import 'package:blocylogin/pages/home_page.dart';
import 'package:blocylogin/pages/login_page.dart';
import 'package:blocylogin/pages/producto_page.dart';
import 'package:blocylogin/pages/registro_page.dart';
import 'package:blocylogin/preferencias/prefs_usuario.dart';
import 'package:flutter/material.dart';
 
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = new PreferenciasUsuario();
   await prefs.initPrefs();
   runApp(MyApp());


} 
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final prefs = new PreferenciasUsuario();
    print(prefs.token);

    //widget que almacena informacion 
    return Provider(
      
      child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Login',
              initialRoute: 'login',
              routes: {
                'login': (BuildContext context) => LoginPage(),
                'home' : (BuildContext context) => HomePage(),
                'producto' : (BuildContext context) => ProductoPage(),
                'registro' : (BuildContext context) => RegistroPage(),

              },
              theme: ThemeData(primaryColor: Colors.deepPurple),
              )
    ,);
    
    
    
    // Stream<bool> get formValidStream => 
    // CombineLatestStream.combine2(emailStream, passwordStream, (e, p) => true);

    
  }
}