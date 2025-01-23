import 'package:flutter/material.dart';
import '../../../../utils/device/screen_util.dart';

class CategoryList extends StatelessWidget {
  final List<Map<String, String>> categories;

  const CategoryList({required this.categories});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ScreenUtil.adaptiveHeight(100), // Высота категорий
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(
                    horizontal: ScreenUtil.adaptiveWidth(10)),
                width: ScreenUtil.adaptiveWidth(80),
                height: ScreenUtil.adaptiveWidth(70),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey.shade200,
                ),
                child: Padding(
                  padding: EdgeInsets.all(ScreenUtil.adaptiveWidth(10)),
                  child: Image.asset(category['icon']!, fit: BoxFit.contain),
                ),
              ),
              SizedBox(height: ScreenUtil.adaptiveHeight(5)),
              Text(
                category['title']!,
                style: Theme.of(context).textTheme.bodySmall,
                textAlign: TextAlign.center,
              ),
            ],
          );
        },
      ),
    );
  }
}
