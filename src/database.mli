type value =
  | Int of int
  | Float of float
  | String of string
  | Bool of bool

type row = value list
type table

type database = {
  db_name : string;
  db_owner : string;
  tables : table list;
}

val get_name : table -> string
val add_table : string -> string list -> database -> database
val pp_databases : database list -> unit
