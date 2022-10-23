--cografideki distinctli veriler
select distinct(dosya_no)
from ebis_cbs_prod.cbs_kullanim
where dosya_no like 'EE%';


--sözeldeki distinctli veriler
select distinct(DOSYA_NO)
from EBIS_CBS_PROD.VW_ECRIMISIL;


--sözelde de coğrafide de distinctli şekilde olan kayıtlar, alttaki sql ile aynı sonuç çıkar
select distinct(dosya_no)
from ebis_cbs_prod.cbs_kullanim
where dosya_no like 'EE%'
  and dosya_no in (select distinct(DOSYA_NO)
                   from EBIS_CBS_PROD.VW_ECRIMISIL);


--sözelde de coğrafide de distinctli şekilde olan kayıtlar, üstteki sql ile aynı sonuç çıkar
select distinct(DOSYA_NO)
from EBIS_CBS_PROD.VW_ECRIMISIL
where dosya_no in (select distinct(dosya_no)
                   from ebis_cbs_prod.cbs_kullanim
                   where dosya_no like 'EE%');


--coğrafide olup sözelde olmayan dosya_noları
select distinct(dosya_no)
from ebis_cbs_prod.cbs_kullanim
where dosya_no like 'EE%'
  and dosya_no not in (select distinct(DOSYA_NO)
                       from EBIS_CBS_PROD.VW_ECRIMISIL);


--sözelde olup coğrafi tarafta olmayan dosya_noları
select distinct(DOSYA_NO)
from EBIS_CBS_PROD.VW_ECRIMISIL
where dosya_no not in (select distinct(dosya_no)
                       from ebis_cbs_prod.cbs_kullanim
                       where dosya_no like 'EE%');


--birden çok dosya_nosu olan veriler ve adetleri
select dosya_no, count(dosya_no)
from ebis_cbs_prod.VW_ECRIMISIL
group by dosya_no
having count(dosya_no) > 1;