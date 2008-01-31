
create function replace (varchar, varchar, varchar) returns varchar as '
declare
    string alias for $1;
    sub alias for $2;
    replacement alias for $3;
    -- xxxxxxxxxxx[MATCH]xxxxxxxxxxxx
    --           | end_before
    --                   | start_after
    match integer;
    end_before integer;
    start_after integer;
    string_replaced varchar;
    string_remainder varchar;
begin
    string_remainder := string;
    string_replaced := '''';
    match := position(sub in string_remainder);

    while match > 0 loop
        end_before := match - 1;
        start_after := match + length(sub);
        string_replaced := string_replaced || substr(string_remainder, 1, end_b
efore) || replacement;
        string_remainder := substr(string_remainder, start_after);
        match := position(sub in string_remainder);
    end loop;
    string_replaced := string_replaced || string_remainder;

    return string_replaced;
end;
' LANGUAGE 'plpgsql';