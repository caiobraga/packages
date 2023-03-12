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
                    ? ConstrainedBox(
                        constraints: BoxConstraints.expand(height: 80.0),
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Expanded(
                                child: IconButton(
                                  icon: const Icon(Icons.person, size: 24.0),
                                  onPressed: () async{
                                    if (onSelectImage != null) {
                                     await onSelectImage();
                                    }
                                    state.didChange(image);
                                  
                                  },
                                ),
                              )
                            ]))
                    : OutlinedButton(
                        onPressed: () async{
                          if (onSelectImage != null) {
                            await onSelectImage();
                          }
                          state.didChange(image);
                        },
                        child: Image.memory(
                          image,
                          fit: BoxFit.contain,
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
