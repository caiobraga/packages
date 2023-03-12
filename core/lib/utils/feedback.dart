import 'package:flutter/material.dart';

class FeedBack{
 final BuildContext context;
  FeedBack({required this.context});

   showsimpleDialog(BuildContext context,{ String message = '', String title = ''}) {
     showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: new Text(title),
          content: new Text(message),
          actions: <Widget>[
            // define os botões na base do dialogo
            new OutlinedButton(
              child: new Text("Fechar"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ));
      
    
  }
  

  sucessDialog() async {
  await showDialog<String>(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text("Sucesso"),
      content: const Icon(Icons.check),
      actions: [
        
        TextButton(
          child: const Text("OK"),
          onPressed: () => Navigator.pop(context, "User canceled dialog"),
        ),
      ],
    ),
  );
  }

  LoadingDialog() async {
  await showDialog<String>(
    context: context,
    builder: (context) =>  AlertDialog(
      title:  Text("Carregando"),
      content:  Container(
        width: 50,
        height: 50,
        child:  CircularProgressIndicator(),),
      actions: [
        
       
      ],
    ),
  );
  }

  void fechaDialog(){
    Navigator.pop(context);
  }

  errorDialog(String message) async {
  await showDialog<String>(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text("Erro"),
      content: SizedBox(
        height: 200,
        child: Column(children: [
        
        Icon(Icons.close),
        Text(message)
      ],) ,) ,
      actions: [
        
        TextButton(
          child: const Text("OK"),
          onPressed: () => Navigator.pop(context, "User canceled dialog"),
        ),
      ],
    ),
  );
  }
}