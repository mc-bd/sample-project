-- 분석 1  
-- 소득별 지출항목	개인 VS 통계청



select level,avg(CHACHACHA.food),avg(CHACHACHA.soju),avg(CHACHACHA.clothing),avg(CHACHACHA.housing),avg(CHACHACHA.supplies),avg(CHACHACHA.medical),avg(CHACHACHA.transportation),avg(CHACHACHA.communication),avg(CHACHACHA.entertainment),avg(CHACHACHA.education),avg(CHACHACHA.eatout),avg(CHACHACHA.etc) from CHACHACHA group by level having level=100

select level,avg(CHACHACHA.food),avg(CHACHACHA.soju),avg(CHACHACHA.clothing),avg(CHACHACHA.housing),avg(CHACHACHA.supplies),avg(CHACHACHA.medical),avg(CHACHACHA.transportation),avg(CHACHACHA.communication),avg(CHACHACHA.entertainment),avg(CHACHACHA.education),avg(CHACHACHA.eatout),avg(CHACHACHA.etc) from CHACHACHA group by level having level=200

select level,avg(CHACHACHA.food),avg(CHACHACHA.soju),avg(CHACHACHA.clothing),avg(CHACHACHA.housing),avg(CHACHACHA.supplies),avg(CHACHACHA.medical),avg(CHACHACHA.transportation),avg(CHACHACHA.communication),avg(CHACHACHA.entertainment),avg(CHACHACHA.education),avg(CHACHACHA.eatout),avg(CHACHACHA.etc) from CHACHACHA group by level having level=300

select level,avg(CHACHACHA.food),avg(CHACHACHA.soju),avg(CHACHACHA.clothing),avg(CHACHACHA.housing),avg(CHACHACHA.supplies),avg(CHACHACHA.medical),avg(CHACHACHA.transportation),avg(CHACHACHA.communication),avg(CHACHACHA.entertainment),avg(CHACHACHA.education),avg(CHACHACHA.eatout),avg(CHACHACHA.etc) from CHACHACHA group by level having level=400

select level,avg(CHACHACHA.food),avg(CHACHACHA.soju),avg(CHACHACHA.clothing),avg(CHACHACHA.housing),avg(CHACHACHA.supplies),avg(CHACHACHA.medical),avg(CHACHACHA.transportation),avg(CHACHACHA.communication),avg(CHACHACHA.entertainment),avg(CHACHACHA.education),avg(CHACHACHA.eatout),avg(CHACHACHA.etc) from CHACHACHA group by level having level=500

select level,avg(CHACHACHA.food),avg(CHACHACHA.soju),avg(CHACHACHA.clothing),avg(CHACHACHA.housing),avg(CHACHACHA.supplies),avg(CHACHACHA.medical),avg(CHACHACHA.transportation),avg(CHACHACHA.communication),avg(CHACHACHA.entertainment),avg(CHACHACHA.education),avg(CHACHACHA.eatout),avg(CHACHACHA.etc) from CHACHACHA group by level having level=600

select level,avg(CHACHACHA.food),avg(CHACHACHA.soju),avg(CHACHACHA.clothing),avg(CHACHACHA.housing),avg(CHACHACHA.supplies),avg(CHACHACHA.medical),avg(CHACHACHA.transportation),avg(CHACHACHA.communication),avg(CHACHACHA.entertainment),avg(CHACHACHA.education),avg(CHACHACHA.eatout),avg(CHACHACHA.etc) from CHACHACHA group by level having level=700

-- 분석 2

select level,avg(CHACHACHA.consumption),avg(CHACHACHA.nonconsumption),avg(surplus) from CHACHACHA group by level having level=100

select level,avg(CHACHACHA.consumption),avg(CHACHACHA.nonconsumption),avg(surplus) from CHACHACHA group by level having level=200

select level,avg(CHACHACHA.consumption),avg(CHACHACHA.nonconsumption),avg(surplus) from CHACHACHA group by level having level=300

select level,avg(CHACHACHA.consumption),avg(CHACHACHA.nonconsumption),avg(surplus) from CHACHACHA group by level having level=400

select level,avg(CHACHACHA.consumption),avg(CHACHACHA.nonconsumption),avg(surplus) from CHACHACHA group by level having level=500

select level,avg(CHACHACHA.consumption),avg(CHACHACHA.nonconsumption),avg(surplus) from CHACHACHA group by level having level=600

select level,avg(CHACHACHA.consumption),avg(CHACHACHA.nonconsumption),avg(surplus) from CHACHACHA group by level having level=700



