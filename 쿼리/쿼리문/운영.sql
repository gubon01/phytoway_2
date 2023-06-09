-- 2023-05-25 코호트 요청
-- (상품별, 전체)
SELECT cohort_group, cohort_index, nick, '전체' AS qty, COUNT(DISTINCT key)
FROM 	(
			SELECT *,
						(DATE_PART('year', order_date::date) - DATE_PART('year', first_date::DATE)) * 12 +
						DATE_PART('month', order_date::date) - DATE_PART('month', first_date::date) AS cohort_index,
						TO_CHAR(DATE_TRUNC('month', first_date::DATE), 'YYYY-MM-DD') AS cohort_group
			FROM 	(
						SELECT 	KEY, order_date, nick,
									first_value(order_date) over(partition BY KEY, nick Order BY order_date_time) AS first_date
						FROM 	order_batch
						WHERE order_id <> '' AND phytoway = 'y' AND store IN ('스마트스토어', '스마트스토어_풀필먼트')
					) AS t1
		) AS t2
GROUP BY cohort_group, cohort_index, nick



SELECT * 
FROM "Naver_Search_Channel"
WHERE "D" LIKE '%판토모나%' OR "D" LIKE '%써큐시안%'


SELECT *
FROM "ad_mapping3"


SELECT *
FROM "naver_option"
WHERE option_code = '31861468601'

SELECT * FROM "stock_log"

SELECT *
FROM "product"
Order BY NO




select *
from "EZ_Order"
where seq = 502705



SELECT *
FROM "naver_option"
WHERE option_code = '32006841737'


SELECT * FROM "cost_marketing"


SELECT * FROM "cost_product"








SELECT SUM(cost1), SUM(cost2) FROM "content_batch"
WHERE yyww IN( '2023-22','2023-23','2023-24') AND page_type = '블로그'


SELECT * FROM "content_batch" LIMIT 10



SELECT "orderId", COUNT("productOrderId") AS cnt
FROM "naver_order_product" AS n
LEFT JOIN "naver_option" AS o ON (n."optionCode" = o."option_code")
LEFT JOIN "product" AS p ON (o."product_no" = p."no")	
WHERE p.nick = '판토모나하이퍼포머'
GROUP BY "orderId"
HAVING COUNT("productOrderId") > 1




SELECT * FROM "settlement"



select * from "Stock"
--where product LIKE '%밤%'
WHERE INPUT > 0
order by yymmdd





SELECT *
FROM "order_batch"
WHERE KEY = '최지환al*****@na'


-- 3회 이상 주문? - o
-- 주문일 7개월 이내? : 
-- 만료일? - 딱 복용기간만.
복용기간, 복용기간 -14, 복용기간+14
주문일 + 2
-- key_rank인지, key_nick_rank인지? - key_nick_rank
-- 고객 리스트



-- 주문 내역
SELECT *
FROM 	(
			select 	
						dense_rank() over(partition by key, nick order by order_date_time) as "key_nick_rank",
						*
			from "order_batch"
			where order_id <> '' and phytoway = 'y' AND order_status = '주문'
		) AS t
WHERE order_date > '2022-11-16' AND brand IN ('판토모나', '써큐시안') AND key_nick_rank >= 3 




-- 고객 명단
-- where절 nick 조건 바꿔서 사용
SELECT DISTINCT KEY, order_name, cust_id, order_tel
FROM 	(
			select 	
						dense_rank() over(partition by key, nick order by order_date_time) as "key_nick_rank",
						*
			from "order_batch"
			where order_id <> '' and phytoway = 'y' AND order_status = '주문'
		) AS t
WHERE order_date > '2022-11-16' AND brand IN ('판토모나', '써큐시안') AND key_nick_rank >= 3 
AND nick = '판토모나하이퍼포머'







SELECT * FROM "product" Order BY NO


SELECT * FROM "cac_jisikin" WHERE yymmdd = ''


SELECT * FROM "naver_settlement_case"


 LIMIT 1



select * from "Non_Order" where order_num LIKE '% '

SELECT * FROM "coupang_sales"



