import 'package:ai_recipe/generated/l10n.dart';
import 'package:ai_recipe/widgets/general_button.dart';
import 'package:ai_recipe/widgets/text_fontsize.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'constants/app_colors_const.dart';
import 'repository/ai_repository.dart';
import 'services/size_config.dart';
import 'widgets/app_hide_keyboard_widget.dart';
import 'widgets/textfields.dart';
import 'dart:math';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _msgController = TextEditingController();
  late FToast fToast;
  SizeConfig sizeConfig = SizeConfig();
  String? textResponse;

  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast.init(context);
  }

  bool isLoading = false;

  @override
  void dispose() {
    super.dispose();
    _msgController.dispose();
  }

  List<String> ingredientList = [];
  List<Color> colorList = [];

  @override
  Widget build(BuildContext context) {
    return AppHideKeyBoardWidget(
      child: Scaffold(
        // appBar: AppBar(
        //   title: const Text('Text Repeater'),
        //   centerTitle: true,
        //   actions: [
        //     IconButton(
        //         onPressed: () {
        //           showDialog(
        //               barrierDismissible: true,
        //               context: context,
        //               builder: (context) {
        //                 return const AlertDialog(
        //                   actionsAlignment: MainAxisAlignment.center,
        //                   alignment: Alignment.center,
        //                   title: Center(
        //                       child: Text(
        //                     'instagram : 2handaulet',
        //                     style: TextStyle(fontSize: 20),
        //                   )),
        //                   actions: [],
        //                 );
        //               });
        //         },
        //         icon: const Icon(Icons.info_outline))
        //   ],
        // ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                            child:
                                TextSize.s24w700(S.of(context).create_recipe)),
                        IconButton(
                            onPressed: () {
                              showDialog(
                                  barrierDismissible: true,
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      actionsAlignment:
                                          MainAxisAlignment.center,
                                      alignment: Alignment.center,
                                      title: const Center(
                                          child: Text(
                                        '<:Creator:>',
                                        style: TextStyle(fontSize: 20),
                                      )),
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: const [
                                          Center(
                                              child: Text(
                                            'instagram : 2handaulet',
                                            style: TextStyle(fontSize: 20),
                                          )),
                                        ],
                                      ),
                                      actions: const [],
                                    );
                                  });
                            },
                            icon: const Icon(Icons.info_outline)),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          decoration: BoxDecoration(
                              color: AppColors.form,
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(color: AppColors.grayLight)),
                          child: DropdownButton<String>(
                            underline: const SizedBox(),
                            value: Intl.getCurrentLocale(),
                            iconSize: 24,
                            style: const TextStyle(
                                fontSize: 18, color: AppColors.gray),
                            items: [
                              DropdownMenuItem(
                                value: 'en',
                                child: Text(
                                  S.of(context).en,
                                ),
                              ),
                              DropdownMenuItem(
                                value: 'ru_RU',
                                child: Text(
                                  S.of(context).ru,
                                ),
                              ),
                            ],
                            onChanged: (value) async {
                              if (value == null) return;
                              if (value == 'ru_RU') {
                                await S.load(
                                  const Locale('ru', 'RU'),
                                );

                                setState(() {});
                              } else if (value == 'en') {
                                await S.load(
                                  const Locale('en'),
                                );
                                setState(() {});
                              }
                              ingredientList.clear();
                              colorList.clear();
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    IntrinsicHeight(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            flex: 10,
                            child: CustomTextField(
                              bottom: 0,
                              controller: _msgController,
                              hintText: S.of(context).enter_ingredients,
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4),
                                bottomLeft: Radius.circular(4),
                              ),
                              onFieldSubmitted: (value) {
                                if (value != null) {
                                  ingredientList.add(value);
                                  colorList.add(Color(
                                          (Random().nextDouble() * 0xFFFFFF)
                                              .toInt())
                                      .withOpacity(0.1));
                                  _msgController.clear();
                                  setState(() {});
                                }
                              },
                            ),
                          ),
                          Flexible(
                            flex: 2,
                            child: GestureDetector(
                              onTap: () {
                                if (_msgController.text.isNotEmpty) {
                                  ingredientList
                                      .add(_msgController.text.trim());
                                  colorList.add(Color(
                                          (Random().nextDouble() * 0xFFFFFF)
                                              .toInt())
                                      .withOpacity(0.1));
                                  _msgController.clear();
                                  setState(() {});
                                }
                              },
                              child: Container(
                                  height: double.infinity,
                                  width: 59,
                                  decoration: const BoxDecoration(
                                    color: AppColors.grayLight,
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(4),
                                      bottomRight: Radius.circular(4),
                                    ),
                                  ),
                                  child: const Icon(
                                    Icons.add,
                                    size: 28,
                                    color: AppColors.dark,
                                  )),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    Wrap(
                      children: [
                        for (int i = 0; i < ingredientList.length; i++)
                          Padding(
                            padding:
                                const EdgeInsets.only(right: 4.0, bottom: 8),
                            child: Chip(
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              backgroundColor: colorList[i],
                              label: Text(ingredientList[i]),
                              onDeleted: () {
                                ingredientList.removeAt(i);
                                colorList.removeAt(i);
                                setState(() {});
                              },
                              deleteIcon: const Icon(Icons.cancel),
                            ),
                          )
                      ],
                    ),
                    Text(textResponse ?? ''),
                    if (isLoading) Text(S.of(context).generating)
                  ],
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            decoration: const BoxDecoration(color: AppColors.white, boxShadow: [
              BoxShadow(
                  color: Colors.black12, offset: Offset(0, 1), blurRadius: 8),
            ]),
            padding: const EdgeInsets.all(16.0),
            child: GeneralButton(
              isLoading: isLoading,
              text: S.of(context).create,
              onPressed: () async {
                var concatenate = StringBuffer();
                setState(() {
                  isLoading = true;
                });
                String locale = Intl.getCurrentLocale();

                for (var item in ingredientList) {
                  concatenate.write(item);
                  if (ingredientList.last != item) {
                    concatenate.write(', ');
                  }
                }
                print(concatenate.toString());
                textResponse = await AiRepository.sendRequest(
                        aiText: concatenate.toString(), locale: locale)
                    .then((value) {
                  isLoading = false;
                  return value;
                });
                setState(() {});
              },
            ),
          ),
        ),
      ),
    );
  }
}
