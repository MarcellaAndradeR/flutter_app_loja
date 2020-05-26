import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {


  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Criar Conta"),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(hintText: "Nome Completo"),
              // ignore: missing_return
              validator: (text){
                if(text.isEmpty) return "Nome Inválido!";
              },
            ),
            SizedBox(height: 16.0,),
            TextFormField(
              decoration: InputDecoration(hintText: "E-mail"),
              obscureText: true,
              // ignore: missing_return
              validator: (text){
                if(text.isEmpty || !text.contains("@")) return "E-mail inválido!";
              },
            ),
            SizedBox(height: 16.0,),
            TextFormField(
              decoration: InputDecoration(hintText: "Senha"),
              obscureText: true,
              // ignore: missing_return
              validator: (text){
                if(text.isEmpty || text.length < 6) return "Senha inválida!";
              },
            ),
            SizedBox(height: 16.0,),
            TextFormField(
              decoration: InputDecoration(hintText: "Endereço"),
              obscureText: true,
              // ignore: missing_return
              validator: (text){
                if(text.isEmpty) return "Endereço inválido!";
              },
            ),
            SizedBox(height: 16.0,),
            RaisedButton(
              child: Text("Criar Conta",
                style: TextStyle(fontSize: 18.0),),
              textColor: Colors.white,
              color: Theme.of(context).primaryColor,
              onPressed: (){
                if(_formKey.currentState.validate()){

                }

              },
            ),

          ],

        ),
      ),

    );
  }
}

