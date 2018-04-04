require 'rails_helper'

describe 'User' do
  scenario 'can create a post' do
    user = User.create(name: 'User', email: 'user@mail.com', password: 'test')

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit user_path(user)

    click_on 'Add an Adventure'

    expect(current_path).to eq(new_user_post_path(user))

    fill_in 'post[title]', with: 'Adventure 1'
    fill_in 'post[location][state]', with: 'Colorado'
    select 'USA', from: 'post[location][country]'
    fill_in 'post[body]', with: 'A description of the adventure.'

    click_on 'Create Adventure'

    expect(current_path).to eq(user_path(user))
    expect(page).to have_content(Post.last.title)
  end

  context 'on their show page' do
    scenario 'can see their own posts on their show page' do

    end

    scenario 'can edit their own posts' do

    end

    scenario 'can delete their own posts' do

    end
  end

  context 'on another user\'s show page' do
    scenario 'can see someone else\'s posts' do

    end

    scenario 'can\'t edit someone else\'s posts' do

    end

    scenario 'can\'t delete someone else\'s posts' do

    end
  end
end