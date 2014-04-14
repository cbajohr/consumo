# == Schema Information
#
# Table name: bookings
#
#  id            :integer          not null, primary key
#  user_id       :integer          not null
#  amount        :decimal(5, 2)
#  bookable_id   :integer
#  bookable_type :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#

class Booking < ActiveRecord::Base
  belongs_to  :user
  belongs_to  :bookable, polymorphic: true

  has_one     :related_booking, class_name: "Booking", foreign_key: :booking_id, dependent: :destroy
  belongs_to  :initial_booking, class_name: "Booking", foreign_key: :booking_id

  validates :amount, presence: true, numericality: true

  attr_accessor :receiver_id

  before_create :relate_booking, if: :booking_relation

  self.per_page = 10

  def booking_relation
    not self.receiver_id.nil?
  end

  private

  def relate_booking
    self.build_related_booking user: User.find(self.receiver_id), amount: (self.amount.to_f * -1.to_f), infotext: self.infotext
  end
end
