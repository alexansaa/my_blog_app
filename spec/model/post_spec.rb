require 'rails_helper'

RSpec.describe Post, type: :model do
  tmp_user = User.new(name: 'myUser', photo: 'link photo', bio: 'my desc', posts_counter: '0')
  tmp_user.save
  subject { tmp_user.posts.create(title: 'Post 1', text: 'the text', comments_counter: 0, likes_counter: 0) }

  before { subject.save }

  it 'title should be present' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'comments_counter should be positive or zero, evaluate against nil' do
    subject.comments_counter = nil
    expect(subject).to_not be_valid
  end

  it 'comments_counter should be positive or zero, evaluate numerical negative value' do
    subject.comments_counter = -1
    expect(subject).to_not be_valid
  end

  it 'comments_counter should be positive or zero, evaluate against valid value' do
    subject.comments_counter = 0
    expect(subject).to be_valid
  end

  it 'likes_counter should be positive or zero, evaluate against nil' do
    subject.likes_counter = nil
    expect(subject).to_not be_valid
  end

  it 'likes_counter should be positive or zero, evaluate numerical negative value' do
    subject.likes_counter = -1
    expect(subject).to_not be_valid
  end

  it 'likes_counter should be positive or zero, evaluate against valid value' do
    subject.likes_counter = 0
    expect(subject).to be_valid
  end

  it 'returns the most recent comments' do
    comments1 = subject.comments.create(user: tmp_user, text: 'comment text')
    comments2 = subject.comments.create(user: tmp_user, text: 'comment text')
    comments3 = subject.comments.create(user: tmp_user, text: 'comment text')
    comments4 = subject.comments.create(user: tmp_user, text: 'comment text')
    comments5 = subject.comments.create(user: tmp_user, text: 'comment text')

    most_recent_comments = subject.most_recent_comments.to_a

    expect(most_recent_comments).to eq([comments5, comments4, comments3, comments2, comments1])
  end

  it 'returns the 5 most recent posts, even if there are more' do
    subject.comments.create(user: tmp_user, text: 'comment text')
    subject.comments.create(user: tmp_user, text: 'comment text')
    comments3 = subject.comments.create(user: tmp_user, text: 'comment text')
    comments4 = subject.comments.create(user: tmp_user, text: 'comment text')
    comments5 = subject.comments.create(user: tmp_user, text: 'comment text')
    comments6 = subject.comments.create(user: tmp_user, text: 'comment text')
    comments7 = subject.comments.create(user: tmp_user, text: 'comment text')

    most_recent_comments = subject.most_recent_comments.to_a

    expect(most_recent_comments).to eq([comments7, comments6, comments5, comments4, comments3])
  end
end
