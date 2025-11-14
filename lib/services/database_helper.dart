import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:task_notes_manager/models/TaskItem.dart';
class database_helper{

  database_helper._privateConstructor();
  static final database_helper instance=database_helper._privateConstructor();

  final _dbname='tasks.db';
  final _dbversion=1;

  static Database? _database;

  Future<Database> get database async{
    if(_database!=null){return _database!;}
    else
    _database=  await _initDatabase();
    return _database!;
  }

  Future <Database> _initDatabase() async{
    final databasePath=await getDatabasesPath();
    final path=join(databasePath,_dbname);

    return await openDatabase(path,
    version: _dbversion,
      onCreate: _onCreate,
    );

  }

  Future _onCreate(Database db,int version) async{
   await db.execute('''
   CREATE TABLE Tasks(
   id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT NOT NULL,
        priority TEXT NOT NULL,
        description TEXT NOT NULL,
        isCompleted INTEGER NOT NULL
   )
   ''');
  }

  Future<int> insertTask(Taskitem task) async {
    final db = await database;
    return await db.insert(
      'tasks',
      task.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Map<String,dynamic>>> getAllTasks() async {
    final db = await database;  // 1. Open DB

    final List<Map<String, dynamic>> maps = await db.query('tasks'); // 2. Read all rows

    return maps;

  }



  Future<int> deleteTask(int id) async {
    final db = await database;

    return await db.delete(
      'tasks',                 // table name
      where: 'id = ?',         // which row to delete
      whereArgs: [id],
    );
  }







}