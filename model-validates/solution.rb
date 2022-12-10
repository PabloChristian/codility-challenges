=begin
ActiveRecord validation is used in Ruby on Rails applications to guarantee
the consistency of data. It is defined in models's classes and is triggered by calling
valid? on them.

Your task is to write a User model with validations that check for the following requirements:after =>
* name attribute is non-nil and a non-empty string;
* email attribute is non-nil and a non-empty string;
* email attribute is unique;
* title attribute is one of 'Mrs', 'Ms', or 'Mr';
* age attribute is an integer greater than 0;
* age attribute can be nil;
* phone_number attribute starts with '+1' and is followed by 10 digits only: if this requirement
is not met, the error message for this attribute should be: "Sorry, only US phone numbers are allowed";
* password attribute has a length of between 6 and 20 characters;
* password_confirmation attribute is the same as password.
=end

class User < ActiveRecord::Base
  validates_presence_of :name, :email, :password, :title, :phone_number
  validates_uniqueness_of :email, :case_sensitive => false
  validates :name, presence: true, length: { minimum: 1 }, :allow_nil => false
  validates :email, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 1 }, :allow_nil => false
  validates :age, :allow_nil => true , numericality: { greater_than: 0 }
  validates :password, confirmation: true, presence: true, :allow_nil => false, length: { minimum: 6, maximum: 20 }
  validates :password_confirmation,  presence: true
  validates :title, presence: true, acceptance: { accept: ['Mrs', 'Ms', 'Mr'] }
  validate :phone_validation

  def phone_validation
    return if self.phone_number.nil?
    if !self.phone_number.start_with?("+1") || !self.phone_number.length.eql?(12)
      self.errors.add(:base, "Sorry, only US phone numbers are allowed")
    end
  end

  def title_attributes
    return if self.title.nil?
    if !self.title.eql?('Mrs') || !self.title.eql?('Ms') || self.title.eql?('Mr')
      self.errors.add(:base, 'Titles must be Mrs Ms or Mr.')
    end
  end
end
