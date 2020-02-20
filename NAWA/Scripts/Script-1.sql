-- 마이그레이션시 발견한 ORACLE과의 다른점
-- 1. NOT IN 'C' -> IN절 조건에 괄호를 필수적으로 붙여야한다.
-- 2. ORACLE의 NVL은 MYSQL에서는 IFNULL!
-- 3. LIKE문 뒤에 '%'||'?'||'%'는 CONCAT('%', '?', '%')을 써도 가능!
-- 4. ORACLE에서 시퀀스 테이블을 이용해서 NEXTVAL, CURRVAL을 사용하던 것을 MYSQL에서는 AUTO_INCREMENT라는 옵션을 줘야 한다! -> 이러면 SELECTKEY는 어떡하지...?
-- 5. JOIN은 비슷한거 같음... 
-- 6. 서브쿼리를 사용할때는 쿼리마다 무조건 서브쿼리명을 줘야하는거 같음...
-- 7. MYSQL에서는 = 연산자를 사용할 시 대입과 비교 두가지 경우가 발생하는데 := 대입연산자를 사용하면 무조건 대입연산자 취급한다.
-- 8. ORACLE에서의 ROWNUM을 MYSQL에서는 (@ROWNUM:=@ROWNUM+1)RN 같은 방식으로 사용한다!
-- 9. 8번과 같은 방식으로 사용할 시에 WHERE절 혹은 FROM절에서 (@ROWNUM:=0)=0이라는 ROWNUM 초기화를 진행해줘야한다. 그렇지 않으면 조회할때마다 숫자가 늘어나서 조회되게 된다고 한다.


-- 해결 못한 부분
-- 1. 이벤트 재개설 '['
-- 2. 이벤트 개설하고 나서 EP테이블에 EF_ID.CURRVAL 넣는 부분!


-- ROWNUM 테스트
SET @ROWNUM=0;

SELECT (@ROWNUM:=@ROWNUM+1)RN, EF_ID, EF_TITLE, EF_CON, EF_ATTEND_CON, EF_READ_CNT, EF_NUM_CNT, EF_DEADLINE, 
					EF_LC, UC_ID, EF_OPEN_STATUS, EF_RGD, EF_STATUS,EF_EVENT_START, EF_CLOSE, EF_RETRY 
			FROM EF, (SELECT @ROWNUM:=0)R;


-- 이벤트 조회(O)
	SELECT EF_ID, EF_TITLE, EF_ATTEND_CON, EF_CON, EF_READ_CNT, EF_NUM_CNT, EF_DEADLINE, EF_EVENT_START, 
		EF_LC, UC_ID, EF_OPEN_STATUS, EF_RGD, EF_STATUS, EF_CLOSE, EF_RETRY, EF_REFER
 		FROM EF
		WHERE EF_CLOSE='N'
			  AND 
			  EF_STATUS NOT IN ('C')	-- NOT IN (조건) => 조건에는 반드시 괄호가 붙어야 한다!
					ORDER BY EF_READ_CNT DESC LIMIT 3;
	

-- 페이징 리스트(O)
	SELECT EF_ID, EF_TITLE, EF_CON, EF_ATTEND_CON, EF_READ_CNT, EF_NUM_CNT, EF_DEADLINE, 
					EF_LC, UC_ID, EF_OPEN_STATUS, EF_RGD, EF_STATUS, EF_EVENT_START, EF_CLOSE, EF_RETRY 
			FROM 
			(SELECT EF_ID, EF_TITLE, EF_CON, EF_ATTEND_CON, EF_READ_CNT, EF_NUM_CNT, EF_DEADLINE, 
					EF_LC, UC_ID, EF_OPEN_STATUS, EF_RGD, EF_STATUS,EF_EVENT_START, EF_CLOSE, EF_RETRY, (@ROWNUM:=@ROWNUM+1)RN
				FROM (SELECT EF_ID, EF_TITLE, EF_CON, EF_ATTEND_CON, EF_READ_CNT, EF_NUM_CNT, EF_DEADLINE, 
					  EF_LC, UC_ID, EF_OPEN_STATUS, EF_RGD, EF_STATUS,EF_EVENT_START, EF_CLOSE, EF_RETRY 
						FROM EF, (SELECT @ROWNUM:=0)R
						ORDER BY EF_ID DESC)SUB)SUB2
			WHERE RN BETWEEN 1 AND 5;
			-- ORDER BY EF_READ_CNT DESC;
			-- ORDER BY EF_RGD DESC;
			-- ORDER BY EF_DEADLINE ASC;


-- 글 갯수 가져오는 쿼리 (O)
	SELECT IFNULL(COUNT(*),0)	
	FROM EF;


-- 검색 + 페이징 + 조회(O)
-- ROWNUM.... 젠장...
	SELECT EF_ID, EF_TITLE, EF_CON, EF_ATTEND_CON, EF_READ_CNT, EF_NUM_CNT, EF_DEADLINE, 
					EF_LC, UC_ID, EF_OPEN_STATUS, EF_RGD, EF_STATUS,EF_EVENT_START, EF_CLOSE, EF_RETRY 
			FROM 
			(SELECT EF_ID, EF_TITLE, EF_CON, EF_ATTEND_CON, EF_READ_CNT, EF_NUM_CNT, EF_DEADLINE, 
					EF_LC, UC_ID, EF_OPEN_STATUS, EF_RGD, EF_STATUS,EF_EVENT_START, EF_CLOSE, EF_RETRY, (@ROWNUM:=@ROWNUM+1)RN
				FROM (SELECT EF_ID, EF_TITLE, EF_CON, EF_ATTEND_CON, EF_READ_CNT, EF_NUM_CNT, EF_DEADLINE, 
					  EF_LC, UC_ID, EF_OPEN_STATUS, EF_RGD, EF_STATUS,EF_EVENT_START, EF_CLOSE, EF_RETRY 
						FROM EF, (SELECT @ROWNUM:=0)R
						WHERE EF_STATUS NOT IN ('C') 
								AND EF_TITLE LIKE '%이벤트%'
								-- AND UC_ID = 'NH_ANIMAL'
						ORDER BY EF_ID DESC)SUB)SUB2
			 WHERE RN BETWEEN 1 AND 8;



-- 검색어에 맞는 글 갯수를 가져오는 쿼리(O)
	SELECT IFNULL(COUNT(*),0)	
	FROM EF
	WHERE EF_STATUS NOT IN ('C') 
		 AND EF_TITLE LIKE '%이벤트%'
         AND EF_LC LIKE '%서초구%';
   	     -- AND UC_ID LIKE '%NH_ANIMAL%';


-- 이벤트 상세보기(O)
	SELECT EF_ID, EF_TITLE, EF_CON, EF_ATTEND_CON, EF_READ_CNT, EF_NUM_CNT, EF_EVENT_START, EF_DEADLINE, 
			EF_LC, UC_ID, EF_OPEN_STATUS, EF_RGD, EF_STATUS, EF_CLOSE, EF_RETRY 
				FROM EF
					WHERE EF_ID='3';
-- 이벤트 조회수증가(O)
	UPDATE EF SET EF_READ_CNT = EF_READ_CNT+1 WHERE EF_ID='3';

-- 이벤트 개설(O)
	-- SELECTKEY
	SELECT IFNULL(MAX(EF_ID),0)+1 FROM EF;

	INSERT INTO EF(EF_ID, EF_TITLE, EF_CON, EF_ATTEND_CON, EF_NUM_CNT, EF_EVENT_START, EF_DEADLINE, EF_LC, UC_ID, EF_OPEN_STATUS)
			VALUES((SELECT IFNULL(MAX(EF_ID),0)+1 FROM EF AS EF2),'이벤트 개설','이벤트 내용', '이벤트 참가 조건', 10, STR_TO_DATE('20191225120000', '%Y%m%d%H%i%s'), 
	STR_TO_DATE('20191222230000', '%Y%m%d%H%i%s'), '강남구', 'NH_TRABEL', 'PUBLIC');
	
	
-- ef_id(이벤트 아이디), mi_nck(개설자 닉네임), ep_auth(참가자 권한)를  ep테이블(이벤트 참가)에 입력!(O)-->
	INSERT INTO EP VALUES((SELECT IFNULL(MAX(EF_ID),0) FROM EF), '기기기','F');

-- 	SELECT * FROM EP;
-- 	DELETE FROM EP WHERE EF_ID = '8';

-- 이벤트 개설횟수 증가(O)
	UPDATE MI 
	SET MI_OPEN_CNT = MI_OPEN_CNT+1 WHERE MI_NCK='기기기';

-- EF_REFER를 EF_ID와 같게 만들어주는 쿼리
	UPDATE EF
	SET EF_REFER = EF_ID
	WHERE EF_ID = '32';

-- 안된부분 1
-- 이벤트 재개설 : 제목빼고 다 바꿀 수 있음 -->
	INSERT INTO EF(EF_ID, EF_TITLE, EF_CON, EF_ATTEND_CON, EF_NUM_CNT, EF_EVENT_START, EF_DEADLINE, EF_STATUS, EF_LC, EF_LC_DETAIL, UC_ID, EF_OPEN_STATUS,EF_RETRY,EF_REFER)
	VALUES((SELECT IFNULL(MAX(EF_ID),0)+1 FROM EF AS EF2), (SELECT CONCAT('[',(RETRY+1),'회차] ',TRIM(SUBSTRING(TITLE,INSTR(TITLE,']')+1)))
                        FROM (SELECT EF_TITLE AS TITLE, EF_RETRY AS RETRY
                              FROM EF AS EF2
                              WHERE EF_ID='94' AND EF_STATUS = 'C')SUB),
			'이벤트 재개설','이벤트 참가 조건',5,STR_TO_DATE('20191225120000', '%Y%m%d%H%i%s'),STR_TO_DATE('20191225120000', '%Y%m%d%H%i%s'),
			'O','서초구','37.619138538900295,126.9213454356513','NH_LANGUAGE', 'PUBLIC',(SELECT EF_RETRY FROM EF AS EF3 WHERE EF_ID = '94')+1,'94'
			);
-- 재개설 한 뒤에 재개설한 이벤트 아이디, 닉네임, 권한 ep에 추가
	INSERT INTO EP VALUES((SELECT IFNULL(MAX(EF_ID),0) FROM EF), '기기기','F');
						
   
-- 이벤트 폐쇄시 참가자, 초대자 테이블 삭제(O)  -->
	DELETE FROM EP WHERE EF_ID='1';

	DELETE FROM EI WHERE EF_ID='1';

-- 이벤트 폐쇄(O)
	UPDATE EF SET EF_CLOSE='Y', EF_STATUS = 'C' WHERE EF_ID='3';
	SELECT * FROM EF WHERE EF_ID = '3';

-- 이벤트 마감(O)
	UPDATE EF SET EF_STATUS = 'C' WHERE EF_ID='39';

-- 이벤트 조기마감
-- 트리거를 이용해보자!
-- 현재 인원이랑 최대인원이랑 같고 현재 날짜가 마감일전이라면 이벤트 상태를 조기마감으로 바꿈!
UPDATE EF SET EF_STATUS = 'E' WHERE EF_ID=-'1'
AND 현재인원 = 최대인원 AND 현재날짜 <= 마감일;

SELECT EF_TITLE AS TITLE, EF_RETRY AS RETRY
                             FROM EF AS EF2
                             WHERE EF_ID='94' AND EF_STATUS = 'C';
-- 이벤트 추가모집
-- 조기마감 상태에서 최대인원수가 현재인원보다 커지게 된다면 추가모집으로 변경!
	UPDATE EF SET EF_STATUS = 'A' WHERE EF_ID='1';
	AND EF_STATUS = 'E' AND 현재인원 < 최대인원 

-- 이벤트 수정(O)
	UPDATE EF SET EF_TITLE='테스트', UC_ID='NH_ANIMAL', EF_DEADLINE=STR_TO_DATE('20191222210000','%Y%m%d%H%i%s'), EF_EVENT_START=STR_TO_DATE('20191225120000','%Y%m%d%H%i%s'),
	EF_OPEN_STATUS='PUBLIC', EF_LC='광진구', EF_CON='크리스마스파티', EF_ATTEND_CON='드레스코드는 레드!', EF_NUM_CNT=6
				WHERE EF_ID='2' AND EF_CLOSE='N';


-- 이벤트 삭제 전에 참가자 테이블에서 물려있는 참가자 지우는 쿼리(O)
	DELETE FROM EP WHERE EF_ID='2';

-- 이벤트 삭제전에  EF_CLOSE = 'Y' 시켜주는쿼리(O)
	UPDATE EF SET EF_CLOSE='N' WHERE EF_ID='2';

-- 이벤트 삭제전에 EF_CLOSE = 'Y'인 애들 찾아서 BackUp 테이블에 집어넣는 거(O)
	INSERT INTO EF_BACKUP(EF_ID, EF_TITLE, EF_CON, EF_ATTEND_CON, EF_READ_CNT, EF_NUM_CNT, EF_EVENT_START, EF_DEADLINE, EF_LC, 
								UC_ID, EF_OPEN_STATUS, EF_STATUS, EF_CLOSE, EF_RETRY)
								SELECT EF_ID, EF_TITLE, EF_CON, EF_ATTEND_CON, EF_READ_CNT, EF_NUM_CNT, EF_EVENT_START, EF_DEADLINE, EF_LC,
							UC_ID, EF_OPEN_STATUS, EF_STATUS, EF_CLOSE, EF_RETRY
						FROM EF WHERE EF_ID='2';
-- 이벤트 삭제(O)
	DELETE FROM EF WHERE EF_ID='2';

-- 이벤트 참가자 조회(O)
	SELECT MR_NAME,MI_PHONE,MR_EMAIL,EP_AUTH
                        FROM EP JOIN MI USING(MI_NCK) 
                                        JOIN MR USING(MR_ID) 
                        WHERE EF_ID='40'
                       ORDER BY CASE WHEN EP_AUTH IN ('F') THEN 0 END, EF_ID;

-- 참가자 권한 가져오는 쿼리     
 	SELECT MI_NCK
 	FROM EP
 	WHERE EF_ID = '30' AND EP_AUTH = 'F';

 
-- 내 지역에 맞는 이벤트 리스트 가져오기
-- 조건절에서 MI_LC는 세션에 있는 MI_LC의 값!(MAPPER에는 값으로 넣어야함!)
 SELECT DISTINCT EF_LC, EF_ID, EF_TITLE, EF_CON, EF_ATTEND_CON, EF_READ_CNT, EF_NUM_CNT, EF_DEADLINE, 
					UC_ID, EF_OPEN_STATUS, EF_RGD, EF_STATUS, EF_EVENT_START, EF_CLOSE, EF_RETRY 
			FROM 
	(SELECT EF_ID, EF_TITLE, EF_ATTEND_CON, EF_CON, EF_READ_CNT, EF_NUM_CNT, EF_DEADLINE, EF_EVENT_START, 
		EF_LC, UC_ID, EF_OPEN_STATUS, EF_RGD, EF_STATUS, EF_CLOSE, EF_RETRY, EF_REFER, (@ROWNUM:=@ROWNUM+1)RN
		FROM EF AS E JOIN MI AS M, (SELECT @ROWNUM:=0)R
		WHERE EF_LC = 'RE_S05')SUB1
		WHERE EF_READ_CNT 
		ORDER BY EF_READ_CNT DESC LIMIT 3;
	
 SELECT MI_NCK, MR_ID, MI_PHONE, MI_PROFILE, MI_CONDITION, MI_LC, MI_INTEREST, MI_ATTEND_CNT, MI_OPEN_CNT
	FROM MI
	WHERE MR_ID = 'whdxor13';
	

UPDATE EF SET EF_STATUS = 'C' WHERE EF_ID=94;
DELETE FROM EF WHERE EF_ID = 95;


SELECT MR_EMAIL, MI_PHONE
	FROM MR JOIN MI USING(MR_ID) JOIN EP USING(MI_NCK)
		WHERE EF_ID = 71 AND EP_AUTH = 'F';
	
	
SELECT IFNULL(MAX(EF_ID),0)+1 FROM EF;

	INSERT INTO EF(EF_TITLE, EF_CON, EF_ATTEND_CON, EF_NUM_CNT, EF_EVENT_START, EF_DEADLINE, EF_LC,EF_LC_DETAIL , UC_ID, EF_OPEN_STATUS)
			VALUES((SELECT IFNULL(MAX(EF_ID),0)+1 FROM EF AS EF2),'이벤트 개설','이벤트 내용', '이벤트,참가,조건', 10, STR_TO_DATE('20191225', '%Y-%m-%d'), 
	STR_TO_DATE('20191222', '%Y-%m-%d'), 'RE_S01', 'NH_TRABEL', 'PUBLIC');
	
SELECT EF_NUM_CNT FROM EF WHERE EF_NUM_CNT >=2;

DELETE FROM EF WHERE EF_ID = 51;

UPDATE MR
SET MR_AUTH='A'
WHERE MR_ID='whdxor14';

-- SELECT T.table_name,CCSA.character_set_name FROM information_schema.`TABLES` T,
    -- information_schema.`COLLATION_CHARACTER_SET_APPLICABILITY` CCSA
-- WHERE CCSA.collation_name = T.table_collation
  -- AND T.table_schema = "nawas";