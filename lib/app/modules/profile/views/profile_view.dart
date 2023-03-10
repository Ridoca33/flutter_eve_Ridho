import 'package:auth_socmed/app/data/size.dart';
import 'package:auth_socmed/app/modules/profile/widget/bottom_navbar_widget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(
              vertical: parameterGLobal.defaultMargin,
              horizontal: parameterGLobal.defaultMargin,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // appbar
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        right: parameterGLobal.defaultMargin,
                      ),
                      child: const Icon(
                        Icons.person,
                        size: 20,
                      ),
                    ),
                    Text(
                      "Profile",
                      style: TextStyle(
                        fontSize: parameterGLobal.sizeFontSubHeaderCard,
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () => controller.signOut(),
                      icon: const Icon(
                        Icons.logout,
                        size: 20,
                      ),
                    ),
                  ],
                ),
                // avatar
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(
                    top: parameterGLobal.defaultMargin * 3,
                    bottom: parameterGLobal.defaultMargin,
                  ),
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage:
                        NetworkImage(controller.photoUser.toString()),
                    child: Stack(children: [
                      Align(
                        alignment: Alignment.bottomRight,
                        child: CircleAvatar(
                          radius: 12,
                          backgroundColor: Colors.green,
                          child: Icon(
                            Icons.edit,
                            color: Colors.white,
                            size: parameterGLobal.sizeFontSmall,
                          ),
                        ),
                      ),
                    ]),
                  ),
                ),
                // profile name
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(
                    vertical: parameterGLobal.defaultMargin,
                  ),
                  child: Text(
                    controller.namaUser.toString(),
                    style: TextStyle(
                      fontSize: parameterGLobal.sizeFontHeaderCard,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                // row followers
                IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Text(
                            'Fundraisy',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: parameterGLobal.sizeFontForm,
                            ),
                          ),
                          SizedBox(
                            height: parameterGLobal.defaultMargin / 2,
                          ),
                          Text(
                            '9',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: parameterGLobal.sizeFontMedium,
                            ),
                          ),
                        ],
                      ),
                      const VerticalDivider(
                        thickness: 1,
                      ),
                      Column(
                        children: [
                          Text(
                            'Followers',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: parameterGLobal.sizeFontForm,
                            ),
                          ),
                          SizedBox(
                            height: parameterGLobal.defaultMargin / 2,
                          ),
                          Text(
                            '99',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: parameterGLobal.sizeFontMedium,
                            ),
                          ),
                        ],
                      ),
                      const VerticalDivider(
                        thickness: 1,
                      ),
                      Column(
                        children: [
                          Text(
                            'Following',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: parameterGLobal.sizeFontForm,
                            ),
                          ),
                          SizedBox(
                            height: parameterGLobal.defaultMargin / 2,
                          ),
                          Text(
                            '999',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: parameterGLobal.sizeFontMedium,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                    vertical: parameterGLobal.defaultMargin,
                  ),
                  child: const Divider(
                    thickness: 1,
                    height: 2,
                  ),
                ),
                // box topup
                Container(
                  margin: EdgeInsets.symmetric(
                    vertical: parameterGLobal.defaultMargin / 4,
                  ),
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        parameterGLobal.defaultBorder,
                      ),
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          MaterialButton(
                            onPressed: () {},
                            color: Colors.green,
                            textColor: Colors.white,
                            shape: const CircleBorder(),
                            child: Icon(
                              Icons.account_balance_wallet,
                              size: parameterGLobal.sizeFontSubHeaderCard,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            width: parameterGLobal.defaultMargin,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                '\$800',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "My Wallet Balance",
                                style: TextStyle(
                                  fontSize: parameterGLobal.sizeFontVerySmall,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: parameterGLobal.defaultPadding,
                          vertical: parameterGLobal.defaultPadding / 4,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.green,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              parameterGLobal.defaultBorder,
                            ),
                          ),
                        ),
                        child: Text(
                          'Topup',
                          style: TextStyle(
                            fontSize: parameterGLobal.sizeFontSmall,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // about
                Container(
                  margin: EdgeInsets.symmetric(
                      vertical: parameterGLobal.defaultMargin),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "About",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: parameterGLobal.sizeFontForm,
                        ),
                      ),
                      Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat",
                        style: TextStyle(
                          fontSize: parameterGLobal.sizeFontMedium,
                        ),
                      ),
                    ],
                  ),
                ),
                // interest
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Interest",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: parameterGLobal.sizeFontForm,
                          ),
                        ),
                        SizedBox(
                          width: parameterGLobal.defaultMargin / 2,
                        ),
                        Icon(
                          Icons.edit,
                          size: parameterGLobal.sizeFontHeaderCard,
                          color: Colors.green,
                        ),
                      ],
                    ),
                    Wrap(
                      children: List.generate(
                        10,
                        (index) {
                          return Container(
                            margin: EdgeInsets.only(
                              right: parameterGLobal.defaultMargin / 4,
                            ),
                            child: FilterChip(
                              padding: EdgeInsets.symmetric(
                                horizontal: parameterGLobal.defaultPadding / 2,
                              ),
                              label: Text(
                                'Medic',
                                style: TextStyle(
                                  fontSize: parameterGLobal.sizeFontSmall,
                                ),
                              ),
                              onSelected: (bool value) {},
                              backgroundColor: Colors.transparent,
                              shape: const StadiumBorder(
                                side: BorderSide(color: Colors.green),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavbar(),
    );
  }
}
