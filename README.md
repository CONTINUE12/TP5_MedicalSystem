# TP5_MedicalSystem

## 介绍
基于thinkphp5.1框架的医疗大数据系统开发

### 一.功能分析

#### - 1.前端功能：

	登录、注册、导航、图片列表、图片详情、上传数据功能、搜索、评论
#### - 2.后端功能：

	登录、注册、导航管理、图片管理、管理员管理、会员管理、评论管理、系统设置
	
### 二.设计数据库dp_blog：

####- 1.管理员表dp_admin：

    自增id、用户名username、密码password、昵称nickname、邮箱email、状态status、超级管理员super、添加时间create_time、更新时间update_time、软删除时间delete_time

####- 2.会员表dp_member：

    自增id、用户名username、密码password、昵称nickname、邮箱email、添加时间create_time、更新时间update_time、软删除时间delete_time

####- 3.导航表dp_cate：

    自增id、导航名称catename、排序sort、添加时间create_time、更新时间update_time、软删除时间delete_time

####- 4.图片表dp_article：

    自增id、图片标题title、概要desc、标签tags、内容content、推荐atop、所属导航cateid、图片作者author、查看次数click、评论次数comment、添加时间create_time、更新时间update_time、软删除时间delete_time

####- 5.评论表dp_comment：

    自增id、评论内容content、评论图片articleid、评论用户memberid、评论时间create_time、更新时间update_time、软删除时间delete_time

####- 6.系统设置表dp_system：

    自增id、网站名称webname、网站副名称shortname、版权信息copyright、设置时间create_time、更新时间update_time、软删除时间delete_time

#### 注：采用典型的MVC结构，模型文件在model文件夹，视图文件在view文件夹，控制器文件在controller，另外，路由文件在route文件夹，配置文件在config文件夹，入口文件在public文件夹

	
### 三.维护日志：

#### - 1.版本1.0  时间2021.2.3

- (1).去除推荐功能，后台添加图片功能
- (2).修改前端显示页面，包括栏目显示、网站内容显示
- (3).修改后端页面显示，包括后台功能显示、侧边栏显示
- (4).增加用户登录后的上传数据功能 
- (5).增加直接跳转至管理员登录功能

#### - 2.版本2.0  时间2021.2.4

- (1).关联用户账户和用户上传的数据信息，使其显示在数据详情处
- (2).关联用户评论和数据被评论次数，使其显示在数据详情处并动态变化
