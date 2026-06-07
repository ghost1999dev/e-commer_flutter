import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/src/presentation/pages/client/profile/bloc/ClientPofileBloc.dart';
import 'package:untitled/src/presentation/pages/client/profile/bloc/ClientProfileState.dart';
import 'package:untitled/src/presentation/pages/widgets/DefaultBuildField.dart';

class ClientProfilePage extends StatefulWidget {
  const ClientProfilePage({super.key});

  @override
  State<ClientProfilePage> createState() => _ClientProfilePageState();
}

class _ClientProfilePageState extends State<ClientProfilePage> {
  ClientProfileBloc? _bloc;
  @override
  Widget build(BuildContext context) {
    _bloc = BlocProvider.of<ClientProfileBloc>(context, listen: false);
    return Scaffold(
        appBar: AppBar(
          title: const Text('ShopEase',
              style: TextStyle(fontWeight: FontWeight.bold)),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
        backgroundColor: const Color(0xFFF5F5F5),
        body: BlocBuilder<ClientProfileBloc, ClientProfileState>(
            builder: (context, state) {
          final user = state.authResponse?.createUserResponse;
          return SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  color: Colors.white,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 24),
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              CircleAvatar(
                                radius: 48,
                                backgroundColor: Colors.grey.shade300,
                                backgroundImage: user?.image != null
                                    ? NetworkImage(user!.image!)
                                    : null,
                                child: user?.image == null
                                    ? const Icon(Icons.person, size: 50)
                                    : null,
                              ),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: Container(
                                  padding: const EdgeInsets.all(6),
                                  child: const Icon(
                                    Icons.camera_alt,
                                    size: 25,
                                    color: Colors.green,
                                  ),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 12),
                          Text(
                           '${user?.name ?? ''} ${user?.lastName ?? ''}',
                            style: TextStyle(color: Colors.grey.shade600),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '${user?.email ?? ''}',
                            style: TextStyle(
                                color: Colors.grey.shade600, fontSize: 13),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 20, top: 20),
                        child: Text(
                          "QUICK ACTIONS",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                        ),
                      ),
                      ListTile(
                        leading: const Icon(Icons.lock_outline),
                        title: const Text('Change Password'),
                        trailing: const Icon(Icons.chevron_right),
                        onTap: () {},
                      ),
                      ListTile(
                        leading: const Icon(Icons.notification_add_outlined),
                        title: const Text("Notificaciones"),
                        trailing: const Icon(Icons.chevron_right),
                        onTap: () {},
                      )
                    ],
                  ),
                ),
                SizedBox(height: 16),
                Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "PERSONAL INFORMATION",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                          ),
                          const SizedBox(height: 16),
                          DefaultBuildField(
                            icon: Icons.person_outline,
                            label: "Nombre completo",
                            initialValue:state.name.value,
                            hint: "Nombre Completo",
                            onChange: (value) {},
                            readOnly: true,
                            isNumber: false,
                          ),
                          const SizedBox(height: 10),
                          DefaultBuildField(
                            icon: Icons.email_outlined,
                            label: "Correo Electronico",
                            initialValue: user?.email ?? '',
                            hint: "Email",
                            onChange: (value) {},
                            readOnly: true,
                            isNumber: false,
                          ),
                          const SizedBox(height: 10),
                          DefaultBuildField(
                              icon: Icons.phone_outlined,
                              label: "Telefono",
                              initialValue: state.phone.value.isNotEmpty
                                ? state.phone.value
                                : (user?.phone ??''),
                              hint: "Telefono",
                              onChange: (value) {},
                              readOnly: true,
                              isNumber: true),
                          const SizedBox(height: 32),
                          SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF1B5E20),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                              ),
                              onPressed: () {},
                              child: const Text(
                                "Guardar Datos",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        }));
  }
}
