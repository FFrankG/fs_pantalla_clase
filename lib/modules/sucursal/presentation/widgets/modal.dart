import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

void showColorPicker(BuildContext context,List<Color> availableColors,ValueChanged<Color> changeColor){
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
    title: Text(style: TextStyle(fontSize: 17,fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,color: Theme.of(context).primaryColor,decoration: TextDecoration.none),"Escoje un color!"),
    content: SingleChildScrollView(
     
      child: BlockPicker(
        availableColors: availableColors,
        pickerColor: Theme.of(context).colorScheme.primary,
        onColorChanged: (changeColor),
      ),
    ),
    actions: <Widget>[
      ElevatedButton(
        child: const Text('Listo'),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    ],
  );
  });
  }   

void showYesNoModal(BuildContext context,Color primary,String question, ValueChanged<bool> onValue, {IconData icon=Icons.warning_amber_rounded})
  {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50,vertical: 50),
            child:
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [BoxShadow(color: primary,blurRadius: 2,spreadRadius: 1)]
                ),
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Wrap(
                      alignment: WrapAlignment.center,
                      children:[Text(style: TextStyle(fontSize: 17,fontFamily: 'Montserrat',
                           fontWeight: FontWeight.bold,color: primary,decoration: TextDecoration.none),question),  
                           Icon(icon,color: primary),]
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [ElevatedButton(
                        onPressed: () {
                          onValue(true);
                          Navigator.of(context).pop(); // Close the modal
                        },
                        child: const Text('Si'),
                      ),
                      const SizedBox(width: 5),
                     ElevatedButton(
                        onPressed: () {
                          onValue(false);
                          Navigator.of(context).pop(); // Close the modal
                        },
                        child: const Text('No'),
                      ), ]
                    ),
                  ],
                ),
              ),
            ),
        );
      },
    );
  } 