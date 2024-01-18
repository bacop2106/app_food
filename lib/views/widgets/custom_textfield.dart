import 'package:foodappseller/consts/consts.dart';
import 'package:foodappseller/views/widgets/text_style.dart';

Widget customTextField({label, hint, controller, onChange, isDesc = false}) {
  return TextFormField(
    controller: controller,
    onChanged: (value) {
      if(onChange != null) {
        onChange(value);
      }
    },
    maxLines: isDesc ? 4 : 1,
    decoration: InputDecoration(
        isDense: true,
        label: boldText(text: label),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: white)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: white)),
        hintText: hint),
  );
}
