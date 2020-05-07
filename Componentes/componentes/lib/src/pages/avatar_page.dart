import 'package:flutter/material.dart';


class AvatarPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title:  Text('Avatar Page'),
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 12.0),
           child:CircleAvatar(
            backgroundImage: NetworkImage('https://www.mautorland.com/wp-content/uploads/2019/07/AB00D53A-B3B7-48C4-94BF-63A04169E776-e1564085000577.jpeg'),
            
          ),
          ),

          Container(
            margin: EdgeInsets.only(right: 10.0),
            child:CircleAvatar( 
            child: Text('sl'),
            backgroundColor: Colors.red,
          )
          )
        ],
        ),
        body: Center(
          child: FadeInImage(placeholder: AssetImage('assets/original.gif'), image: NetworkImage('https://www.mautorland.com/wp-content/uploads/2019/07/AB00D53A-B3B7-48C4-94BF-63A04169E776-e1564085000577.jpeg'))
        ),

    );
    
    
    
  }


}