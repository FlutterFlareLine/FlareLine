import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:free_flutter_admin_dashboard/sideMenu.dart';

class SideBarWidger extends StatelessWidget {
  SideBarWidger({super.key});

  List listMenu = List.from([
    {
      'groupName': 'MENU',
      'menuList': [
        {
          'menuName': 'Dashboard',
          'childList': [
            {'menuName': 'eCommerce', 'path': '/dashboard'},
            {'menuName': 'Analytics', 'path': '/analytics'},
            {'menuName': 'Marketing', 'path': '/marketing'},
            {'menuName': 'CRM', 'path': '/crm'}
          ]
        },
        {'menuName': 'Calendar', 'path': '/calendar'},
        {'menuName': 'Profile', 'path': '/profile'},
        {
          'menuName': 'Task',
          'childList': [
            {'menuName': 'List', 'path': '/list'},
            {'menuName': 'Kanban', 'path': '/kanban'},
          ]
        },
        {
          'menuName': 'Forms',
          'childList': [
            {'menuName': 'Form Elements', 'path': '/formElements'},
            {'menuName': 'Form Layout', 'path': '/formLayout'},
          ]
        },
        {'menuName': 'Tables', 'path': '/tables'},
        {
          'menuName': 'Pages',
          'childList': [
            {'menuName': 'Settings', 'path': '/settings'},
            {'menuName': 'File Manager', 'path': '/fileManager'},
            {'menuName': 'Data Tables', 'path': '/dataTables'},
            {'menuName': 'Pricing Tables', 'path': '/pricingTables'},
            {'menuName': 'Error Page', 'path': '/errorPage'},
            {'menuName': 'Mail Success', 'path': '/mailSuccess'},
          ]
        },
      ]
    },
    {
      'groupName': 'SUPPORT',
      'menuList': [
        {'menuName': 'Messages', 'path': '/messages'},
        {'menuName': 'Inbox', 'path': '/inbox'},
        {'menuName': 'Invoice', 'path': '/invoice'},
      ]
    },
    {
      'groupName': 'OTHERS',
      'menuList': [
        {
          'menuName': 'Chart',
          'childList': [
            {'menuName': 'Basic Chart', 'path': '/basicChart'},
            {'menuName': 'Advanced Chart', 'path': '/advancedChart'},
          ]
        },
        {
          'menuName': 'UI Elements',
          'childList': [
            {'menuName': 'Alerts', 'path': '/alerts'},
            {'menuName': 'Buttons', 'path': '/buttons'},
            {'menuName': 'Buttons Group', 'path': '/buttonsGroup'},
            {'menuName': 'Badge', 'path': '/badge'},
            {'menuName': 'Breadcrumbs', 'path': '/Breadcrumbs'},
            {'menuName': 'Cards', 'path': '/cards'},
            {'menuName': 'Dropdowns', 'path': '/dropdowns'},
            {'menuName': 'Modals', 'path': '/modals'},
            {'menuName': 'Tabs', 'path': '/tabs'},
            {'menuName': 'Tooltips', 'path': '/tooltips'},
            {'menuName': 'Popovers', 'path': '/popovers'},
            {'menuName': 'Accordion', 'path': '/accordion'},
            {'menuName': 'Notifications', 'path': '/notifications'},
            {'menuName': 'Pagination', 'path': '/pagination'},
            {'menuName': 'Progress', 'path': '/progress'},
            {'menuName': 'Carousel', 'path': '/Carousel'},
            {'menuName': 'Images', 'path': '/images'},
            {'menuName': 'Videos', 'path': '/videos'},
          ]
        },
        {
          'menuName': 'Authentication',
          'childList': [
            {'menuName': 'Sign In', 'path': '/signIn', 'blank': true},
            {'menuName': 'Sign Up', 'path': '/signUp', 'blank': true},
            {'menuName': 'Reset Password', 'path': '/resetPwd', 'blank': true},
          ]
        },
      ]
    }
  ]);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      color: Colors.green,
      width: 200.w,
      child: Column(children: [
        _logoWidget(),
        SizedBox(
          height: 30.h,
        ),
        Expanded(child: _sideListWidget(context))
      ]),
    );
  }

  _logoWidget() {
    return Row(
      children: [
        ClipOval(
          child: Container(
            child: Image.asset(
              'images/app_icon.png',
              width: 26.w,
              height: 26.w,
            ),
          ),
        ),
        SizedBox(
          width: 6.w,
        ),
        Expanded(
            child: Text(
          'XAdmin',
          style: TextStyle(color: Colors.white, fontSize: 32.sp),
        ))
      ],
    );
  }

  _sideListWidget(BuildContext context) {
    return ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
        child: ListView.separated(
            itemBuilder: itemBuilder,
            separatorBuilder: separatorBuilder,
            itemCount: listMenu.length));
  }

  Widget itemBuilder(BuildContext context, int index) {
    var groupElement = listMenu.elementAt(index);
    List menuList = groupElement['menuList'];
    return Container(
      child: Column(
        children: [
          Text(
            groupElement['groupName'],
            style: TextStyle(fontSize: 18.sp, color: Colors.white60),
          ),
          Column(
            children: menuList.map((e) => SideMenuWidget(e: e)).toList(),
          )
        ],
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
    );
  }

  Widget separatorBuilder(BuildContext context, int index) {
    return Divider(height: 10.h);
  }
}
