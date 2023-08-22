import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_testing/bloc/bloc/Guest_bloc/guest_bloc.dart';

class ChildrenCard extends StatefulWidget {
  const ChildrenCard({super.key, required this.index});
  final int index;
  @override
  State<ChildrenCard> createState() => _ChildrenCardState();
}

class _ChildrenCardState extends State<ChildrenCard> {
  int selectedAge = 0;

  Widget build(BuildContext context) {
    return BlocBuilder<GuestBloc, GuestState>(
      builder: (context, state) {
        return Card(
          margin: EdgeInsets.all(16),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
            ),
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Select Age:',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      DropdownButton<int>(
                        hint: Text('Age'),
                        value: selectedAge==0? null : selectedAge,
                        onChanged: (newValue) {
                          context.read<GuestBloc>().add(checkvalidity());
                          setState(() {
                            selectedAge = newValue!;
                            state.childrenlist[widget.index] = newValue;
                          });
                        },
                        items: List.generate(14, (index) {
                          return DropdownMenuItem<int>(
                            value: index,
                            child: Text('${index}'),
                          );
                        }),
                      ),
                      SizedBox(width: 16),
                      Text(
                        'Age: ${state.childrenlist[widget.index]}',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
