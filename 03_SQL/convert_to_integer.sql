-- SELECT convert_to_integer('1.654.654 ₫');

CREATE OR REPLACE FUNCTION convert_to_integer(input_str VARCHAR)
RETURNS INTEGER AS $$
DECLARE
    result INTEGER;
BEGIN
    -- Loại bỏ ký hiệu đồng và dấu chấm
    input_str := REPLACE(REPLACE(input_str, ' ₫', ''), '.', '');

    -- Chuyển đổi thành số nguyên
    BEGIN
        result := input_str::INTEGER;
    EXCEPTION
        WHEN OTHERS THEN
            -- Trong trường hợp lỗi, trả về NULL hoặc giá trị mặc định tùy thuộc vào yêu cầu của bạn
            result := NULL; 
    END;

    RETURN result;
END;
$$ LANGUAGE plpgsql;
