select mahalle,
       uavt,
       sum(tahak),
       sum(tahsil),
       sum(tahak) - sum(tahsil) as borc,
       round(sum(tahsil) / (sum(tahak) / 100), 0) as oran
from (select abs_mahalle.adi as mahalle,
             ABS_MAHALLE.UAVT_KODU as uavt,
             SUM(BGS_TAHAK.TAHAKKUK_TUTARI) as tahak,
             (SELECT SUM(TUTAR)
              FROM BGS_TAHSIL
              WHERE BGS_TAHSIL.ID_BGS_TAHAK = BGS_TAHAK.ID
                AND BGS_TAHSIL.TURU IN ('BANKA', 'NORMAL', 'MAHSUP', 'POSTA')) as tahsil
      from abs_mahalle,
           kbs_adres,
           bgs_beyan,
           bgs_tahak
      where abs_mahalle.id = kbs_adres.id_abs_mahalle
        and kbs_adres.id = bgs_beyan.id_kbs_adres
        and bgs_tahak.id_bgs_beyan = bgs_beyan.id
        and bgs_tahak.kapama_turu in ('ACIK', 'HUKUKSAL_SURECTE')
        and abs_mahalle.uavt_kodu is not null
        and bgs_tahak.yil = 2019 --**********  yıl zorunlu alan, Bu kısımdaki yıllar şu şekilde comboya doldurulur. Bulunan yıldan 4 sene önceki yıla kadar. Şu an ise 2019, 2018, 2017, 2016, 2015 olmalıdır. 2020'de ise 2020, 2019, 2018, 2017, 2016 olmalıdır.
--and     BGS_TAHAK.ID_BGP_SERVIS=1230 --********** servis seçimli alan. Bu combo bu sql ile doldurulur. select adi,id from bgp_servis where aktif='EVET' order by adi;
--and ABS_MAHALLE.UAVT_KODU = 153131 --********** ara düğmesine basınca bu kod çalışmaz, Detay düğmesine basınca bu kod SQL'e eklenir ve sadece o mahalledeki değerler sorgulanır.
      GROUP BY ABS_MAHALLE.ADI, ABS_MAHALLE.UAVT_KODU, BGS_TAHAK.ID)
group by mahalle, uavt
order by 3 desc;

