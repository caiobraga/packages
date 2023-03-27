import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ImageFormField extends FormField<Uint8List> {
  Uint8List? image;
  Future<void> Function()? onSelectImage;

  ImageFormField({
    FormFieldValidator<Uint8List>? validator,
    this.image,
    this.onSelectImage,
  }) : super(
          initialValue: image,
          validator: validator,
          builder: (FormFieldState<Uint8List> state) {
            state.mounted ? state.setValue(image): (){};
            return Column(
              children: [
                
                image == null
                    ? GestureDetector(
                        onTap: () async{
                          if (onSelectImage != null) {
                            await onSelectImage();
                          }
                          state.didChange(image);
                    },
                      child:Container(
                              decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius:
                              BorderRadius.circular(120)),
                              width: 100,
                              height: 100,
                              child: Icon(
                                Icons.photo_camera,
                            size: 35,
                            color: Colors.grey[800],
                          ),
                        ),
                     )
                    : OutlinedButton(
                        onPressed: () async{
                          if (onSelectImage != null) {
                            await onSelectImage();
                          }
                          state.didChange(image);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius:
                              BorderRadius.circular(120)),
                          width: 100,
                          height: 100,
                          child: Image.memory(
                            image,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    state.hasError
                    ? Text(
                        state.errorText != null ? state.errorText! : "",
                        style: TextStyle(color: Colors.red),
                      )
                    : Container()
              ],
            );
          },
        );
}

