select * from calendar;
select * from neighbourhood;
ALTER TABLE pricing ALTER COLUMN weekly_price TYPE money using weekly_price::text::money;


ALTER TABLE reviews ALTER COLUMN reviewer_name TYPE varchar(255) using reviewer_name::text::varchar;
ALTER TABLE reviews ALTER COLUMN date TYPE Date using TO_DATE(date, 'YYYY-MM-DD');
ALTER TABLE host ALTER COLUMN host_is_superhost TYPE boolean using host_is_superhost::text::boolean;
ALTER TABLE host ALTER COLUMN a TYPE boolean using host_is_superhost::text::boolean;
ALTER TABLE rating ALTER COLUMN number_of_reviews TYPE integer using number_of_reviews::bigint::integer;



