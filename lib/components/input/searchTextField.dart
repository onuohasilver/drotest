import 'package:drohealthtest/bloc/search_cubit/search_cubit.dart';
import 'package:drohealthtest/bloc/search_cubit/search_state.dart';
import 'package:drohealthtest/utilities/mockdata.dart';
import 'package:drohealthtest/utilities/sizing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchTextField extends StatefulWidget {
  const SearchTextField({
    Key? key,
  }) : super(key: key);

  @override
  _SearchTextFieldState createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  static TextEditingController textEditingController = TextEditingController();
  bool isFocused = false;

  @override
  Widget build(BuildContext context) {
    SizeReference size = SizeReference(context);
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SizedBox(
            height: size.height * .04,
            width: size.width,
            child: Row(
              children: [
                AnimatedContainer(
                  duration: Duration(milliseconds: 200),
                  height: size.height * .04,
                  width: isFocused ? size.width * .7 : size.width * .85,
                  child: TextField(
                    controller: textEditingController,
                    style: TextStyle(color: Colors.white),
                    textInputAction: TextInputAction.search,
                    onSubmitted: (_) => FocusScope.of(context).unfocus(),
                    onChanged: (_) {
                      context.read<SearchCubit>().makeSearch(
                          MockData.drugs, textEditingController.text);

                      setState(() {
                        if (_.isNotEmpty)
                          isFocused = true;
                        else
                          isFocused = false;
                      });
                    },
                    onEditingComplete: () {
                      setState(() => isFocused = false);
                    },
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        prefixIcon: Icon(Icons.search,
                            color: Colors.white, size: size.height * .02),
                        fillColor: Colors.white24,
                        filled: true,
                        hintText: 'Search',
                        hintStyle: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10))),
                  ),
                ),
                isFocused
                    ? TextButton(
                        onPressed: () => {
                              textEditingController.clear(),
                              context.read<SearchCubit>().clearSearch(),
                              setState(() {
                                isFocused = false;
                              }),
                              FocusScope.of(context).unfocus(),
                            },
                        child: Text(
                          'Cancel',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ))
                    : SizedBox()
              ],
            ),
          ),
        );
      },
    );
  }
}
