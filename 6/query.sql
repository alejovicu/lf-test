-- List of female users that are not reported as missing, that have A+ blood type and haven't reset their password since 3 months ago.

SELECT
    person_uuid.*
FROM
    person_uuid,
    person_details,
    person_missing,
    person_pysical,
    users,
    old_passwords
LEFT JOIN person_missing ON person_uuid.p_uuid = person_missing.p_uuid
WHERE   person_missing.p_uuid IS NULL
AND     person_uuid.p_uuid = person_details.p_uuid
AND     person_uuid.p_uuid = person_pysical.p_uuid
AND     person_uuid.p_uuid = users.p_uuid
AND     users.p_uuid = old_passwords.p_uuid
AND     person_details.opt_gender = 'female'
AND     person_pysical.opt_blood_type = 'A+'
AND     old_passwords.changed_timestamp > NOW() - INTERVAL '90 days' -- for PostgreSQL