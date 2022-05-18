class Inquiry
# DBを使わないので「ActiveModel」を使用
  include ActiveModel::Model

  attr_accessor :name, :message

  validates :name, :presence => {:message => '名前を入力してください'}
  validates :message, :presence => {:message => 'お問合せ内容を入力してください'}
end