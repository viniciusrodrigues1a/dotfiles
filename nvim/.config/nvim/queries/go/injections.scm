(
  (comment) @trigger
  .
  (var_declaration (var_spec (expression_list (raw_string_literal (raw_string_literal_content) @injection.content))))
  (#match? @trigger "language: sql")
  (#set! injection.language "sql")
)

(
  (comment) @trigger
  .
  (var_declaration (var_spec (expression_list (interpreted_string_literal (interpreted_string_literal_content) @injection.content))))
  (#match? @trigger "language: sql")
  (#set! injection.language "sql")
)

