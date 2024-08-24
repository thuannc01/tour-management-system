-- SELECT convert_to_integer('1.654.654 ₫');

CREATE OR REPLACE FUNCTION convert_to_integer(input_str VARCHAR)
RETURNS INTEGER AS $$
DECLARE
    result INTEGER;
BEGIN
    input_str := REPLACE(REPLACE(input_str, ' ₫', ''), '.', '');

    BEGIN
        result := input_str::INTEGER;
    EXCEPTION
        WHEN OTHERS THEN
            result := NULL; 
    END;

    RETURN result;
END;
$$ LANGUAGE plpgsql;
