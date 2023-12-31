import 'package:flutter/material.dart';

class EmailFormField extends StatelessWidget {
  final String? initialValue;
  final ValueChanged<String>? onChanged;
  final FormFieldSetter<String>? onSaved;
  final String? Function(String?)? validator;

  const EmailFormField({
    Key? key,
    this.initialValue,
    this.onChanged,
    this.onSaved,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(color: Colors.white),
      decoration: const InputDecoration(
        labelText: 'Email',
        hintText: 'Enter your email',
        prefixIcon: Icon(Icons.email),
      ),
      keyboardType: TextInputType.emailAddress,
      validator: validator,
      onChanged: onChanged,
      onSaved: onSaved,
      initialValue: initialValue,
    );
  }
}
