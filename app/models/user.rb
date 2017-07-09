class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :lockable, :timeoutable

  acts_as_paranoid

  validates :username, presence: true, uniqueness: true, length: 2..20

  has_many :topics

  # user vote methods
  has_many :votes

  # is site admin?
  def admin?
    AdminUtils.admin_emails.include? email
  end

  def up_vote(voteable)
    votes.find_or_create_by(voteable: voteable).tap(&:up!)
  end

  def down_vote(voteable)
    votes.find_or_create_by(voteable: voteable).tap(&:down!)
  end

  def unvote(voteable)
    votes.find_or_create_by(voteable: voteable).tap(&:unvote!)
  end
end
