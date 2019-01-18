class User < ApplicationRecord
    has_many :posts
    has_many :post_likes
    has_many :post_comments
    has_many :follows
    has_many :followers, foreign_key: :follow_user_id, class_name:"Follow"
    before_create :convert_password
    
    
    def convert_password
        self.password = User.generate_password(self.password)
    end
    
    def self.generate_password(password)
        salt = "h!hgamcRAdh38bajhvgai17ysvb"
        Digest::MD5.hexdigest(salt + password)
    end
      VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i 
      validates :name, presence: true
      validates :email, presence: true, format: {with: VALID_EMAIL_REGEX}, uniqueness: true
      validates :password, presence: true
end
