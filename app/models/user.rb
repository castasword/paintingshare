# == Schema Information
#
# Table name: users
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class User < ActiveRecord::Base
  attr_accessible :name, :email, :password, :password_confirmation
  #下面的命令会完成：
  #1、为user添加password和password_confirmation实例变量来做注册确认密码
  #2、添加user.authenticate(password)用于验证密码。
  has_secure_password

  validates_presence_of :name, :email, :password_confirmation
  validates_length_of :name, :maximum => 50
  validates_length_of :password, :minimum => 6
  validates_format_of :email, :with => /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates_uniqueness_of :email
end
