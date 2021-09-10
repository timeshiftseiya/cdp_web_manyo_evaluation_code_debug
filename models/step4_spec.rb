require 'rails_helper'

describe 'ステップ4', type: :model do
  describe 'usersテーブルのnameカラムに入力必須のバリデーションを設定すること' do
    it 'usersテーブルのnameカラムに入力必須のバリデーションを設定すること' do
      user = User.create(name: '', email: 'user@email.com', password: 'password')
      expect(user).not_to be_valid
    end
  end

  describe 'usersテーブルのemailカラムには入力必須、同一データの登録禁止、フォーマット規定のバリデーションを設定すること' do
    let!(:default_user) { User.create(name: 'user_name', email: 'user@email.com', password: 'password')}
    it 'emailカラムに入力必須のバリデーションが設定されていること' do
      user = User.create(name: 'user_name', email: '', password: 'password')
      expect(user).not_to be_valid
    end
    it 'emailカラムに同一データの登録禁止のバリデーションが設定されていること' do
      user = User.create(name: 'user_name', email: 'user@email.com', password: 'password')
      expect(user).not_to be_valid
    end
  end

  describe 'usersテーブルのpasswordカラムに入力必須と最低文字数6文字以上のバリデーションを設定すること' do
    it 'passwordカラムに入力必須のバリデーションが設定されていること' do
      user = User.create(name: 'user_name', email: 'user@email.com', password: '')
      expect(user).not_to be_valid
    end
    it 'passwordが5文字の場合、バリデーションに失敗すること' do
      user = User.create(name: 'user_name', email: 'user@email.com', password: 'passw')
      expect(user).not_to be_valid
    end
    it 'passwordが6文字の場合、バリデーションに成功すること' do
      user = User.create(name: 'user_name', email: 'user@email.com', password: 'passwo')
      expect(user).to be_valid
    end
  end

  describe 'メールアドレスの大文字と小文字の区別をなくす設定を追加すること' do
    it '同じメールアドレスを大文字と小文字で登録した場合、バリデーションに失敗すること' do
      User.create(name: 'user_name_1', email: 'user@email.com', password: 'password')
      user = User.create(name: 'user_name_2', email: 'User@email.com', password: 'password')
      expect(user).not_to be_valid
    end
  end
end
