CREATE OR REPLACE FUNCTION get_diq_result()
RETURNS JSONB
LANGUAGE plpgsql
AS $$
DECLARE
    result JSONB := '{}'::jsonb;   -- Initialize as empty JSONB object
    temp JSONB;
BEGIN
    -- Query 1: etl_cidata_report_test
    SELECT jsonb_agg(t) INTO temp
    FROM (
        SELECT responselogid, distnid, "Sequence No"
        FROM etl_cidata_report_test
    ) t;
    result := jsonb_set(result, '{etl_cidata_report_test}', temp, true);

    -- Query 2: n8n_vectorstore_test
    SELECT jsonb_agg(t) INTO temp
    FROM (
        SELECT id, text
        FROM n8n_vectorstore_test
        WHERE id = 23
    ) t;
    result := jsonb_set(result, '{n8n_vectorstore_test}', temp, true);

    RETURN result;
END;
$$;
