// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  GiocoDao? _giocodaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Gioco` (`id` INTEGER, `nome` TEXT NOT NULL, `descrizione` TEXT NOT NULL, `prezzo` TEXT NOT NULL, `sconto` TEXT NOT NULL, `mail_editore` TEXT NOT NULL, `main_img` TEXT NOT NULL, `valutazione` TEXT NOT NULL, `data_pubblicazione` TEXT NOT NULL, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Utentedb` (`id` INTEGER, `nome` TEXT NOT NULL, `password` TEXT NOT NULL, `e_mail` TEXT NOT NULL, `cognome` TEXT NOT NULL, `data_nascita` TEXT NOT NULL, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `NetworkSpec` (`id` INTEGER NOT NULL, `ipaddress` TEXT NOT NULL, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  GiocoDao get giocodao {
    return _giocodaoInstance ??= _$GiocoDao(database, changeListener);
  }
}

class _$GiocoDao extends GiocoDao {
  _$GiocoDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _giocoInsertionAdapter = InsertionAdapter(
            database,
            'Gioco',
            (Gioco item) => <String, Object?>{
                  'id': item.id,
                  'nome': item.nome,
                  'descrizione': item.descrizione,
                  'prezzo': item.prezzo,
                  'sconto': item.sconto,
                  'mail_editore': item.mail_editore,
                  'main_img': item.main_img,
                  'valutazione': item.valutazione,
                  'data_pubblicazione': item.data_pubblicazione
                }),
        _utentedbInsertionAdapter = InsertionAdapter(
            database,
            'Utentedb',
            (Utentedb item) => <String, Object?>{
                  'id': item.id,
                  'nome': item.nome,
                  'password': item.password,
                  'e_mail': item.e_mail,
                  'cognome': item.cognome,
                  'data_nascita': item.data_nascita
                }),
        _networkSpecInsertionAdapter = InsertionAdapter(
            database,
            'NetworkSpec',
            (NetworkSpec item) =>
                <String, Object?>{'id': item.id, 'ipaddress': item.ipaddress}),
        _giocoUpdateAdapter = UpdateAdapter(
            database,
            'Gioco',
            ['id'],
            (Gioco item) => <String, Object?>{
                  'id': item.id,
                  'nome': item.nome,
                  'descrizione': item.descrizione,
                  'prezzo': item.prezzo,
                  'sconto': item.sconto,
                  'mail_editore': item.mail_editore,
                  'main_img': item.main_img,
                  'valutazione': item.valutazione,
                  'data_pubblicazione': item.data_pubblicazione
                }),
        _utentedbUpdateAdapter = UpdateAdapter(
            database,
            'Utentedb',
            ['id'],
            (Utentedb item) => <String, Object?>{
                  'id': item.id,
                  'nome': item.nome,
                  'password': item.password,
                  'e_mail': item.e_mail,
                  'cognome': item.cognome,
                  'data_nascita': item.data_nascita
                }),
        _networkSpecUpdateAdapter = UpdateAdapter(
            database,
            'NetworkSpec',
            ['id'],
            (NetworkSpec item) =>
                <String, Object?>{'id': item.id, 'ipaddress': item.ipaddress}),
        _giocoDeletionAdapter = DeletionAdapter(
            database,
            'Gioco',
            ['id'],
            (Gioco item) => <String, Object?>{
                  'id': item.id,
                  'nome': item.nome,
                  'descrizione': item.descrizione,
                  'prezzo': item.prezzo,
                  'sconto': item.sconto,
                  'mail_editore': item.mail_editore,
                  'main_img': item.main_img,
                  'valutazione': item.valutazione,
                  'data_pubblicazione': item.data_pubblicazione
                }),
        _utentedbDeletionAdapter = DeletionAdapter(
            database,
            'Utentedb',
            ['id'],
            (Utentedb item) => <String, Object?>{
                  'id': item.id,
                  'nome': item.nome,
                  'password': item.password,
                  'e_mail': item.e_mail,
                  'cognome': item.cognome,
                  'data_nascita': item.data_nascita
                }),
        _networkSpecDeletionAdapter = DeletionAdapter(
            database,
            'NetworkSpec',
            ['id'],
            (NetworkSpec item) =>
                <String, Object?>{'id': item.id, 'ipaddress': item.ipaddress});

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Gioco> _giocoInsertionAdapter;

  final InsertionAdapter<Utentedb> _utentedbInsertionAdapter;

  final InsertionAdapter<NetworkSpec> _networkSpecInsertionAdapter;

  final UpdateAdapter<Gioco> _giocoUpdateAdapter;

  final UpdateAdapter<Utentedb> _utentedbUpdateAdapter;

  final UpdateAdapter<NetworkSpec> _networkSpecUpdateAdapter;

  final DeletionAdapter<Gioco> _giocoDeletionAdapter;

  final DeletionAdapter<Utentedb> _utentedbDeletionAdapter;

  final DeletionAdapter<NetworkSpec> _networkSpecDeletionAdapter;

  @override
  Future<List<Gioco>> getPost() async {
    return _queryAdapter.queryList('SELECT * FROM Gioco',
        mapper: (Map<String, Object?> row) => Gioco(
            id: row['id'] as int?,
            nome: row['nome'] as String,
            descrizione: row['descrizione'] as String,
            prezzo: row['prezzo'] as String,
            sconto: row['sconto'] as String,
            mail_editore: row['mail_editore'] as String,
            main_img: row['main_img'] as String,
            valutazione: row['valutazione'] as String,
            data_pubblicazione: row['data_pubblicazione'] as String));
  }

  @override
  Future<Gioco?> findGiocoById(int id) async {
    return _queryAdapter.query('SELECT * FROM Gioco WHERE id = ?1',
        mapper: (Map<String, Object?> row) => Gioco(
            id: row['id'] as int?,
            nome: row['nome'] as String,
            descrizione: row['descrizione'] as String,
            prezzo: row['prezzo'] as String,
            sconto: row['sconto'] as String,
            mail_editore: row['mail_editore'] as String,
            main_img: row['main_img'] as String,
            valutazione: row['valutazione'] as String,
            data_pubblicazione: row['data_pubblicazione'] as String),
        arguments: [id]);
  }

  @override
  Future<List<Utentedb>> getUtentedb() async {
    return _queryAdapter.queryList('SELECT * FROM Utentedb',
        mapper: (Map<String, Object?> row) => Utentedb(
            id: row['id'] as int?,
            nome: row['nome'] as String,
            password: row['password'] as String,
            e_mail: row['e_mail'] as String,
            cognome: row['cognome'] as String,
            data_nascita: row['data_nascita'] as String));
  }

  @override
  Future<Utentedb?> findUtentedbById(int id) async {
    return _queryAdapter.query('SELECT * FROM Utentedb WHERE id = ?1',
        mapper: (Map<String, Object?> row) => Utentedb(
            id: row['id'] as int?,
            nome: row['nome'] as String,
            password: row['password'] as String,
            e_mail: row['e_mail'] as String,
            cognome: row['cognome'] as String,
            data_nascita: row['data_nascita'] as String),
        arguments: [id]);
  }

  @override
  Future<List<NetworkSpec>> getNetworkSpec() async {
    return _queryAdapter.queryList('SELECT * FROM NetworkSpec',
        mapper: (Map<String, Object?> row) => NetworkSpec(
            id: row['id'] as int, ipaddress: row['ipaddress'] as String));
  }

  @override
  Future<void> insertGioco(Gioco item) async {
    await _giocoInsertionAdapter.insert(item, OnConflictStrategy.abort);
  }

  @override
  Future<void> insertGiochi(List<Gioco> items) async {
    await _giocoInsertionAdapter.insertList(items, OnConflictStrategy.abort);
  }

  @override
  Future<void> insertUtentedb(Utentedb item) async {
    await _utentedbInsertionAdapter.insert(item, OnConflictStrategy.abort);
  }

  @override
  Future<void> insertUtenti(List<Utentedb> items) async {
    await _utentedbInsertionAdapter.insertList(items, OnConflictStrategy.abort);
  }

  @override
  Future<void> insertNetworkSpec(NetworkSpec item) async {
    await _networkSpecInsertionAdapter.insert(item, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateGioco(Gioco item) async {
    await _giocoUpdateAdapter.update(item, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateGiochi(List<Gioco> items) async {
    await _giocoUpdateAdapter.updateList(items, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateUtentedb(Utentedb item) async {
    await _utentedbUpdateAdapter.update(item, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateUtenti(List<Utentedb> items) async {
    await _utentedbUpdateAdapter.updateList(items, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateNetworkSpec(NetworkSpec item) async {
    await _networkSpecUpdateAdapter.update(item, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteGioco(Gioco item) async {
    await _giocoDeletionAdapter.delete(item);
  }

  @override
  Future<void> deleteGiochi(List<Gioco> items) async {
    await _giocoDeletionAdapter.deleteList(items);
  }

  @override
  Future<void> deleteUtentedb(Utentedb items) async {
    await _utentedbDeletionAdapter.delete(items);
  }

  @override
  Future<void> deleteUtenti(List<Utentedb> items) async {
    await _utentedbDeletionAdapter.deleteList(items);
  }

  @override
  Future<void> deleteNetworkSpec(NetworkSpec items) async {
    await _networkSpecDeletionAdapter.delete(items);
  }
}
