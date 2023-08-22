import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_testing/bloc/bloc/Guest_bloc/guest_bloc.dart';
import 'package:flutter_bloc_testing/presentation/shared_widgets/children_Card.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBottomSheet extends StatefulWidget {
  const CustomBottomSheet(BuildContext context, {super.key});

  @override
  State<CustomBottomSheet> createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  Widget build(BuildContext context) {
    return BlocBuilder<GuestBloc, GuestState>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
          ),
          height: 763,
          width: 500,
          child: Stack(
            children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 250, 0, 100),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Color(0xFF3C4955),
                    ),
                    child: SingleChildScrollView(
                      child: Container(
                          child: GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10.0,
                          mainAxisSpacing: 10.0,
                        ),
                        itemCount: state.children,
                        itemBuilder: (context, index) {
                          return ChildrenCard(index: index);
                        },
                      )),
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                  Container(
                    height: 3,
                    width: 83,
                    margin: EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      color: Color(0xFFE6E9ED),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(24, 20, 100, 0),
                            child: Column(
                              children: [
                                Text(
                                  'Who\'s coming?',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: 'MontserratMedium'),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(75, 20, 0, 0),
                            child: TextButton(
                              onPressed: () {
                                context.read<GuestBloc>().add(onclear());
                                context.read<GuestBloc>().add(checkvalidity());
                              },
                              child: Text(
                                'Clear',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'MontserratMedium',
                                  color: Color(0xFF297BE6),
                                  decoration: TextDecoration.underline,
                                  decorationColor: Color(0xFF297BE6),
                                  decorationThickness: 2,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(24, 20, 100, 0),
                            child: Column(
                              children: [
                                Text(
                                  'Adults',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: 'MontserratMedium'),
                                ),
                                Text(
                                  'Ages 13+',
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontFamily: 'MontserratRegular'),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(103, 20, 0, 0),
                                child: IconButton(
                                  onPressed: () {
                                    context
                                        .read<GuestBloc>()
                                        .add(decrementadults());
                                    context
                                        .read<GuestBloc>()
                                        .add(checkvalidity());
                                  },
                                  icon: SvgPicture.asset(
                                    'assets/icons/vuesax-outline-info-circle.svg',
                                    width: 25,
                                    height: 25,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(5, 20, 0, 0),
                                child: Container(
                                  width: 20,
                                  child: Text(
                                    '${state.Adults}',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontFamily: 'MontserratRegular'),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(5, 20, 0, 0),
                                child: IconButton(
                                  onPressed: () {
                                    context
                                        .read<GuestBloc>()
                                        .add(incrementadults());
                                    context
                                        .read<GuestBloc>()
                                        .add(checkvalidity());
                                  },
                                  icon: SvgPicture.asset(
                                    'assets/icons/vuesax-outline-info-circle2.svg',
                                    width: 25,
                                    height: 25,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(24, 20, 100, 0),
                            child: Text(
                              'Children',
                              style: TextStyle(
                                  fontSize: 12, fontFamily: 'MontserratMedium'),
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(93, 20, 0, 0),
                                child: IconButton(
                                  onPressed: () {
                                    context
                                        .read<GuestBloc>()
                                        .add(decrementchildren());
                                    context
                                        .read<GuestBloc>()
                                        .add(checkvalidity());
                                  },
                                  icon: SvgPicture.asset(
                                    'assets/icons/vuesax-outline-info-circle.svg',
                                    width: 25,
                                    height: 25,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(5, 20, 0, 0),
                                child: Container(
                                  width: 20,
                                  child: Text(
                                    '${state.children}',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontFamily: 'MontserratRegular'),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(5, 20, 0, 0),
                                child: IconButton(
                                  onPressed: () {
                                    context
                                        .read<GuestBloc>()
                                        .add(incrementchildren());
                                    context
                                        .read<GuestBloc>()
                                        .add(checkvalidity());
                                  },
                                  icon: SvgPicture.asset(
                                    'assets/icons/vuesax-outline-info-circle2.svg',
                                    width: 25,
                                    height: 25,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      if (state.isvalid == false)
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 470, 0, 0),
                          child: Container(
                            width: 360,
                            height: 51,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Color(0xFFF8AE56)),
                            child: ElevatedButton(
                                onPressed: () {
                                  print('${state.childrenlist}');
                                },
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.red,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      side:
                                          BorderSide(color: Colors.transparent),
                                    )),
                                child: Text(
                                  'SEARCH',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'MontserratMedium',
                                      color: Color(0xFF323E48)),
                                )),
                          ),
                        ),
                      if (state.isvalid == true)
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 470, 0, 0),
                          child: Container(
                            width: 360,
                            height: 51,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Color(0xFFF8AE56)),
                            child: ElevatedButton(
                                onPressed: () {
                                  print('${state.childrenlist}');
                                  Navigator.popUntil(
                                      context, (route) => route.isFirst);
                                },
                                style: ElevatedButton.styleFrom(
                                    primary: Color(0xFFF8AE56),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      side:
                                          BorderSide(color: Colors.transparent),
                                    )),
                                child: Text(
                                  'SEARCH',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'MontserratMedium',
                                      color: Color(0xFF323E48)),
                                )),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

void openCustomBottomSheet(context) {
  showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    builder: (context) {
      return CustomBottomSheet(context);
    },
  );
}
