-- �̼� �� ���̺� �κ�
select (MONTARGET*COUNT) from BD_GOAL where PK_GOAL=1;
select STARTDATE, FINISHDATE from BD_GOAL where PK_GOAL=1;
select MONTARGET from BD_GOAL where PK_GOAL=1;
select NOWTARGET from BD_GOAL where PK_GOAL=10;
select ACHIEVEMENT from BD_GOAL where PK_GOAL=10;

-- �̼� �� íƮ �κ� ������ ���� ����íƮ ���� ����� ok
-- �̼� �� íƮ �κ� x��
select WHAT from BD_GOAL where PK_GOAL=1;
select WHAT from BD_GOAL where PK_GOAL=2;
select WHAT from BD_GOAL where PK_GOAL=4;
select WHAT from BD_GOAL where PK_GOAL=6;
select WHAT from BD_GOAL where PK_GOAL=7;
select WHAT from BD_GOAL where PK_GOAL=8;
select WHAT from BD_GOAL where PK_GOAL=9;

-- �̼� �� íƮ �κ� y��
select ACHIEVEMENT from BD_GOAL where PK_GOAL=1;
select ACHIEVEMENT from BD_GOAL where PK_GOAL=2;
select ACHIEVEMENT from BD_GOAL where PK_GOAL=4;
select ACHIEVEMENT from BD_GOAL where PK_GOAL=6;
select ACHIEVEMENT from BD_GOAL where PK_GOAL=7;
select ACHIEVEMENT from BD_GOAL where PK_GOAL=8;
select ACHIEVEMENT from BD_GOAL where PK_GOAL=9;
-----------------------------------------------------------------------------------------------

-- ���� �� ���̺� �κ�
select INCOME, INTEREST_INCOME, TINCOME from BD_MONINCOMESAVING where MINCOME=1;

-- ���� �� íƮ �κ� ������ ���� ����íƮ ���� ����� ok
-- ���� �� íƮ �κ� x��
select WHAT from BD_GOAL where PK_GOAL=6;
select WHAT from BD_GOAL where PK_GOAL=7;
select WHAT from BD_GOAL where PK_GOAL=8;
select WHAT from BD_GOAL where PK_GOAL=9;
select WHAT from BD_GOAL where PK_GOAL=10;

-- ���� �� íƮ �κ� y�� (x�࿡ ���Ͽ� ������ ���� ��������)
select INCOME from BD_MONINCOMESAVING where MINCOME=1;
select INTEREST_INCOME from BD_MONINCOMESAVING where MINCOME=1;
-----------------------------------------------------------------------------------------------

-- ���� �� ���̺�, íƮ �κ�
select RESIDENTAL, MOBILE, TRANSPORT, DAILYSUP, RESTAURENT, GROCERY, COFFEE, ALCOHOL, FINANCE, HEALTH, CLOTHING, BEAUTY, EDUCATION, CULTURE, SPORTS, TRAVEL, TSPEND from BD_MONSPEND where MSPEND=1;
-----------------------------------------------------------------------------------------------

-- ���� �� ���̺�, íƮ �κ�
select TINCOME from BD_MONINCOMESAVING where MINCOME=1;
select TSPEND from BD_MONINCOMESAVING where MINCOME=1;
select (TINCOME-TSPEND) from BD_MONINCOMESAVING where MINCOME=1;



-----------------------------------------------------------------------------------------------

-- �м� 1  
-- �ҵ溰 �����׸�	���� VS ���û

select level,avg(CHACHACHA.food),avg(CHACHACHA.soju),avg(CHACHACHA.clothing),avg(CHACHACHA.housing),avg(CHACHACHA.supplies),avg(CHACHACHA.medical),avg(CHACHACHA.transportation),avg(CHACHACHA.communication),avg(CHACHACHA.entertainment),avg(CHACHACHA.education),avg(CHACHACHA.eatout),avg(CHACHACHA.etc) from CHACHACHA group by level having level=100

select level,avg(CHACHACHA.food),avg(CHACHACHA.soju),avg(CHACHACHA.clothing),avg(CHACHACHA.housing),avg(CHACHACHA.supplies),avg(CHACHACHA.medical),avg(CHACHACHA.transportation),avg(CHACHACHA.communication),avg(CHACHACHA.entertainment),avg(CHACHACHA.education),avg(CHACHACHA.eatout),avg(CHACHACHA.etc) from CHACHACHA group by level having level=200

select level,avg(CHACHACHA.food),avg(CHACHACHA.soju),avg(CHACHACHA.clothing),avg(CHACHACHA.housing),avg(CHACHACHA.supplies),avg(CHACHACHA.medical),avg(CHACHACHA.transportation),avg(CHACHACHA.communication),avg(CHACHACHA.entertainment),avg(CHACHACHA.education),avg(CHACHACHA.eatout),avg(CHACHACHA.etc) from CHACHACHA group by level having level=300

select level,avg(CHACHACHA.food),avg(CHACHACHA.soju),avg(CHACHACHA.clothing),avg(CHACHACHA.housing),avg(CHACHACHA.supplies),avg(CHACHACHA.medical),avg(CHACHACHA.transportation),avg(CHACHACHA.communication),avg(CHACHACHA.entertainment),avg(CHACHACHA.education),avg(CHACHACHA.eatout),avg(CHACHACHA.etc) from CHACHACHA group by level having level=400

select level,avg(CHACHACHA.food),avg(CHACHACHA.soju),avg(CHACHACHA.clothing),avg(CHACHACHA.housing),avg(CHACHACHA.supplies),avg(CHACHACHA.medical),avg(CHACHACHA.transportation),avg(CHACHACHA.communication),avg(CHACHACHA.entertainment),avg(CHACHACHA.education),avg(CHACHACHA.eatout),avg(CHACHACHA.etc) from CHACHACHA group by level having level=500

select level,avg(CHACHACHA.food),avg(CHACHACHA.soju),avg(CHACHACHA.clothing),avg(CHACHACHA.housing),avg(CHACHACHA.supplies),avg(CHACHACHA.medical),avg(CHACHACHA.transportation),avg(CHACHACHA.communication),avg(CHACHACHA.entertainment),avg(CHACHACHA.education),avg(CHACHACHA.eatout),avg(CHACHACHA.etc) from CHACHACHA group by level having level=600

select level,avg(CHACHACHA.food),avg(CHACHACHA.soju),avg(CHACHACHA.clothing),avg(CHACHACHA.housing),avg(CHACHACHA.supplies),avg(CHACHACHA.medical),avg(CHACHACHA.transportation),avg(CHACHACHA.communication),avg(CHACHACHA.entertainment),avg(CHACHACHA.education),avg(CHACHACHA.eatout),avg(CHACHACHA.etc) from CHACHACHA group by level having level=700


-- �м� 2

select level,avg(CHACHACHA.consumption),avg(CHACHACHA.nonconsumption),avg(surplus) from CHACHACHA group by level having level=100

select level,avg(CHACHACHA.consumption),avg(CHACHACHA.nonconsumption),avg(surplus) from CHACHACHA group by level having level=200

select level,avg(CHACHACHA.consumption),avg(CHACHACHA.nonconsumption),avg(surplus) from CHACHACHA group by level having level=300

select level,avg(CHACHACHA.consumption),avg(CHACHACHA.nonconsumption),avg(surplus) from CHACHACHA group by level having level=400

select level,avg(CHACHACHA.consumption),avg(CHACHACHA.nonconsumption),avg(surplus) from CHACHACHA group by level having level=500

select level,avg(CHACHACHA.consumption),avg(CHACHACHA.nonconsumption),avg(surplus) from CHACHACHA group by level having level=600

select level,avg(CHACHACHA.consumption),avg(CHACHACHA.nonconsumption),avg(surplus) from CHACHACHA group by level having level=700



