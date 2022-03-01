import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  String labelText;
  Function validationFun;
  TextEditingController controller;
  TextInputType textInputType;
  CustomTextfield(
      { this.labelText,
       this.validationFun,
       this.controller,
      this.textInputType = TextInputType.text});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10 , horizontal: 10),
      child: TextFormField(
        cursorColor: Colors.black,
        
        keyboardType: textInputType,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: controller,
        validator: (value) => validationFun(value),
      
        decoration: InputDecoration(
          labelStyle: TextStyle(color: Colors.black),
            label: Text(labelText),
           focusedBorder: UnderlineInputBorder(
                          borderSide: new BorderSide(color: Colors.black),
                        ),),
      ),
    );
  }
}

class pas extends StatefulWidget {
   String labelText;
   Function validationFun;
   TextEditingController controller;
   TextInputType textInputType;
  

pas(
      { this.labelText,
       this.validationFun,
       this.controller,
      this.textInputType = TextInputType.text});

  @override
  State<pas> createState() => _pasState();
}

class _pasState extends State<pas> {
  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        cursorColor: Colors.black,
        obscureText: obscure,
        keyboardType: widget.textInputType,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: widget.controller,
        validator: (value) => widget.validationFun(value),
      
        decoration: InputDecoration(
           suffixIcon: IconButton(
                          icon: Icon(
                            Icons.visibility,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            setState(() {
                              obscure = !obscure;
                            });
                          },
                        ),
          labelStyle: TextStyle(color: Colors.black , fontSize: 15),
            label: Text(widget.labelText),
           focusedBorder: UnderlineInputBorder(
                          borderSide: new BorderSide(color: Colors.black),
                        ),),
      ),
    );
  }
}