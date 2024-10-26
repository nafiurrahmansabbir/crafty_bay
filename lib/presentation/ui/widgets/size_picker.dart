import 'package:crafty_bay/presentation/ui/utils/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SizePicker extends StatefulWidget {

  const SizePicker(
      {super.key, required this.sizes, required this.onSizeSelected});

  final List<String> sizes;
  final Function(String) onSizeSelected;

  @override
  State<SizePicker> createState() => _SizePickerState();
}

class _SizePickerState extends State<SizePicker> {
  late String _selectedSize= widget.sizes.first;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Size',style: Theme.of(context).textTheme.titleMedium,),
        const SizedBox(height: 16,),
        Wrap(
          spacing: 8,
          children:
          widget.sizes.map((item){
            return GestureDetector(
              onTap: (){
                _selectedSize=item;
                setState(() {

                });
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  border: Border.all(),
                  color: _selectedSize==item?AppColors.themeColor : Colors.white,
                ),
                child: Text(item,style: TextStyle(
                  fontSize: 18,
                  color: _selectedSize==item? Colors.white : AppColors.themeColor
                ),),
              ),
            );
          }).toList(),

        )
      ],
    );
  }
}
