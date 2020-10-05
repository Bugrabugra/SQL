create
or
replace
TRIGGER UNI_TRIGGER_CBS_KULLANIM
/*
FLX_MEKANSAL_ID kolonunun otomatik doldurulmasi icin hazirlanmistir.
Hazirlayan: Bugra Otken
Olusturma Tarihi: 11/07/2018
Versiyon: 1.0
*/
BEFORE
INSERT
ON CBS_KULLANIM
    FOR EACH ROW
BEGIN
SELECT UNI_SEQUENCE.NEXTVAL
INTO : new.FLX_MEKANSAL_ID
FROM dual;
END;
