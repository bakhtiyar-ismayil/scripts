SELECT COUNT(1) AS Count
FROM (
    SELECT
        f.triggerid,
        MIN(zabbix.hosts.host) AS host,
        MIN(t.description) AS description,
        MIN(e.acknowledged) AS acknowledged,
        MIN(t.value) AS value,
        MIN(p.severity) AS severity
 
