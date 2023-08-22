import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_testing/bloc/bloc/Property_bloc/property_bloc.dart';
import 'package:flutter_bloc_testing/data/repository/Services.dart';
import 'package:flutter_bloc_testing/models/Property_model.dart';
import 'package:flutter_bloc_testing/presentation/shared_widgets/CustomDrawer_Widget.dart';
import 'package:flutter_bloc_testing/presentation/shared_widgets/Custom_bottom_sheet_Widget.dart';
import 'package:flutter_bloc_testing/presentation/shared_widgets/Property_card.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  PropertyServices services = PropertyServices();

  Widget build(BuildContext context) {
    return BlocBuilder<PropertyBloc, PropertyState>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        return Scaffold(
          key: _scaffoldKey,
          backgroundColor: Color(0xFFF9F9F9),
          drawer: CustomDrawer(),
          appBar: AppBar(
            automaticallyImplyLeading: false,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(15),
              ),
            ),
            backgroundColor: Color(0xFF3C4955),
            toolbarHeight: 150,
            title: Column(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 55, 0, 0),
                        child: IconButton(
                          onPressed: () {
                            _scaffoldKey.currentState?.openDrawer();
                            print('IconButton pressed!');
                          },
                          icon: SvgPicture.asset(
                            'assets/icons/Group 13892.svg',
                            width: 18,
                            height: 18,
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        width: 322,
                        height: 45,
                        margin: EdgeInsets.fromLTRB(0, 56, 0, 2),
                        child: Stack(
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(18, 14, 10, 0),
                              child: SvgPicture.asset(
                                'assets/icons/Group 13893.svg',
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(40, 0, 8, 0),
                              child: DropdownButton<PropertyModel>(
                                isExpanded: true,
                                hint: Text(
                                  'Select a property',
                                  style: TextStyle(
                                      fontFamily: 'MontserratRegular',
                                      fontSize: 13),
                                ),
                                value: state.selectedproperty,
                                onChanged: (PropertyModel? newValue) {
                                  context
                                      .read<PropertyBloc>()
                                      .add(updateselection(newValue!));
                                },
                                items: state.property
                                    .map<DropdownMenuItem<PropertyModel>>(
                                        (PropertyModel property) {
                                  return DropdownMenuItem<PropertyModel>(
                                    value: property,
                                    child: Text(
                                      property.propertyName,
                                      style: TextStyle(
                                          fontFamily: 'MontserratRegular',
                                          fontSize: 13),
                                    ),
                                  );
                                }).toList(),
                                icon: SvgPicture.asset(
                                    'assets/icons/Icon-16x-dropdown.svg'),
                                iconSize: 24,
                                underline: SizedBox(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      width: 178,
                      height: 45,
                      margin: EdgeInsets.fromLTRB(0, 8, 0, 56),
                      child: Stack(
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(18, 14, 10, 0),
                            child: SvgPicture.asset(
                              'assets/icons/Group 13884.svg',
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(40, 0, 8, 0),
                            child: DropdownButton<PropertyModel>(
                              isExpanded: true,
                              hint: Text(
                                'Select Dates',
                                style: TextStyle(
                                    fontFamily: 'MontserratRegular',
                                    fontSize: 13),
                              ),
                              value: state.selectedproperty,
                              onChanged: (PropertyModel? newValue) {
                                context
                                    .read<PropertyBloc>()
                                    .add(updateselection(newValue!));
                              },
                              items: state.property
                                  .map<DropdownMenuItem<PropertyModel>>(
                                      (PropertyModel property) {
                                return DropdownMenuItem<PropertyModel>(
                                  value: property,
                                  child: Text(
                                    property.propertyName,
                                    style: TextStyle(
                                        fontFamily: 'MontserratRegular',
                                        fontSize: 13),
                                  ),
                                );
                              }).toList(),
                              icon: SvgPicture.asset(
                                  'assets/icons/Icon-16x-dropdown2.svg'),
                              iconSize: 24,
                              underline: SizedBox(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        width: 178,
                        height: 45,
                        margin: EdgeInsets.fromLTRB(6, 8, 0, 56),
                        child: GestureDetector(
                          onTap: () {
                            print('Button Pressed');
                          openCustomBottomSheet(context);
                          },
                          child: Stack(
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(17, 13, 0, 0),
                                child: Icon(
                                  Icons.person_add_outlined,
                                  size: 20,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(40, 2, 8, 0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 12, horizontal: 0),
                                    child: Row(
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              'Guests & Rooms',
                                              style: TextStyle(
                                                fontFamily: 'MontserratRegular',
                                                fontSize: 13,
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      7, 0, 0, 0),
                                              child: SvgPicture.asset(
                                                'assets/icons/Icon-16x-dropdown2.svg',
                                                width: 16,
                                                height: 16,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )),
                  ],
                ),
              ],
            ),
          ),
          body: ListView(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(28, 20, 145, 0),
                child: Text(
                  'Available Properties',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'MontserratMedium',
                  ),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: services.getlength(state.selectedproperty) + 1,
                itemBuilder: (context, index) {
                  return PropertyCard(
                    space: state.selectedproperty.availableSpaces[index],
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
