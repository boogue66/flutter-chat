import 'package:flutter/material.dart';
import 'package:chat/models/usuarios_model.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class UsuariosPage extends StatefulWidget {
  const UsuariosPage({super.key});

  @override
  State<UsuariosPage> createState() => _UsuariosPageState();
}

class _UsuariosPageState extends State<UsuariosPage> {
  final usuarios = [
    Usuario(
        uid: '1', email: 'mail11@mail.com', nombre: 'Usuario 1', online: true),
    Usuario(
        uid: '2', email: 'mail22@mail.com', nombre: 'Usuario 2', online: true),
    Usuario(
        uid: '3', email: 'mail33@mail.com', nombre: 'Usuario 3', online: false),
    Usuario(
        uid: '4', email: 'mail44@mail.com', nombre: 'Usuario 4', online: true),
    Usuario(
        uid: '5', email: 'mail55@mail.com', nombre: 'Usuario 5', online: false),
  ];
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Titulo', style: TextStyle(color: Colors.black54)),
        elevation: 1,
        backgroundColor: Colors.white,
        leading: IconButton(
          color: Colors.black54,
          icon: const Icon(Icons.exit_to_app),
          onPressed: () {},
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            //child: Icon(Icons.error, color: Colors.red[400]),
            child: Icon(Icons.check_circle, color: Colors.blue[400]),
          )
        ],
      ),
      body: SmartRefresher(
        controller: _refreshController,
        enablePullDown: true,
        onRefresh: _cargarUsuario,
        child: _listViewUsuarios(),
      ),
    );
  }

  ListView _listViewUsuarios() {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemBuilder: (_, i) => _usuarioListTile(usuarios[i]),
      separatorBuilder: (_, i) => const Divider(thickness: 1),
      itemCount: usuarios.length,
    );
  }

  ListTile _usuarioListTile(Usuario usuario) {
    return ListTile(
      title: Text(usuario.nombre),
      subtitle: Text(usuario.email),
      leading: CircleAvatar(
        backgroundColor: Colors.white,
        child: Text(usuario.nombre.substring(0, 2)),
      ),
      trailing: Container(
        width: 10,
        height: 10,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: usuario.online ? Colors.greenAccent : Colors.orangeAccent),
      ),
    );
  }

  _cargarUsuario() async {
    await Future.delayed(const Duration(milliseconds: 1000));

    _refreshController.refreshCompleted();
  }
}
