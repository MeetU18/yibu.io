class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :lockable, :timeoutable

  has_many :topics

  # user vote methods
  has_many :votes

  def up_vote(voteable)
    votes.find_or_create_by(voteable: voteable).up!
  end

  def down_vote(voteable)
    votes.find_or_create_by(voteable: voteable).down!
  end

  def unvote(voteable)
    votes.find_by(voteable: voteable).destroy
  end
end
