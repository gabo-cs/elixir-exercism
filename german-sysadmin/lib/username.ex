defmodule Username do
  def sanitize(~c""), do: ~c""

  def sanitize([head | tail]) do
    char =
      case head do
        ?ä -> ~c"ae"
        ?ö -> ~c"oe"
        ?ü -> ~c"ue"
        ?ß -> ~c"ss"
        head when head in ?a..?z -> [head]
        ?_ -> ~c"_"
        _ -> ~c""
      end

    char ++ sanitize(tail)
  end
end
