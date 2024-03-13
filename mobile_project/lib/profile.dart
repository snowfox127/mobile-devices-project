import 'package:flutter/material.dart';
class Profile{

  String firstName;
  String lastName;
  String email;
  String password;
  String secretWord;
  String address;
  String phoneNumber;
  String postalCode;
  String imageurl = '';
  Image? image;

  Profile(this.firstName,this.lastName, this.email,this.password,this.secretWord, this.address,this.postalCode,this.phoneNumber,);

  bool checkImage(){
    if(image == null){return false;}
    return true;
  }

}