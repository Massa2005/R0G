import 'package:floor/floor.dart';

import 'models.dart';

@dao
abstract class GiocoDao {
  @Query('SELECT * FROM Gioco')
  Future<List<Gioco>> getPost();

  @Query('SELECT * FROM Gioco WHERE id = :id')
  Future<Gioco?> findGiocoById(int id);

  @insert
  Future<void> insertGioco(Gioco item);

  @insert
  Future<void> insertGiochi(List<Gioco> items);

  @update
  Future<void> updateGioco(Gioco item);

  @update
  Future<void> updateGiochi(List<Gioco> items);

  @delete
  Future<void> deleteGioco(Gioco item);

  @delete
  Future<void> deleteGiochi(List<Gioco> items);
  @Query('SELECT * FROM Utentedb')
  Future<List<Utentedb>> getUtentedb();

  @Query('SELECT * FROM Utentedb WHERE id = :id')
  Future<Utentedb?> findUtentedbById(int id);

  @insert
  Future<void> insertUtentedb(Utentedb item);

  @insert
  Future<void> insertUtenti(List<Utentedb> items);

  @update
  Future<void> updateUtentedb(Utentedb item);

  @update
  Future<void> updateUtenti(List<Utentedb> items);

  @delete
  Future<void> deleteUtentedb(Utentedb items);

  @delete
  Future<void> deleteUtenti(List<Utentedb> items);




  @Query('SELECT * FROM NetworkSpec')
  Future<List<NetworkSpec>> getNetworkSpec();

  @insert
  Future<void> insertNetworkSpec(NetworkSpec item);

  @update
  Future<void> updateNetworkSpec(NetworkSpec item);

  @delete
  Future<void> deleteNetworkSpec(NetworkSpec items);
  
  
}