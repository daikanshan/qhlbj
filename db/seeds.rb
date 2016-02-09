# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
if Admin::User.count == 0
  success = false
  while !success
    print "请设置用户邮箱:"
    email = STDIN.gets.chop

    print "请设置用户密码:"
    password = STDIN.gets.chop

    print "请再次输入用户密码:"
    password_confirmation = STDIN.gets.chop

    result = Admin::User.create(email:email,password:password,password_confirmation:password_confirmation)

    if result.id.nil?
      print "抱歉，您的账户未创建成功！#{result.errors.full_messages.join(',')}"
    else
      print "恭喜，您的账户创建成功！"
      success = true
    end
  end
end

if Admin::Info.count==0
  Admin::Info.create(title:"公司简介",content:"公司简介")
end

if Admin::Culture.count==0
  Admin::Culture.create(title:"公司文化",content:"公司文化")
end

if Admin::Contact.count==0
  Admin::Contact.create(name:"称呼",email:"邮箱",phone:"手机号码",fixed_phone:"固定电话",address:"地址")
end
Admin::Config.delete_all
if Admin::Config.count==0
  Admin::Config.create(name:"Logo",val:1)
  Admin::Config.create(name:"淘宝",val:1,url:"url")
  Admin::Config.create(name:"微信",val:1,url:"url")
  Admin::Config.create(name:"微博",val:1,url:"url")
end
