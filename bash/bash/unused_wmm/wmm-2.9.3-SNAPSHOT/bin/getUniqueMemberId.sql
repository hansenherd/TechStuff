DROP TABLE IF EXISTS tmp.tmp_member_ids;
CREATE TABLE tmp.tmp_member_ids (programCid varchar(255), memberCid varchar(255), uniqueMemberId varchar(255) );

--TODO: see if there's a way to pass in the file getting loaded
\COPY tmp.tmp_member_ids (programCid, memberCid) FROM '/home/steveh/amp/web-gateway/wmm/from_access/cids.txt' CSV HEADER;

UPDATE tmp.tmp_member_ids SET uniqueMemberId = '888';

--\COPY tmp.tmp_member_ids TO STDOUT CSV
COPY tmp.tmp_member_ids TO '/home/steveh/amp/web-gateway' CSV


--select * from tmp.tmp_member_ids;
