import 'package:seeker/HomePages.dart';
import 'package:seeker/screens/authenticate/authenticate.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seeker/models/user.dart';
import 'package:seeker/screens/home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);
    print(user);

    // return home or authenticate
  if(user == null){
    return Authenticate();
  }else{
    return Home();
  }
      
    
  }
}