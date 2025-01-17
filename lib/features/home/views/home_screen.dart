// Главная страница
import 'package:flutter/material.dart';

import '../../../common/styles/colors.dart';
import '../../../utils/constants/strings.dart';
import '../../../utils/device/screen_util.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KColors.backgroundLight,
      body: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: ScreenUtil.adaptiveWidth(20)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: ScreenUtil.adaptiveHeight(40)),
              // Поле поиска
              TextField(
                decoration: InputDecoration(
                  hintText: Strings.searchHint,
                  prefixIcon: Icon(Icons.search, color: KColors.textSecondary),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: KColors.backgroundLight,
                ),
              ),
              SizedBox(height: ScreenUtil.adaptiveHeight(20)),
              // Горизонтальная карусель с баннерами
              SizedBox(
                height: ScreenUtil.adaptiveHeight(150),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: ScreenUtil.adaptiveWidth(10)),
                      width: ScreenUtil.adaptiveWidth(300),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: KColors.primary,
                      ),
                      child: Center(
                        child: Text(
                          'Banner ${index + 1}',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(color: KColors.textPrimary),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: ScreenUtil.adaptiveHeight(20)),
              // Мини-карусель с категориями
              SizedBox(
                height: ScreenUtil.adaptiveHeight(100),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: ScreenUtil.adaptiveWidth(10)),
                          width: ScreenUtil.adaptiveWidth(80),
                          height: ScreenUtil.adaptiveWidth(80),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: KColors.primary.withOpacity(0.1),
                          ),
                          child: Icon(Icons.category, color: KColors.primary),
                        ),
                        SizedBox(height: ScreenUtil.adaptiveHeight(5)),
                        Text(
                          'Category ${index + 1}',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    );
                  },
                ),
              ),
              SizedBox(height: ScreenUtil.adaptiveHeight(20)),
              // Карточки товаров
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: ScreenUtil.adaptiveWidth(10),
                  mainAxisSpacing: ScreenUtil.adaptiveHeight(10),
                  childAspectRatio: 0.7,
                ),
                itemCount: 20,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: KColors.backgroundLight,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(20)),
                              color: KColors.primary.withOpacity(0.1),
                            ),
                            child: Center(
                              child: Icon(Icons.shopping_bag,
                                  color: KColors.primary),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(ScreenUtil.adaptiveWidth(10)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Product ${index + 1}',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              Text(
                                '\$${(index + 1) * 10}',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(color: KColors.primary),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
