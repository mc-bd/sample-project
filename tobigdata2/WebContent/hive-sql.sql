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
select HOUSING, TRANSPORTATION, COMMUNICATION, SUPPLIES, EATOUT, FOOD, SOJU, MEDICAL, CLOTHING, EDUCATION, ENTERTAINMENT, ETC  from BD_MONSPEND where MSPEND=1;
-----------------------------------------------------------------------------------------------

-- ���� �� ���̺�, íƮ �κ�
select TINCOME from BD_MONINCOMESAVING where MINCOME=1;
select TSPEND from BD_MONINCOMESAVING where MINCOME=1;
select (TINCOME-TSPEND) from BD_MONINCOMESAVING where MINCOME=1;

-- ���� �� íƮ �κ� ������ ���� ����íƮ ���� ����� ok
-----------------------------------------------------------------------------------------------

-- �м� 1  
-- �ҵ溰 �����׸�	���� VS ���û

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


-- �м� 2
-- �ҵ溰 �����׸�	���� VS ���û

select
TINCOME,
TSPEND,
(TINCOME-TSPEND) from BD_MONINCOMESAVING where MINCOME=1;

select 
level,
avg(CHACHACHA.consumption),
avg(CHACHACHA.nonconsumption),
avg(surplus) from CHACHACHA group by level having level=200;