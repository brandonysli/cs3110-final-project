type object_phrase = string list
(** The type [object_phrase] represents the object phrase that can be part of a
    Data Query command. Each element of the list represents a word of the object
    phrase, where a "word" is defined as a consecutive sequence of non-space
    characters. Thus, no element of the list should contain any leading,
    internal, or trailing spaces. The list is in the same order as the words in
    the original command *)

exception Empty
(** Raised when an empty command is parsed. *)

exception Malformed
(** Raised when a malformed command is parsed. *)

type condition =
  | Greater of (string * int)
  | Less of (string * int)
  | Equal of (string * int)

type column = Distinct of string list | Nondistinct of string list
type selection = Count of column | Column of column

type query = {
  columns : selection;
  table : string;
  condition : condition option;
}

val parse : string -> query
(** [parse str] parses a users's input into a [query] *)