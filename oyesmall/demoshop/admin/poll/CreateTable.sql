CREATE TABLE poll
(
[p_num] int NOT NULL IDENTITY(1,1), 
[p_name] varchar (20) NULL, 
[p_email] varchar (30) NULL, 
[p_title] varchar (300) NULL, 
[p_qcount] int NULL, 
[p_over] tinyint NULL, 
[p_date] datetime NULL, 
[p_pass] varchar (20) NULL, 
[p_q1] varchar(100) NULL, 
[p_q2] varchar(100) NULL, 
[p_q3] varchar(100) NULL, 
[p_q4] varchar(100) NULL, 
[p_q5] varchar(100) NULL, 
[p_q1_count] int NULL, 
[p_q2_count] int NULL, 
[p_q3_count] int NULL, 
[p_q4_count] int NULL, 
[p_q5_count] int NULL, 
[p_vote_count] int NULL, 
[p_total_count] int NULL, 
)

CREATE TABLE poll_tail
(
[t_num] int NULL, 
[t_name] varchar (20) NULL, 
[t_email] varchar (30) NULL, 
[t_content] text NULL, 
[t_date] datetime NULL,
[t_ip] varchar (15) NULL, 
)