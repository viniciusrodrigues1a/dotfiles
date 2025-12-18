(
  (comment) @trigger
  .
  (variable_declaration 
	(assignment_statement ((expression_list (string (string_content) @injection.content)))))
  (#match? @trigger "language: sql")
  (#set! injection.language "sql")
)
