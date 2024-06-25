import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/device/device_utility.dart';
import 'package:e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class ETabBard extends StatelessWidget implements PreferredSizeWidget {
  //! If you want to add the background color to tabs you have to wrap them in Material widget
  //! To do that we need [PreferredSized] Widget and that's why created custom class [PreferredSizeWidget]
  const ETabBard({super.key, required this.tabs});

  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    final isDark = EHelperFunctions.isDarkMode(context); //!

    return Material(
      color: isDark ? EColors.dark : EColors.light,
      child: TabBar(
        tabs: tabs,
        isScrollable: true,
        indicatorColor: EColors.primary,
        labelColor: isDark ? EColors.white : EColors.primary,
        unselectedLabelColor: EColors.darkGrey,
        tabAlignment: TabAlignment.start,
      ),
    );
  }

  @override
  //! Khác với [EAppBar] là "AppBar" đầu tiên nên { preferredSize = getAppBarHeight }
  //! Tuy nhiên với [ETabBard] là "AppBar" thứ hai nên giữa chúng sẽ có phần đệm khoảng cách nhau
  //! Ta cần trừ đi phần đệm đó để khi hai AppBar thu gọn lại nhau sẽ ko nhìn thấy phần đệm đó
  Size get preferredSize => Size.fromHeight(EDeviceUtils.getAppBarHeight() - EDeviceUtils.getMaterialListPadding());
}
