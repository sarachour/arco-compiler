open Util;;

type 'a partition = {
    els : (string,'a) map queue;
    tostr : 'a -> string
}

module MapPartition =
struct

  let mk tostr : 'a partition=
    {els=QUEUE.make (); tostr=tostr}


  let destroy part =
    QUEUE.destroy part.els

  let get_partitions (type a) (part:a partition)
      (lst:a list) =
    let matchpart (els:(string,a) map)  =
      List.fold_right 
        (fun x r ->
           MAP.has els (part.tostr x) || r
        ) lst false 
    in
    QUEUE.split part.els matchpart 

  let iter (part:'a partition) (f:'a list -> unit) : unit =
    QUEUE.iter part.els (fun mp ->
        let vls = (MAP.to_values mp) in
        f vls
      )
  let add_partition (type a) (part:a partition)
      (xs:a list)  =
    let matches,rest = get_partitions part xs in
    match matches with
      | [s] ->
        begin
          List.iter
            (fun x -> noop (MAP.put s (part.tostr x) x))
            xs;
          ()

        end
      | [] ->
        begin
          let s = MAP.make () in
          List.iter
            (fun x -> noop (MAP.put s (part.tostr x) x))
          xs;
          noop (QUEUE.enqueue part.els s);
          ()
        end
      | _ ->
        begin
          let giant = MAP.make () in
          List.iter (fun s ->
              MAP.iter s (fun k v ->
                  noop (MAP.put giant k v )
                ) 
            ) matches;
          QUEUE.clear part.els;
          noop (QUEUE.enqueue_all part.els rest);
          noop (QUEUE.enqueue part.els giant);
          ()
        end

  end
