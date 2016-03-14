# shuoshuowall
响应式滚动分页异步提交数据说说墙
## 前端
 * 响应式布局，适应pc，平板，手机
 * ajax上传文件提交表单 (使用了jquery-form)
 * ajax无限滚动分页
 * 用a标签来代理input[type="file"]
 * 封装了自己的loading，alert，日期工具等小组件
## 后端
 * 因为业务逻辑简单，只分了web和dao两层
 * 使用原生的jdbc+servlet+c3p0
 * ShuoShuoDao使用了单例和简单静态工厂的设计模式
 * 使用beanutils实现了通用的jdbc小工具，只传入sql和参数即可完成增删改查
 
 
 
