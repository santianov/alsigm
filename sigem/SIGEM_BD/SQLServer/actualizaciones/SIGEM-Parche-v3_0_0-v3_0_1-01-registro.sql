-- Actualizamos el contador de Dept.
UPDATE IUSERNEXTID SET ID = (SELECT (MAX(ID) + 1) FROM IUSERDEPTHDR) WHERE TYPE=2;

-- Borramos de la tabla SCR_CONTADOR el contador de dept. IUSERDEPTHDR
DELETE FROM SCR_CONTADOR WHERE TABLAID='IUSERDEPTHDR';
