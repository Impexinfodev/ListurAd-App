import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:list_ur_add/common_widgets/custom_app_bar.dart';
import 'package:list_ur_add/modules/ad/model/ad_layout_type.dart';
import 'package:list_ur_add/modules/ad/views/ad_design_view.dart';
import 'package:list_ur_add/modules/ad/views/ad_image_design_view.dart';
import 'package:list_ur_add/widgets/ad_widget/ad_type_card.dart';
import 'package:list_ur_add/widgets/home_widget/category_chip.dart';
import 'package:list_ur_add/widgets/home_widget/category_dialog.dart';

class AdView extends StatefulWidget {
  const AdView({super.key});

  @override
  State<AdView> createState() => _AdViewState();
}

class _AdViewState extends State<AdView> {
  String? selectedCategory;
  final List<String> categories = ['Category', 'Sub Category', 'Type Category'];

  late final List<AdTypeModel> adTypes = [
    AdTypeModel(
      title: 'Text Only',
      layoutType: AdLayoutType.textOnly,
      price: '₹1500/-',
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => AdDesignView(layoutType: AdLayoutType.textOnly,)));
      },
    ),
    AdTypeModel(
      title: 'Yellow Highlighted Text',
      layoutType: AdLayoutType.yellowText,
      price: '₹1500/-',
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AdDesignView(adWithColor: 'E3F300', layoutType: AdLayoutType.yellowText,)),
        );
      },
    ),
    AdTypeModel(
      title: 'Pink Highlighted Text',
      layoutType: AdLayoutType.pinkText,
      price: '₹1500/-',
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AdDesignView(adWithColor: 'FF81E4', layoutType: AdLayoutType.pinkText,)),
        );
      },
    ),
    AdTypeModel(
      title: 'Image only',
      layoutType: AdLayoutType.imageOnly,
      price: '₹1500/-',
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AdImageDesignView(layoutType: AdLayoutType.imageOnly)),
        );
      },
    ),
    AdTypeModel(
      title: 'Image with Text',
      layoutType: AdLayoutType.imageWithText,
      price: '₹1500/-',
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AdImageDesignView(layoutType: AdLayoutType.imageWithText),
          ),
        );
      },
    ),
    AdTypeModel(
      title: 'Text with image  ',
      layoutType: AdLayoutType.textWithImage,
      price: '₹1500/-',
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AdImageDesignView(layoutType: AdLayoutType.textWithImage),
          ),
        );
      },
    ),
    AdTypeModel(
      title: 'Image with Text',
      layoutType: AdLayoutType.imageWithTextLayoutLeft,
      price: '₹1500/-',
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                AdImageDesignView(layoutType: AdLayoutType.imageWithTextLayoutLeft),
          ),
        );
      },
    ),
    AdTypeModel(
      title: 'Image with Text',
      layoutType: AdLayoutType.imageWithTextLayoutRight,
      price: '₹1500/-',
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                AdImageDesignView(layoutType: AdLayoutType.imageWithTextLayoutRight),
          ),
        );
      },
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Choose Ad Type'),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
            height: 65,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16.r),
                bottomRight: Radius.circular(16.r),
              ),
            ),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (_) => CategoryDialog(
                        categories: const [
                          'Jobs',
                          'Matrimony',
                          'Obituary',
                          'Rent',
                          'Notice',
                          'New Category',
                        ],
                        onSelect: (value) {
                          selectedCategory = value;
                        },
                      ),
                    );
                  },
                  child: CategoryChip(title: selectedCategory ?? 'Select Category'),
                );
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: adTypes.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    adTypes[index].onTap();
                  },
                  child: AdTypeCard(ad: adTypes[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
