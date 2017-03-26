-- 미션 탭 테이블 부분
select (MONTARGET*COUNT) from BD_GOAL where PK_GOAL=1;
select STARTDATE, FINISHDATE from BD_GOAL where PK_GOAL=1;
select MONTARGET from BD_GOAL where PK_GOAL=1;
select NOWTARGET from BD_GOAL where PK_GOAL=10;
select ACHIEVEMENT from BD_GOAL where PK_GOAL=10;

-- 미션 탭 챠트 부분 쿼리문 없이 하이챠트 따로 띄워도 ok
-- 미션 탭 챠트 부분 x축
select WHAT from BD_GOAL where PK_GOAL=1;
select WHAT from BD_GOAL where PK_GOAL=2;
select WHAT from BD_GOAL where PK_GOAL=4;
select WHAT from BD_GOAL where PK_GOAL=6;
select WHAT from BD_GOAL where PK_GOAL=7;
select WHAT from BD_GOAL where PK_GOAL=8;
select WHAT from BD_GOAL where PK_GOAL=9;

-- 미션 탭 챠트 부분 y축
select ACHIEVEMENT from BD_GOAL where PK_GOAL=1;
select ACHIEVEMENT from BD_GOAL where PK_GOAL=2;
select ACHIEVEMENT from BD_GOAL where PK_GOAL=4;
select ACHIEVEMENT from BD_GOAL where PK_GOAL=6;
select ACHIEVEMENT from BD_GOAL where PK_GOAL=7;
select ACHIEVEMENT from BD_GOAL where PK_GOAL=8;
select ACHIEVEMENT from BD_GOAL where PK_GOAL=9;
-----------------------------------------------------------------------------------------------

-- 수입 탭 테이블 부분
select INCOME, INTEREST_INCOME, TINCOME from BD_MONINCOMESAVING where MINCOME=1;

-- 수입 탭 챠트 부분 쿼리문 없이 하이챠트 따로 띄워도 ok
-- 수입 탭 챠트 부분 x축
select WHAT from BD_GOAL where PK_GOAL=6;
select WHAT from BD_GOAL where PK_GOAL=7;
select WHAT from BD_GOAL where PK_GOAL=8;
select WHAT from BD_GOAL where PK_GOAL=9;
select WHAT from BD_GOAL where PK_GOAL=10;

-- 수입 탭 챠트 부분 y축 (x축에 대하여 일정한 값을 넣을것임)
select INCOME from BD_MONINCOMESAVING where MINCOME=1;
select INTEREST_INCOME from BD_MONINCOMESAVING where MINCOME=1;
-----------------------------------------------------------------------------------------------

-- 지출 탭 테이블, 챠트 부분
select RESIDENTAL, MOBILE, TRANSPORT, DAILYSUP, RESTAURENT, GROCERY, COFFEE, ALCOHOL, FINANCE, HEALTH, CLOTHING, BEAUTY, EDUCATION, CULTURE, SPORTS, TRAVEL, TSPEND from BD_MONSPEND where MSPEND=1;
-----------------------------------------------------------------------------------------------

-- 저축 탭 테이블, 챠트 부분
select TINCOME from BD_MONINCOMESAVING where MINCOME=1;
select TSPEND from BD_MONINCOMESAVING where MINCOME=1;
select (TINCOME-TSPEND) from BD_MONINCOMESAVING where MINCOME=1;



-----------------------------------------------------------------------------------------------

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



