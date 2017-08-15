

CREATE TABLE [poll] (
	[p_num] [int] IDENTITY (1, 1) NOT NULL ,
	[p_name] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,
	[p_email] [varchar] (30) COLLATE Korean_Wansung_CI_AS NULL ,
	[p_title] [varchar] (300) COLLATE Korean_Wansung_CI_AS NULL ,
	[p_qcount] [int] NULL ,
	[p_date] [smalldatetime] NULL ,
	[p_pass] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,
	[p_q1] [varchar] (100) COLLATE Korean_Wansung_CI_AS NULL ,
	[p_q2] [varchar] (100) COLLATE Korean_Wansung_CI_AS NULL ,
	[p_q3] [varchar] (100) COLLATE Korean_Wansung_CI_AS NULL ,
	[p_q4] [varchar] (100) COLLATE Korean_Wansung_CI_AS NULL ,
	[p_q5] [varchar] (100) COLLATE Korean_Wansung_CI_AS NULL ,
	[p_q1_count] [int] NULL ,
	[p_q2_count] [int] NULL ,
	[p_q3_count] [int] NULL ,
	[p_q4_count] [int] NULL ,
	[p_q5_count] [int] NULL ,
	[p_vote_count] [int] NULL ,
	[p_total_count] [int] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [Comment] (
	[Co_seq] [int] IDENTITY (1, 1) NOT NULL ,
	[num] [int] NOT NULL ,
	[Co_name] [varchar] (20) COLLATE Korean_Wansung_CI_AS NOT NULL ,
	[Co_date] [smalldatetime] NOT NULL ,
	[Co_Content] [varchar] (500) COLLATE Korean_Wansung_CI_AS NULL ,
	[co_pass] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,
	[master] [int] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [MyBox] (
	[m_num] [bigint] IDENTITY (1, 1) NOT NULL ,
	[SessionID] [bigint] NULL ,
	[MyBox] [varchar] (100) COLLATE Korean_Wansung_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [Statistic] (
	[num] [int] IDENTITY (1, 1) NOT NULL ,
	[user_ip] [varchar] (15) COLLATE Korean_Wansung_CI_AS NOT NULL ,
	[user_agent] [varchar] (50) COLLATE Korean_Wansung_CI_AS NOT NULL ,
	[refer_page] [varchar] (100) COLLATE Korean_Wansung_CI_AS NULL ,
	[log_time] [datetime] NOT NULL ,
	[s_mon] [tinyint] NULL ,
	[s_day] [tinyint] NULL ,
	[s_hour] [tinyint] NULL ,
	[counter] [tinyint] NULL ,
	[s_year] [tinyint] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [admin_tb] (
	[num] [int] IDENTITY (1, 1) NOT NULL ,
	[name] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,
	[email] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,
	[phone] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,
	[adminid] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,
	[adminpwd] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,
	[gubun] [int] NULL ,
	[writedate] [smalldatetime] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [banner] (
	[num] [int] IDENTITY (1, 1) NOT NULL ,
	[b_name] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,
	[b_room] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,
	[nomi] [int] NULL ,
	[image1] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,
	[image2] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,
	[cate] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,
	[top3] [int] NULL ,
	[category_top] [int] NULL ,
	[mainimage] [int] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [board] (
	[num] [int] IDENTITY (1, 1) NOT NULL ,
	[name] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,
	[email] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,
	[title] [varchar] (100) COLLATE Korean_Wansung_CI_AS NULL ,
	[content] [text] COLLATE Korean_Wansung_CI_AS NULL ,
	[postdate] [datetime] NULL ,
	[readcount] [int] NULL ,
	[coding] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,
	[pwd] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,
	[ref] [int] NULL ,
	[r_step] [int] NULL ,
	[reforder] [int] NULL ,
	[home] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,
	[tank] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,
	[master] [int] NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE [category] (
	[c_no] [int] NOT NULL ,
	[c_title] [varchar] (100) COLLATE Korean_Wansung_CI_AS NOT NULL ,
	[ref] [int] NULL ,
	[ref_n] [float] NULL ,
	[lev] [int] NULL ,
	[step] [float] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [goods] (
	[num] [int] IDENTITY (1, 1) NOT NULL ,
	[g_code] [bigint] NOT NULL ,
	[g_name] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,
	[g_com] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,
	[or_p] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,
	[Weekly_Best] [int] NULL ,
	[color] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,
	[t_choice] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,
	[g_row] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,
	[g_wid] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,
	[point] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,
	[ea] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,
	[sphoto] [varchar] (255) COLLATE Korean_Wansung_CI_AS NULL ,
	[bphoto] [varchar] (255) COLLATE Korean_Wansung_CI_AS NULL ,
	[coding] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,
	[content] [text] COLLATE Korean_Wansung_CI_AS NULL ,
	[filesize] [int] NULL ,
	[postdate] [datetime] NULL ,
	[editdate] [datetime] NULL ,
	[feature] [text] COLLATE Korean_Wansung_CI_AS NULL ,
	[r_ea] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,
	[ca1] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,
	[ca2] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,
	[ca3] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,
	[cphoto] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,
	[Rooms] [varchar] (300) COLLATE Korean_Wansung_CI_AS NULL ,
	[best_choice] [int] NULL ,
	[m_choice] [int] NULL ,
	[choice] [int] NULL ,
	[event_2] [int] NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE [juke] (
	[num] [int] IDENTITY (1, 1) NOT NULL ,
	[name] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,
	[title] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,
	[category] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,
	[mp3] [varchar] (100) COLLATE Korean_Wansung_CI_AS NULL ,
	[filesize] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,
	[postdate] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,
	[fileroom] [varchar] (100) COLLATE Korean_Wansung_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [members] (
	[num] [int] IDENTITY (1, 1) NOT NULL ,
	[user_id] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,
	[passwd] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,
	[passwd1] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,
	[name] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,
	[jumin1] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,
	[jumin2] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,
	[birth_yy] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,
	[birth_mm] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,
	[birth_dd] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,
	[birth_gbn] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,
	[ismarry] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,
	[address] [varchar] (150) COLLATE Korean_Wansung_CI_AS NULL ,
	[tel1_1] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,
	[tel1_2] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,
	[tel1_3] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,
	[whereTel1] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,
	[tel2_1] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,
	[tel2_2] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,
	[tel2_3] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,
	[whereTel2] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,
	[hp1] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,
	[hp2] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,
	[hp3] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,
	[job] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,
	[receiveType] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,
	[mail_flag] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,
	[email] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,
	[postdate] [datetime] NULL ,
	[editdate] [datetime] NULL ,
	[point] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,
	[passwd_q] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,
	[passwd_a] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [my_juke] (
	[ck] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,
	[sessionID] [bigint] NULL ,
	[mp3] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,
	[j_num] [bigint] IDENTITY (1, 1) NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [notice] (
	[num] [int] IDENTITY (1, 1) NOT NULL ,
	[title] [varchar] (100) COLLATE Korean_Wansung_CI_AS NULL ,
	[content] [text] COLLATE Korean_Wansung_CI_AS NULL ,
	[branch] [int] NULL ,
	[coding] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,
	[postdate] [smalldatetime] NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE [order_man] (
	[num] [int] IDENTITY (1, 1) NOT NULL ,
	[order_name] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,
	[order_tel] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,
	[order_id] [bigint] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [paper] (
	[company] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,
	[name] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,
	[number] [int] NULL ,
	[category] [varchar] (100) COLLATE Korean_Wansung_CI_AS NULL ,
	[addr] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [poll_tail] (
	[t_num] [int] NULL ,
	[t_name] [varchar] (20) COLLATE Korean_Wansung_CI_AS NULL ,
	[t_email] [varchar] (30) COLLATE Korean_Wansung_CI_AS NULL ,
	[t_content] [text] COLLATE Korean_Wansung_CI_AS NULL ,
	[t_date] [datetime] NULL ,
	[t_ip] [varchar] (15) COLLATE Korean_Wansung_CI_AS NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE [post2] (
	[postNo] [nvarchar] (255) COLLATE Korean_Wansung_CI_AS NULL ,
	[si] [nvarchar] (255) COLLATE Korean_Wansung_CI_AS NULL ,
	[gu] [nvarchar] (255) COLLATE Korean_Wansung_CI_AS NULL ,
	[DONG] [nvarchar] (255) COLLATE Korean_Wansung_CI_AS NULL ,
	[postetc] [nvarchar] (255) COLLATE Korean_Wansung_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [redmaster_login] (
	[sessionID] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,
	[master_id] [varchar] (10) COLLATE Korean_Wansung_CI_AS NULL ,
	[master_pass] [varchar] (10) COLLATE Korean_Wansung_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [sell_man] (
	[num] [int] IDENTITY (1, 1) NOT NULL ,
	[user_id] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,
	[total_p] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,
	[re_add] [varchar] (200) COLLATE Korean_Wansung_CI_AS NULL ,
	[re_name] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,
	[re_tel] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,
	[re_kind] [int] NULL ,
	[cardno] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,
	[bankno] [varchar] (100) COLLATE Korean_Wansung_CI_AS NULL ,
	[paidman] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,
	[bank_amt] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,
	[card_amt] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,
	[order_num] [bigint] NOT NULL ,
	[order_date] [smalldatetime] NULL ,
	[state] [int] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [seller] (
	[num] [int] IDENTITY (1, 1) NOT NULL ,
	[g_code] [bigint] NULL ,
	[order_num] [bigint] NOT NULL ,
	[good_name] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,
	[good_price] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,
	[good_ea] [int] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [shop_cart] (
	[sessionID] [bigint] NULL ,
	[good_code] [bigint] NULL ,
	[good_ea] [int] NULL ,
	[cartdate] [datetime] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [tbl_temp] (
	[sessionID] [bigint] NULL ,
	[userID] [varchar] (15) COLLATE Korean_Wansung_CI_AS NULL ,
	[passwd] [varchar] (10) COLLATE Korean_Wansung_CI_AS NULL ,
	[writedate] [datetime] NULL ,
	[master] [smallint] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [visit] (
	[num] [int] IDENTITY (1, 1) NOT NULL ,
	[name] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,
	[email] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,
	[home] [varchar] (50) COLLATE Korean_Wansung_CI_AS NULL ,
	[content] [text] COLLATE Korean_Wansung_CI_AS NULL ,
	[postdate] [datetime] NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [Comment] WITH NOCHECK ADD 
	CONSTRAINT [PK_Comment] PRIMARY KEY  CLUSTERED 
	(
		[Co_seq]
	)  ON [PRIMARY] 
GO

ALTER TABLE [board] WITH NOCHECK ADD 
	CONSTRAINT [PK_board] PRIMARY KEY  CLUSTERED 
	(
		[num]
	)  ON [PRIMARY] 
GO

ALTER TABLE [goods] WITH NOCHECK ADD 
	CONSTRAINT [PK_goods] PRIMARY KEY  CLUSTERED 
	(
		[num]
	)  ON [PRIMARY] 
GO

ALTER TABLE [members] WITH NOCHECK ADD 
	CONSTRAINT [PK_members] PRIMARY KEY  CLUSTERED 
	(
		[num]
	)  ON [PRIMARY] 
GO

ALTER TABLE [sell_man] WITH NOCHECK ADD 
	CONSTRAINT [PK_sell_man] PRIMARY KEY  CLUSTERED 
	(
		[num]
	)  ON [PRIMARY] 
GO

ALTER TABLE [seller] WITH NOCHECK ADD 
	CONSTRAINT [PK_seller] PRIMARY KEY  CLUSTERED 
	(
		[num]
	)  ON [PRIMARY] 
GO

ALTER TABLE [poll] WITH NOCHECK ADD 
	CONSTRAINT [DF_poll_p_date] DEFAULT (getdate()) FOR [p_date],
	CONSTRAINT [DF_poll_p_q1_count] DEFAULT (0) FOR [p_q1_count],
	CONSTRAINT [DF_poll_p_q2_count] DEFAULT (0) FOR [p_q2_count],
	CONSTRAINT [DF_poll_p_q3_count] DEFAULT (0) FOR [p_q3_count],
	CONSTRAINT [DF_poll_p_q4_count] DEFAULT (0) FOR [p_q4_count],
	CONSTRAINT [DF_poll_p_q5_count] DEFAULT (0) FOR [p_q5_count],
	CONSTRAINT [DF_poll_p_vote_count] DEFAULT (0) FOR [p_vote_count],
	CONSTRAINT [DF_poll_p_total_count] DEFAULT (0) FOR [p_total_count]
GO

ALTER TABLE [admin_tb] WITH NOCHECK ADD 
	CONSTRAINT [DF_admin_tb_gubun] DEFAULT (0) FOR [gubun],
	CONSTRAINT [DF_admin_tb_writedate] DEFAULT (getdate()) FOR [writedate]
GO

ALTER TABLE [goods] WITH NOCHECK ADD 
	CONSTRAINT [DF_goods_point] DEFAULT (0) FOR [point],
	CONSTRAINT [DF_goods_postdate] DEFAULT (getdate()) FOR [postdate],
	CONSTRAINT [DF_goods_editdate] DEFAULT (getdate()) FOR [editdate]
GO

ALTER TABLE [notice] WITH NOCHECK ADD 
	CONSTRAINT [DF_notice_postdate] DEFAULT (getdate()) FOR [postdate]
GO

ALTER TABLE [sell_man] WITH NOCHECK ADD 
	CONSTRAINT [DF_sell_man_order_date] DEFAULT (getdate()) FOR [order_date],
	CONSTRAINT [DF_sell_man_state] DEFAULT (0) FOR [state]
GO

ALTER TABLE [shop_cart] WITH NOCHECK ADD 
	CONSTRAINT [DF_shop_cart_cartdate] DEFAULT (getdate()) FOR [cartdate]
GO

ALTER TABLE [tbl_temp] WITH NOCHECK ADD 
	CONSTRAINT [DF_tbl_temp_writedate] DEFAULT (getdate()) FOR [writedate]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE VIEW dbo.Ve_order
AS
SELECT   sell_man.num,sell_man.total_p, 
               sell_man.re_add, sell_man.re_name, 
                sell_man.re_tel, sell_man.re_kind, 
                sell_man.cardno, sell_man.bankno, 
                sell_man.paidman, sell_man.bank_amt, 
                sell_man.card_amt, sell_man.order_date, 
                sell_man.state, members.tel1_1, 
                members.tel1_2, members.tel1_3, 
                members.name, sell_man.order_num
FROM      members INNER JOIN
                sell_man ON 
                members.user_id = sell_man.user_id

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


CREATE PROCEDURE [sp_insert_notice]
	(@title_1 	[varchar](100),
	 @content_2 	[text],
	 @branch_3 	[int],
	 @coding_4 	[varchar](50))

AS INSERT INTO [notice] 
	 ( [title],
	 [content],
	 [branch],
	 [coding]) 
 
VALUES 
	( @title_1,
	 @content_2,
	 @branch_3,
	 @coding_4)


GO
setuser
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE [sp_update_notice]
	(@num 	[int],
	 @title 	[varchar](100),
	 @content 	[text],
	 @branch 	[int],
	 @coding 	[varchar](50))

AS UPDATE [notice] 

SET  	
	[title]	 = @title,
	 [content]	 = @content,
	 [branch]	 = @branch,
	 [coding]	 = @coding 

WHERE 
	( [num]	 = @num)


GO
setuser
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

