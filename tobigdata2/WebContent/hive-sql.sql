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
select HOUSING, TRANSPORTATION, COMMUNICATION, SUPPLIES, EATOUT, FOOD, SOJU, MEDICAL, CLOTHING, EDUCATION, ENTERTAINMENT, ETC  from BD_MONSPEND where MSPEND=1;
-----------------------------------------------------------------------------------------------

-- 저축 탭 테이블, 챠트 부분
select TINCOME from BD_MONINCOMESAVING where MINCOME=1;
select TSPEND from BD_MONINCOMESAVING where MINCOME=1;
select (TINCOME-TSPEND) from BD_MONINCOMESAVING where MINCOME=1;

-- 저축 탭 챠트 부분 쿼리문 없이 하이챠트 따로 띄워도 ok
-----------------------------------------------------------------------------------------------

-- 분석 1  
-- 소득별 지출항목	개인 VS 통계청

select 
HOUSING,
TRANSPORTATION,
COMMUNICATION,
SUPPLIES,
EATOUT,
FOOD,
SOJU,
MEDICAL,
CLOTHING,
EDUCATION,
ENTERTAINMENT,
ETC from BD_MONSPEND where MSPEND=1;


select
level,
avg(CHACHACHA.housing) HOUSING,
avg(CHACHACHA.transportation) TRANSPORTATION,
avg(CHACHACHA.communication) COMMUNICATION,
avg(CHACHACHA.supplies) SUPPLIES,
avg(CHACHACHA.eatout) EATOUT,
avg(CHACHACHA.food) FOOD,
avg(CHACHACHA.soju) SOJU,
avg(CHACHACHA.medical) MEDICAL,
avg(CHACHACHA.clothing) CLOTHING,
avg(CHACHACHA.education) EDUCATION,
avg(CHACHACHA.entertainment) ENTERTAINMENT,
avg(CHACHACHA.etc) ETC from CHACHACHA group by level having level=200;


-- 분석 2
-- 소득별 저축항목	개인 VS 통계청

select
TINCOME,
TSPEND,
(TINCOME-TSPEND) from BD_MONINCOMESAVING where MINCOME=1;

select 
level,
avg(CHACHACHA.consumption),
avg(CHACHACHA.nonconsumption),
avg(surplus) from CHACHACHA group by level having level=200;