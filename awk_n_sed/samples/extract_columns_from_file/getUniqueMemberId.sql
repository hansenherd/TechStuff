DROP TABLE IF EXISTS tmp.tmp_member_ids;
CREATE TABLE tmp.tmp_member_ids (programCid varchar(255), memberCid varchar(255), uniqueMemberId varchar(255) );

COPY tmp.tmp_member_ids (programCid, memberCid) FROM '/home/steveh/src/awk/extract_columns_from_file/upload.txt' CSV HEADER;

UPDATE tmp.tmp_member_ids SET uniqueMemberId = '888';

--COPY tmp.tmp_member_ids TO STDOUT CSV
--COPY tmp.tmp_member_ids TO 'somewhere' CSV


select * from tmp.tmp_member_ids;
