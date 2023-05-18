import 'package:core_folders/app_lib.dart';

abstract class PermissionService {
  Future<PermissionStatus> requestPermission(Permission permission);
  Future<PermissionStatus> getPermissionStatus(Permission permission);
  Future<bool> permissionIsGranted(Permission permission);
}