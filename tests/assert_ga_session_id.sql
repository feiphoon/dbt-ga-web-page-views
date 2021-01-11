SELECT
    {{ ga_session_id("f") }}
FROM {{ ref('ga_session_id_fixture') }} f
WHERE session_id <> f.session_id