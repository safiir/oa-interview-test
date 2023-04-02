# 说明

1. 代码主要是用rails generator生成的， 其中`app/controllers/teachers_controller.rb`的`followed_students`、`follow_student`、`unfollow_student`分别为题目所要求的三个api的实现函数

2. 此外`app/controllers/students_controller.rb`另外实现了查询follow指定学生的老师列表的功能

3. 此外查询接口都用`memcached`做了缓存

4. 依赖了`mysql`和`memcached`服务，`docker-compose.yml`
配置文件在`srv`目录下，用`docker-compose up -d`启动服务即可，mysql默认密码是`example`

5. 测试用例位于`spec/requests/teachers_controller_spec.rb`以及`spec/requests/students_controller_spec.rb`文件中，会随机生成fake数据，分成两组作为对照进行测试，请阅读相关代码查看用例

6. 查询接口没有做分页处理，但是题目也没有要求，所以就没做

7. 启动项目
```bash
bundle install
rails db:create
rails db:migrate
puma
```

8. 可在`codespaces`上直接运行测试，运行`rspec`即可


> ruby版本不对的话，需要用rvm安装指定的版本

> node版本不对的话，需要用nvm安装指定的版本

> 可能需要初始化下`webpacker`

```bash
rails webpacker:install
rails webpacker:compile
```