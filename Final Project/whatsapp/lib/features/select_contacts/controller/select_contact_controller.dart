import 'package:flutter/cupertino.dart';
import 'package:flutter_contacts/flutter_contacts.dart.';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_app/features/select_contacts/repositry/select_contacts_repositry.dart';

final getContactProvider = FutureProvider(
        (ref) {
          final selectContactRepositry = ref.watch(selectContactRepositryProvider);
          return selectContactRepositry.getContacts();
        }
);

final selectContactControllerprovider = Provider((ref) {
  final selectContactRepositry = ref.watch(selectContactRepositryProvider);
  return SelectContactController(
    ref:  ref,
    selectContactRepositry: selectContactRepositry,
  );
});

class SelectContactController{
  final ProviderRef ref;
  final SelectContactRepositry selectContactRepositry;

  SelectContactController({
    required this.ref,
    required this.selectContactRepositry
  });

  void selectContacts(Contact selectedContact, BuildContext context){
    selectContactRepositry.selectContact(selectedContact, context);
  }
}