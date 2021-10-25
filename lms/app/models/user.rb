class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

        #  attr_accessible :email, :password, :password_confirmation, :remember_me, :role
        enum role: [:user, :librarian]
        before_save { self.email = email.downcase }
        has_many :books

      end
