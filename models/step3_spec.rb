require 'rails_helper'

describe 'ステップ3', type: :model do
  describe '基本要件' do
    describe 'tasksテーブルのdeadline_on、priority、statusのそれぞれのカラムに入力必須のバリデーションを設定すること' do
      it 'deadline_onカラムに入力必須のバリデーションが設定されていること' do
        task = Task.create(title: 'task_title', description: 'task_description', deadline_on: "", priority: 0, status: 0)
        expect(task).not_to be_valid
      end
      it 'priorityカラムに入力必須のバリデーションが設定されていること' do
        task = Task.create(title: 'task_title', description: 'task_description', deadline_on: Date.today, priority: "", status: 0)
        expect(task).not_to be_valid
      end
      it 'statusカラムに入力必須のバリデーションが設定されていること' do
        task = Task.create(title: 'task_title', description: 'task_description', deadline_on: Date.today, priority: 0, status: "")
        expect(task).not_to be_valid
      end
      it 'バリデーションに成功した場合、登録できること' do
        task = Task.create(title: 'task_title', description: 'task_description', deadline_on: Date.today, priority: 0, status: 0)
        expect(task).to be_valid
      end
    end
  end
end
