SELECT
    {{ convert_epoch_to_timestamp("f", "input") }} AS output
FROM {{ ref('convert_epoch_to_timestamp_fixture') }} f
WHERE output <> f.expected