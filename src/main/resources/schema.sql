--
-- 由SQLiteStudio v3.1.1 产生的文件 周六 3月 4 01:05:21 2017
--
-- 文本编码：UTF-8
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- 表：t_attach
DROP TABLE IF EXISTS t_attach;
CREATE TABLE t_attach (id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, fname VARCHAR (100) NOT NULL, ftype VARCHAR (50), fkey VARCHAR (100) NOT NULL, author_id INTEGER (10) NOT NULL, created INTEGER (10) NOT NULL);

-- 表：t_comments
DROP TABLE IF EXISTS t_comments;
CREATE TABLE t_comments (coid INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, cid INTEGER DEFAULT (0) NOT NULL, created INTEGER (10) NOT NULL, author VARCHAR (200) NOT NULL, author_id INTEGER (10) DEFAULT (0), owner_id INTEGER (10) DEFAULT (0), mail VARCHAR (200) NOT NULL, url VARCHAR (200), ip VARCHAR (64), agent VARCHAR (200), content TEXT NOT NULL, type VARCHAR (16), status VARCHAR (16), parent INTEGER (10) DEFAULT (0));

-- 表：t_contents
DROP TABLE IF EXISTS t_contents;

CREATE TABLE t_contents ( cid INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL UNIQUE, title VARCHAR (255) NOT NULL, slug VARCHAR (255) CONSTRAINT idx_u_slug UNIQUE, thumb_img VARCHAR(255), created INTEGER (10) NOT NULL, modified INTEGER (10), content TEXT, author_id INTEGER (10) NOT NULL, type VARCHAR (16) NOT NULL, status VARCHAR (16) NOT NULL, fmt_type VARCHAR (16) DEFAULT ('markdown'), tags VARCHAR (200), categories VARCHAR (200), hits INTEGER (10) DEFAULT (0), comments_num INTEGER (1) DEFAULT (0), allow_comment INTEGER (1) DEFAULT (1), allow_ping INTEGER (1), allow_feed INTEGER (1) );
INSERT INTO t_contents (cid, title, slug, created, modified, content, author_id, type, status, tags, categories, hits, comments_num, allow_comment, allow_ping, allow_feed) VALUES (1, '关于', 'about', 1517465000, 1517465000, '## 关于
## 瞎扯
要淡定…要微笑…

喜欢音乐，关注技术和科技。

闲着没事，多来逛逛。


## 联系方式
- 邮箱: c\_justsinging@163.com


## By The Way
notThing
', 1, 'page', 'publish', NULL, NULL, 0, 0, 1, 1, 1);
INSERT INTO t_contents (cid, title, slug, created, modified, content, author_id, type, status, tags, categories, hits, comments_num, allow_comment, allow_ping, allow_feed) VALUES (2, '第一篇文章', NULL, 1517465231, 1517465231, '干技术这一行，技术更新换代是在太快了。

于是乎，生活中必须持续学习才得以跟上脚步。

一直以来虽然都有学习，但是毫无章法，总结也不到位。

学完过一段时间不用之后，很容易就遗忘了。

故而，在此自己搭了Blog，用来记录和总结自己的学习历程。

也会在上面分享一些自己觉得好用的工具和咨询。

也希望能交到一些朋友，一起说说笑笑，好好聊聊。

要淡定… 要微笑...', 1, 'post', 'publish', '', '默认分类', 10, 0, 1, 1, 1);

INSERT INTO t_contents (allow_feed,allow_ping,allow_comment,comments_num,hits,
categories,tags,fmt_type,status,type,author_id,content,modified,created,thumb_img,slug,title,cid) VALUES (
NULL,1,1,0,0,NULL,NULL,'markdown','publish','page',1,'## 友情链接

- :lock: [王爵的技术博客]()

## 链接须知

> 请确定贵站可以稳定运营
>
> 原创博客优先，技术类博客优先，设计、视觉类博客优先
>
> 经常过来访问和评论，眼熟的

备注：默认申请友情链接均为内页（当前页面）

## 基本信息

				网站名称：皓尘
				网站地址：http://cjustsinging.com

请在当页通过评论来申请友链，其他地方不予回复

暂时先这样，同时欢迎互换友链，这个页面留言即可。 ^_^

还有，我会不定时对无法访问的网址进行清理，请保证自己的链接长期有效。',1517465000,1517465000,NULL,'links','友情链接',3);

-- 表：t_logs
DROP TABLE IF EXISTS t_logs;
CREATE TABLE t_logs (id INTEGER PRIMARY KEY AUTOINCREMENT UNIQUE NOT NULL, "action" VARCHAR (100) NOT NULL, data VARCHAR (2000), author_id INTEGER (10) NOT NULL, ip VARCHAR (20), created INTEGER (10) NOT NULL);

-- 表：t_metas
DROP TABLE IF EXISTS t_metas;
CREATE TABLE t_metas (mid INTEGER PRIMARY KEY AUTOINCREMENT UNIQUE NOT NULL, name VARCHAR (200) NOT NULL, slug VARCHAR (200), type VARCHAR (32) NOT NULL, description VARCHAR (255), sort INTEGER (4) DEFAULT (0), parent INTEGER (10) DEFAULT (0));
INSERT INTO t_metas (mid, name, slug, type, description, sort, parent) VALUES (1, '默认分类', NULL, 'category', NULL, 0, 0);

-- 表：t_options
DROP TABLE IF EXISTS t_options;
CREATE TABLE t_options (name VARCHAR (100) PRIMARY KEY UNIQUE NOT NULL, value TEXT, description VARCHAR (255));

INSERT INTO t_options (name, value, description) VALUES ('site_title', '皓尘', '');
INSERT INTO t_options (name, value, description) VALUES ('social_weibo', '', null);
INSERT INTO t_options (name, value, description) VALUES ('social_zhihu', '', null);
INSERT INTO t_options (name, value, description) VALUES ('social_github', '', 'https://github.com/cjustsinging');
INSERT INTO t_options (name, value, description) VALUES ('social_twitter', '', null);
INSERT INTO t_options (name, value, description) VALUES ('allow_install', '0', '是否允许重新安装博客');
INSERT INTO t_options (name, value, description) VALUES ('site_theme', 'default', null);
INSERT INTO t_options (name, value, description) VALUES ('site_keywords', '皓尘,java,技术', null);
INSERT INTO t_options (name, value, description) VALUES ('site_description', '皓尘,java,技术', null);
INSERT INTO t_options (name, value, description) VALUES ('site_url', '', null);

-- 表：t_relationships
DROP TABLE IF EXISTS t_relationships;
CREATE TABLE t_relationships (cid INTEGER (10) NOT NULL, mid INTEGER (10) NOT NULL);

INSERT INTO t_relationships(cid, mid) VALUES(2, 1);

-- 表：t_users
DROP TABLE IF EXISTS t_users;
CREATE TABLE t_users (uid INTEGER PRIMARY KEY UNIQUE NOT NULL, username VARCHAR (64) UNIQUE NOT NULL, password VARCHAR (64) NOT NULL, email VARCHAR (100), home_url VARCHAR (255), screen_name VARCHAR (100), created INTEGER (10) NOT NULL, activated INTEGER (10), logged INTEGER (10), group_name VARCHAR (16));

COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
