import 'package:bookia/core/constants/text_app.dart';
import 'package:bookia/core/function/validation.dart';
import 'package:bookia/feature/cart/data/model/governorates_model/datum.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class DropButtonWidget extends StatelessWidget {
  const DropButtonWidget({super.key, this.onChanged, required this.items});
  final void Function(String?)? onChanged;
  final List<Datum> items;
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField2<String>(
      isExpanded: true,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 16),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
      ),
      hint: const Text(
        TextApp.selectGovernorate,
        style: TextStyle(fontSize: 14),
      ),
      validator: (value) {
        return validationField("text", 3, 40, value);
      },
      onChanged: onChanged,
      buttonStyleData: const ButtonStyleData(
        padding: EdgeInsets.only(right: 8),
      ),
      iconStyleData: const IconStyleData(
        icon: Icon(Icons.arrow_drop_down, color: Colors.black45),
        iconSize: 24,
      ),
      dropdownStyleData: DropdownStyleData(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
      ),
      menuItemStyleData: const MenuItemStyleData(
        padding: EdgeInsets.symmetric(horizontal: 16),
      ),

      items:
          items.map((item) {
            return DropdownMenuItem<String>(
              value: item.id.toString(),
              child: Text(
                item.governorateNameEn.toString(),
                style: const TextStyle(fontSize: 14),
              ),
            );
          }).toList(),
    );
  }
}
