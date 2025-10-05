import 'package:flutter/material.dart';

class AddGuidanceWidgets {
  // صورة + Dropdown النوع
  static Widget profileAndTypeDropdown({
    required String? selectedType,
    required List<String> types,
    required Function(String?) onChanged,
  }) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 36,
          backgroundColor: Color(0xFFF1F3F6),
          child: Icon(
            Icons.person_2,
            size: 70,
          ),
        ),
        const Spacer(),
        SizedBox(
          width: 160,
          height: 60,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              border: Border.all(
                color:const Color(0xFF007AFF),
                width: 4,
              ),
              color: Colors.white,
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                hint: const Text('النوع'),
                value: selectedType,
                isExpanded: true,
                icon: const Icon(Icons.keyboard_arrow_down),
                items: types.map((type) {
                  return DropdownMenuItem<String>(
                    value: type,
                    child: Text(type),
                  );
                }).toList(),
                onChanged: onChanged,
              ),
            ),
          ),
        ),
      ],
    );
  }

  // حقل إدخال مع عنوان
  static Widget labeledTextField({
    required String label,
    required TextEditingController controller,
    double width = 300,
    double height = 100,
    bool multiline = false,
    String? Function(String?)? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 40),
          child: Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
        const SizedBox(height: 12),
        Align(
          alignment: Alignment.center,
          child: SizedBox(
            width: width,
            height: multiline ? height : 50,
            child: TextFormField(
              controller: controller,
              maxLines: multiline ? null : 1,
              expands: multiline,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide.none,
                ),
              ),
              validator: validator,
            ),
          ),
        ),
      ],
    );
  }

  // حقل الوصف الكبير
  static Widget descriptionField({
    required TextEditingController controller,
    String? Function(String?)? validator,
    double height = 200,
  }) {
    return SizedBox(
      height: height,
      child: TextFormField(
        controller: controller,
        maxLines: null,
        expands: true,
        textAlignVertical: TextAlignVertical.top,
        decoration: InputDecoration(
          hintText: 'اكتب ما تريد',
          filled: true,
          fillColor: const Color(0xFFF8F9FA),
          contentPadding: const EdgeInsets.all(16),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
        ),
        validator: validator,
      ),
    );
  }

  // زر الإرسال
  static Widget submitButton({
    required VoidCallback onPressed,
    double width = 200,
    double height = 50,
    String text = 'ارشدنا',
  }) {
    return Center(
      child: SizedBox(
        width: width,
        height: height,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF007AFF),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Text(
            text,
            style: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
