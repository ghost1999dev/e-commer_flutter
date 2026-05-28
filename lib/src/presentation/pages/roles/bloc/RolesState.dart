import 'package:equatable/equatable.dart';
import 'package:untitled/src/domain/models/Role.dart';

class RolesState extends Equatable {
  final List<Role?>? roles;
  const RolesState({
    this.roles
  });

  RolesState copyWidth({
    List<Role?>? roles
  }){
    return RolesState(
      roles: roles
    );
  }
  
  @override
  // TODO: implement props
  List<Object?> get props => [roles];
  
}