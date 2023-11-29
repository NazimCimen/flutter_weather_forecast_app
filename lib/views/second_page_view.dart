import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theweather/consts/colors.dart';
import 'package:theweather/consts/controllers.dart';
import 'package:theweather/consts/styles.dart';
import 'package:theweather/viewmodals/second_page_view_modal.dart';
import 'package:theweather/widgets/selected_location_container.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class SecondPageView extends StatefulWidget {
  const SecondPageView({super.key});

  @override
  State<SecondPageView> createState() => _SecondPageViewState();
}

class _SecondPageViewState extends State<SecondPageView> {
  late SecondPageViewModal secondPageViewModal;
  @override
  void initState() {
    super.initState();
    secondPageViewModal = context.read<SecondPageViewModal>();
    secondPageViewModal.getRequestFromSavedLocations();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: myLightPurple,
        title: Text(
          'Locations',
          style: MyStyles.myBlack.copyWith(fontSize: 24),
        ),
        actions: [
          IconButton(
              onPressed: () {
                addNewLocationsButtonFunction(context);
              },
              icon: Icon(
                Icons.add,
                color: myBlack,
              ))
        ],
      ),
      body: ListView.builder(
        itemCount: context.watch<SecondPageViewModal>().weatherModelList.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(16.0),
          child: Slidable(
            endActionPane: ActionPane(motion: BehindMotion(), children: [
              Center(
                child: IconButton(
                    onPressed: () {
                     
                        context
                          .read<SecondPageViewModal>()
                          .deleteLocationContainer(index);
                    },
                    icon: Icon(
                      Icons.delete,
                      color: myBlack,
                      size: 48,
                    )),
              )
            ]),
            child: SelectedLocationContainer(index: index),
          ),
        ),
      ),
    );
  }

  Future<dynamic> addNewLocationsButtonFunction(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: alertPurple,
        title: Container(
          decoration: BoxDecoration(
              border: Border.all(color: myBlack),
              borderRadius: BorderRadius.circular(25)),
          child: ListTile(
            title: TextField(
                controller: textFieldController,
                onChanged: (value) {
                  context.read<SecondPageViewModal>().fetchList(value);
                },
                decoration: const InputDecoration(
                    hintText: 'search a location',
                    border: UnderlineInputBorder(borderSide: BorderSide.none))),
            trailing: Icon(Icons.search),
          ),
        ),
        content: Container(
          width: MediaQuery.of(context).size.width * 0.40,
          height: MediaQuery.of(context).size.height * 0.3,
          decoration: BoxDecoration(
              border: Border.all(color: myBlack),
              borderRadius: BorderRadius.circular(25)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              itemCount: context.watch<SecondPageViewModal>().items?.length,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () async{
                await  context.read<SecondPageViewModal>().getCurrentWeather(
                      //bu satırlardaki nulll kontrolünü sağla
                      Provider.of<SecondPageViewModal>(context, listen: false)
                          .items![index]
                          .lat!,
                      Provider.of<SecondPageViewModal>(context, listen: false)
                          .items![index]
                          .lon!);
                  textFieldController.clear();
                  Provider.of<SecondPageViewModal>(context, listen: false)
                      .items
                      ?.clear();

                  Navigator.pop(context);
                },
                child: Text(
                  (context.watch<SecondPageViewModal>().items?[index].name) ??
                      '',
                  style: MyStyles.myBlack.copyWith(fontSize: 24),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
