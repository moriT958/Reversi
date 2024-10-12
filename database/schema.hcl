table "games" {
  schema = schema.main
  column "id" {
    null           = true
    type           = integer
    auto_increment = true
  }
  column "started_at" {
    null = false
    type = datetime
  }
  primary_key {
    columns = [column.id]
  }
}
table "turns" {
  schema = schema.main
  column "id" {
    null           = true
    type           = integer
    auto_increment = true
  }
  column "game_id" {
    null = false
    type = integer
  }
  column "turn_count" {
    null = false
    type = integer
  }
  column "next_disc" {
    null = true
    type = integer
  }
  column "end_at" {
    null = false
    type = datetime
  }
  primary_key {
    columns = [column.id]
  }
  foreign_key "0" {
    columns     = [column.game_id]
    ref_columns = [table.games.column.id]
    on_update   = NO_ACTION
    on_delete   = NO_ACTION
  }
  index "turns_game_id_turn_count" {
    unique  = true
    columns = [column.game_id, column.turn_count]
  }
}
table "moves" {
  schema = schema.main
  column "id" {
    null           = true
    type           = integer
    auto_increment = true
  }
  column "turn_id" {
    null = false
    type = integer
  }
  column "disc" {
    null = false
    type = integer
  }
  column "x" {
    null = false
    type = integer
  }
  column "y" {
    null = false
    type = integer
  }
  primary_key {
    columns = [column.id]
  }
  foreign_key "0" {
    columns     = [column.turn_id]
    ref_columns = [table.turns.column.id]
    on_update   = NO_ACTION
    on_delete   = NO_ACTION
  }
}
table "squares" {
  schema = schema.main
  column "id" {
    null           = true
    type           = integer
    auto_increment = true
  }
  column "turn_id" {
    null = false
    type = integer
  }
  column "x" {
    null = false
    type = integer
  }
  column "y" {
    null = false
    type = integer
  }
  column "disc" {
    null = false
    type = integer
  }
  primary_key {
    columns = [column.id]
  }
  foreign_key "0" {
    columns     = [column.turn_id]
    ref_columns = [table.turns.column.id]
    on_update   = NO_ACTION
    on_delete   = NO_ACTION
  }
  index "squares_turn_id_x_y" {
    unique  = true
    columns = [column.turn_id, column.x, column.y]
  }
}
table "game_results" {
  schema = schema.main
  column "id" {
    null           = true
    type           = integer
    auto_increment = true
  }
  column "game_id" {
    null = false
    type = integer
  }
  column "winner_disc" {
    null = false
    type = integer
  }
  column "end_at" {
    null = false
    type = datetime
  }
  primary_key {
    columns = [column.id]
  }
  foreign_key "0" {
    columns     = [column.game_id]
    ref_columns = [table.games.column.id]
    on_update   = NO_ACTION
    on_delete   = NO_ACTION
  }
}
schema "main" {
}
