import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'model/ItemModel.dart';

class ItemRow extends StatelessWidget {
  const ItemRow({super.key, required this.itemModel, required this.onItemSelected});

  final ItemModel itemModel;
  final Function(ItemModel) onItemSelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                itemModel.iconData,
                color: itemModel.color,
                size: 42,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(itemModel.title),
              ),
            ],
          ),
          OutlinedButton(
            onPressed: () {
              onItemSelected.call(itemModel);
            },
            child: Text(itemModel.count.toString()),
            // Optional: customize the button's appearance
            style: OutlinedButton.styleFrom(
              primary: itemModel.color,
              // Set text color
              side: BorderSide(color: itemModel.color, width: 1),
              shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(20)), // Set rounded corners
            ),
          ),
        ],
      ),
    );
  }
}
