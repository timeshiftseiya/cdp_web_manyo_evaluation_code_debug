require 'rails_helper'

RSpec.describe 'step1', type: :system do

  let!(:task) { Task.create(title: 'task_title', content: 'task_content') }

  describe '画面遷移要件' do
    describe '1.要件通りにパスのプレフィックスが生成されていること' do
      it '要件通りにパスのプレフィックスが生成されていること' do
        visit tasks_path
        visit new_task_path
        visit task_path(task)
        visit edit_task_path(task)
      end
      it 'ルートにアクセスした際、「Tasks Index Page」の画面タイトルが表示されること' do
        visit root_path
        expect(page).to have_content 'Tasks Index Page'
      end
    end
  end

end
