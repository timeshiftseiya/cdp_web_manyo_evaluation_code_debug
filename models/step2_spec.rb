# 「データベースのデータを読み書きする際の時刻を、あなたの住んでいる地域の時刻に設定すること」のテストは国によって変更する必要がある
require 'rails_helper'

describe 'ステップ1', type: :model do
  describe '基本要件' do
    describe 'tasksテーブルのtitleカラムとcontentカラムに入力必須のバリデーションを設定すること' do
      it 'titleカラムに入力必須のバリデーションが設定されていること' do
        task = Task.create(title: '', content: 'task_content')
        expect(task).not_to be_valid
      end
      it 'contentカラムに入力必須のバリデーションが設定されていること' do
        task = Task.create(title: 'task_title', content: '')
        expect(task).not_to be_valid
      end
      it 'バリデーションに成功した場合、登録できること' do
        task = Task.create(title: 'task_title', content: 'task_content')
        expect(task).to be_valid
      end
    end
    describe 'データベースのデータを読み書きする際の時刻を、あなたの住んでいる地域の時刻に設定すること' do
      it 'created_atカラムに「+0900」が表示されること' do
        task = Task.create(title: 'task_title', content: 'task_content')
        expect(task.created_at.to_s).to include('+0900')
      end
    end
  end
end
