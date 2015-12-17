open CompileUtil

module SimParserGenerator = struct

  let string_to_lexbuf f =
    let lexbuf = Lexing.from_string f in
    lexbuf

  let file_to_lexbuf f =
    let in_chan = open_in(f) in
    let lexbuf = Lexing.from_channel in_chan in
    lexbuf

  let file_to_slnspec fn =
    let lb = file_to_lexbuf fn in
    let res = parse_lexbuf "sln" (fun x -> ParseSln.sln LexSln.sln x) lb in
    res
    
  let file_to_simcfg fn =
    let lb = file_to_lexbuf fn in
    let res = parse_lexbuf "simconf" (fun x -> ParseSimCfg.cfg LexSimCfg.cfg x) lb in
    res

end
